<?php namespace App\Controllers\Api\Account;

require_once(APPPATH . 'ThirdParty/Stripe/init.php');

use App\Controllers\PrivateController;
use App\Models\PlansModel;
use App\Models\AppsModel;
use App\Models\TransactionsModel;
use App\Libraries\Uid;
use App\Libraries\Settings;
use Exception;
use Stripe\Charge;
use Stripe\Stripe;

class Deposit extends PrivateController
{
    private $plans;
    private $apps;
    private $transactions;
    private $uid;
    private $settings;

    /**
     * Create models, config and library's
     */
    function __construct()
    {
        $this->plans = new PlansModel();
        $this->apps = new AppsModel();
        $this->transactions = new TransactionsModel();
        $this->uid = new Uid();
        $this->settings = new Settings();
    }

    /**************************************************************************************
     * PUBLIC FUNCTIONS
     **************************************************************************************/

    /**
     * Get all active plans
     * @return mixed
     */
    public function plans()
    {
        $items = $this->plans->findAll();
        $list = [];
        $currency_code = $this->settings->get_config("currency_code");
        $currency_symbol = $this->settings->get_config("currency_symbol");
        foreach ($items as $item) {
            $list[] = [
                "id"       => (int) $item["id"],
                "count"    => (int) $item["count"],
                "price"    => $item["price"],
                "save"     => $item["save"],
                "currency" => $currency_code,
                "symbol"   => $currency_symbol
            ];
        }
        return $this->respond([
            "code" => 200,
            "list" => $list,
        ], 200);
    }

    /**
     * Start Stripe payment
     * @param string $uid
     * @param int $plan_id
     * @return mixed
     */
    public function make_pay(string $uid = "", int $plan_id = 0)
    {
        if (!$this->validate($this->stripe_validation_type())) {
            return $this->respond([
                "code"    => 400,
                "message" => $this->validator->getErrors(),
            ], 400);
        }
        $app = $this->apps
            ->where(["uid" => esc($uid), "user" => $this->user["id"]])
            ->select("id,name,link,uid,balance")
            ->first();
        if (!$app) {
            return $this->respond([
                "code"    => 400,
                "message" => [
                    "error" => lang("Message.message_14")
                ],
            ], 400);
        }
        $plan = $this->plans
            ->where(["id" => $plan_id])
            ->first();
        if (!$plan) {
            return $this->respond([
                "code"    => 400,
                "message" => [
                    "error" => lang("Message.message_48")
                ],
            ], 400);
        }
        $secret = $this->settings->get_config("stripe_secret_key");
        Stripe::setApiKey($secret);
        try {
            Charge::create([
                'amount'      => $plan["price"] * 100,
                'currency'    => $this->settings->get_config("currency_code"),
                'description' => $plan["count"]." ".lang("Fields.field_120")." ".$app["name"],
                'source'      => esc($this->request->getPost("token")),
            ]);
            $this->transactions->insert([
                "uid"       => $this->uid->create(),
                "user_id"   => $this->user["id"],
                "amount"    => $plan["price"],
                "app_id"    => $app["id"],
                "status"    => 1,
                "method_id" => 1,
                "quantity"  => $plan["count"]
            ]);
            $this->apps->update($app["id"], [
                "status"  => 1,
                "balance" => $app["balance"] + $plan["count"]
            ]);
            return $this->respond([
                "code" => 200
            ], 200);
        } catch (Exception $e) {
            return $this->respond([
                "code"    => 503,
                "message" => [
                    "error" => lang("Message.message_61")
                ],
            ], 503);
        }
    }

    /**************************************************************************************
     * PUBLIC FUNCTIONS
     **************************************************************************************/

    /**
     * Get validation rules for sign up
     * @return array
     */
    private function stripe_validation_type(): array
    {
        return [
            "token" => ["label" => lang("Fields.field_120"), "rules" => "required|max_length[200]"],
        ];
    }
}
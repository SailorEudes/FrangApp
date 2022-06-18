<?php
namespace App\Controllers\Api;

use App\Controllers\BaseController;
use App\Libraries\Settings;
use Config\Localization;

class Configuration extends BaseController
{
    private $config;
    private $settings;

    /**
     * Create models, config and library's
     */
    function __construct()
    {
        $this->config =  new Localization();
        $this->settings = new Settings();
    }

    /**************************************************************************************
     * PUBLIC FUNCTIONS
     **************************************************************************************/

    /**
     * Get language pack and site config
     * @return object
     */
    public function initial() : object
    {
        $data = [
            "code"     => 200,
            "result"   => [
                "language" => [
                    "values" => lang('App.lang'),
                    "list"   => $this->get_all_languages()
                ],
                "locale"   => $this->request->getLocale(),
                "configs"  => [
                    "logo"        => base_url("static/".$this->settings->get_config("site_logo")),
                    "google"      => [
                        "enabled" => (bool) $this->settings->get_config("google_enabled"),
                        "id"      => $this->settings->get_config("google_id")
                    ],
                    "stripe_key"  => $this->settings->get_config("stripe_publish_key"),
                    "ionic_icons" => $this->settings->get_config("ionic_icons")
                ]
            ]
        ];
        return $this->respond($data, $data['code']);
    }

    /**************************************************************************************
     * PRIVATE FUNCTIONS
     **************************************************************************************/

    /**
     * Get all languages from configs file
     * @return array
     */
    private function get_all_languages(): array
    {
        $session_language = $this->request->getLocale();
        $languages = [];
        foreach ($this->config->locals as $local) {
            $languages[] = [
                "name"     => $local["name"],
                "image"    => base_url("static/languages/".$local["image"]),
                "code"     => $local["code"],
                "selected" => $session_language === $local["code"]
            ];
        }
        return $languages;
    }
}
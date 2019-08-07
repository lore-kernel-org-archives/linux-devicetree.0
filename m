From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 2/4] net: phy: Add support for generic LED
 configuration through the DT
Date: Wed, 7 Aug 2019 20:18:58 +0200
Message-ID: <20190807181858.GB26047@lunn.ch>
References: <20190807170449.205378-1-mka@chromium.org>
 <20190807170449.205378-3-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807170449.205378-3-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> +static void of_phy_config_leds(struct phy_device *phydev)
> +{
> +	struct device_node *np, *child;
> +	struct phy_led_config cfg;
> +	const char *trigger;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_OF_MDIO) || !phydev->drv->config_led)
> +		return;
> +
> +	np = of_find_node_by_name(phydev->mdio.dev.of_node, "leds");
> +	if (!np)
> +		return;
> +
> +	for_each_child_of_node(np, child) {
> +		u32 led;
> +
> +		if (of_property_read_u32(child, "reg", &led))
> +			goto skip_config;
> +
> +		ret = of_property_read_string(child, "linux,default-trigger",
> +					      &trigger);
> +		if (ret)
> +			trigger = "none";
> +
> +		memset(&cfg, 0, sizeof(cfg));
> +
> +		if (!strcmp(trigger, "none")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_NONE;
> +		} else if (!strcmp(trigger, "phy-link")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK;
> +		} else if (!strcmp(trigger, "phy-link-10m")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_10M;
> +		} else if (!strcmp(trigger, "phy-link-100m")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_100M;
> +		} else if (!strcmp(trigger, "phy-link-1g")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_1G;
> +		} else if (!strcmp(trigger, "phy-link-10g")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_10G;
> +		} else if (!strcmp(trigger, "phy-link-activity")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK;
> +			cfg.trigger.activity = true;
> +		} else if (!strcmp(trigger, "phy-link-10m-activity")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_10M;
> +			cfg.trigger.activity = true;
> +		} else if (!strcmp(trigger, "phy-link-100m-activity")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_100M;
> +			cfg.trigger.activity = true;
> +		} else if (!strcmp(trigger, "phy-link-1g-activity")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_1G;
> +			cfg.trigger.activity = true;
> +		} else if (!strcmp(trigger, "phy-link-10g-activity")) {
> +			cfg.trigger.t = PHY_LED_TRIGGER_LINK_10G;
> +			cfg.trigger.activity = true;
> +		} else {
> +			phydev_warn(phydev, "trigger '%s' for LED%d is invalid\n",
> +				    trigger, led);
> +			goto skip_config;
> +		}
> +
> +		phydev->drv->config_led(phydev, led, &cfg);

We should not ignore the return value. I expect drivers will return
-EINVAL, or EOPNOTSUPP if asked to configure an LED in a way they
don't support. We need to report this. So i would add a phydev_warn:

> +			phydev_warn(phydev, "trigger '%s' for LED%d not supported\n",
> +				    trigger, led);

  Andrew

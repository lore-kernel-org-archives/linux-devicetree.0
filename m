From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Wed, 7 Aug 2019 20:24:42 +0200
Message-ID: <20190807182442.GC26047@lunn.ch>
References: <20190807170449.205378-1-mka@chromium.org>
 <20190807170449.205378-5-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190807170449.205378-5-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> +static int rtl8211e_config_led(struct phy_device *phydev, int led,
> +			       struct phy_led_config *cfg)
> +{
> +	u16 lacr_bits = 0, lcr_bits = 0;
> +	int oldpage, ret;
> +
> +	switch (cfg->trigger.t) {
> +	case PHY_LED_TRIGGER_LINK:
> +		lcr_bits = 7 << (led * 4);
> +		break;
> +
> +	case PHY_LED_TRIGGER_LINK_10M:
> +		lcr_bits = 1 << (led * 4);
> +		break;
> +
> +	case PHY_LED_TRIGGER_LINK_100M:
> +		lcr_bits = 2 << (led * 4);
> +		break;
> +
> +	case PHY_LED_TRIGGER_LINK_1G:
> +		lcr_bits |= 4 << (led * 4);
> +		break;
> +
> +	case PHY_LED_TRIGGER_NONE:
> +		break;
> +
> +	default:
> +		phydev_warn(phydev,
> +			    "unknown trigger for LED%d: %d\n",
> +			    led, cfg->trigger.t);

Lets do this once in the core, not in every driver.

> +		return -EINVAL;
> +	}
> +
> +	if (cfg->trigger.activity)
> +		lacr_bits = BIT(RLT8211E_LACR_LEDACTCTRL_SHIFT + led);
> +
> +	rtl8211e_disable_eee_led_mode(phydev);
> +
> +	oldpage = rtl8211x_select_ext_page(phydev, 0x2c);
> +	if (oldpage < 0) {
> +		phydev_err(phydev, "failed to select extended page: %d\n", oldpage);
> +		return oldpage;
> +	}
> +
> +	ret = __phy_modify(phydev, RTL8211E_LACR,
> +			   LACR_MASK(led), lacr_bits);
> +	if (ret) {
> +		phydev_err(phydev, "failed to write LACR reg: %d\n",
> +			   ret);
> +		goto err;
> +	}
> +
> +	ret = __phy_modify(phydev, RTL8211E_LCR,
> +			   LCR_MASK(led), lcr_bits);
> +	if (ret)
> +		phydev_err(phydev, "failed to write LCR reg: %d\n",
> +			   ret);

That is a lot of phydev_err() calls. The rest of the driver does not
use any. Also, mdio operations are very unlikely to fail. So i would
just leave it to the layer above to report there is a problem.

     Andrew

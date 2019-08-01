From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 4/4] net: phy: realtek: configure RTL8211E LEDs
Date: Thu, 01 Aug 2019 17:04:07 -0400 (EDT)
Message-ID: <20190801.170407.2164489969623955445.davem@davemloft.net>
References: <20190801190759.28201-1-mka@chromium.org>
        <20190801190759.28201-5-mka@chromium.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801190759.28201-5-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mka@chromium.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

From: Matthias Kaehlcke <mka@chromium.org>
Date: Thu,  1 Aug 2019 12:07:59 -0700

> +static int rtl8211e_config_leds(struct phy_device *phydev)
> +{
> +	int i, oldpage, ret;
> +	u16 lacr_bits = 0, lcr_bits = 0;
> +	u16 lacr_mask = RLT8211E_LACR_LEDACTCTRL_MASK;
> +	u16 lcr_mask = RTL8211E_LCR_LEDCTRL_MASK;
> +	bool eed_led_mode_disabled = false;

Please use reverse christmas tree ordering here.

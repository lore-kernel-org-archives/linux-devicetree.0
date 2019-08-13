From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 4/4] net: phy: realtek: Add LED configuration support
 for RTL8211E
Date: Tue, 13 Aug 2019 22:14:11 +0200
Message-ID: <20190813201411.GL15047@lunn.ch>
References: <20190813191147.19936-1-mka@chromium.org>
 <20190813191147.19936-5-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813191147.19936-5-mka@chromium.org>
Sender: netdev-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> +static int rtl8211e_config_led(struct phy_device *phydev, int led,
> +			       struct phy_led_config *cfg)
> +{
> +	u16 lacr_bits = 0, lcr_bits = 0;
> +	int oldpage, ret;
> +

You should probably check that led is 0 or 1. 

Otherwise this looks good.

	  Andrew

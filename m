From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 2/3] lan78xx: Read LED states from Device Tree
Date: Thu, 19 Apr 2018 17:19:21 +0200
Message-ID: <20180419151921.GC29658@lunn.ch>
References: <1524148325-78945-1-git-send-email-phil@raspberrypi.org>
 <1524148325-78945-4-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524148325-78945-4-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> @@ -2077,6 +2085,28 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
>  	mii_adv = (u32)mii_advertise_flowctrl(dev->fc_request_control);
>  	phydev->advertising |= mii_adv_to_ethtool_adv_t(mii_adv);
>  
> +	if (phydev->mdio.dev.of_node) {
> +		u32 reg;
> +		int len;
> +
> +		len = of_property_count_elems_of_size(phydev->mdio.dev.of_node,
> +						      "microchip,led-modes",
> +						      sizeof(u32));
> +		if (len >= 0) {
> +			/* Ensure the appropriate LEDs are enabled */
> +			lan78xx_read_reg(dev, HW_CFG, &reg);
> +			reg &= ~(HW_CFG_LED0_EN_ |
> +				 HW_CFG_LED1_EN_ |
> +				 HW_CFG_LED2_EN_ |
> +				 HW_CFG_LED3_EN_);
> +			reg |= (len > 0) * HW_CFG_LED0_EN_ |
> +				(len > 1) * HW_CFG_LED1_EN_ |
> +				(len > 2) * HW_CFG_LED2_EN_ |
> +				(len > 3) * HW_CFG_LED3_EN_;
> +			lan78xx_write_reg(dev, HW_CFG, reg);
> +		}
> +	}
> +

Humm. Not nice. But i cannot think of a cleaner way of doing this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

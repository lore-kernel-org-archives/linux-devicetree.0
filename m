From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] lan78xx: Read LED modes from Device Tree
Date: Thu, 12 Apr 2018 16:36:55 +0200
Message-ID: <20180412143655.GQ28963@lunn.ch>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-4-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523541336-145953-4-git-send-email-phil@raspberrypi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> @@ -2097,6 +2098,25 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
>  		(void)lan78xx_set_eee(dev->net, &edata);
>  	}
>  
> +	if (!of_property_read_u32_array(dev->udev->dev.of_node,
> +					"microchip,led-modes",
> +					led_modes, ARRAY_SIZE(led_modes))) {
> +		u32 reg;
> +		int i;
> +
> +		reg = phy_read(phydev, 0x1d);
> +		for (i = 0; i < ARRAY_SIZE(led_modes); i++) {
> +			reg &= ~(0xf << (i * 4));
> +			reg |= (led_modes[i] & 0xf) << (i * 4);
> +		}
> +		(void)phy_write(phydev, 0x1d, reg);

Poking PHY registers directly from the MAC driver is not always a good
idea. This MAC driver does that in a few places :-(

What do we know about the PHY? It is built into the device or is it
external? If it is external, how do you know the LED register is at
0x1d?

The safest place to do this is in the PHY driver, and place these OF
properties into the PHY node.

	   Andrew

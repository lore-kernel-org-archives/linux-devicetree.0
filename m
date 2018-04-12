From: <Woojung.Huh@microchip.com>
Subject: RE: [PATCH 3/4] lan78xx: Read LED modes from Device Tree
Date: Thu, 12 Apr 2018 15:21:09 +0000
Message-ID: <9235D6609DB808459E95D78E17F2E43D40D17852@CHN-SV-EXMX02.mchp-main.com>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-4-git-send-email-phil@raspberrypi.org>
 <20180412143655.GQ28963@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180412143655.GQ28963@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, phil@raspberrypi.org
Cc: UNGLinuxDriver@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, mchehab@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, akpm@linux-foundation.org, rdunlap@infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > @@ -2097,6 +2098,25 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
> >  		(void)lan78xx_set_eee(dev->net, &edata);
> >  	}
> >
> > +	if (!of_property_read_u32_array(dev->udev->dev.of_node,
> > +					"microchip,led-modes",
> > +					led_modes, ARRAY_SIZE(led_modes))) {
> > +		u32 reg;
> > +		int i;
> > +
> > +		reg = phy_read(phydev, 0x1d);
> > +		for (i = 0; i < ARRAY_SIZE(led_modes); i++) {
> > +			reg &= ~(0xf << (i * 4));
> > +			reg |= (led_modes[i] & 0xf) << (i * 4);
> > +		}
> > +		(void)phy_write(phydev, 0x1d, reg);
> 
> Poking PHY registers directly from the MAC driver is not always a good
> idea. This MAC driver does that in a few places :-(
Agree but, some are for workaround unfortunately.

> What do we know about the PHY? It is built into the device or is it
> external? If it is external, how do you know the LED register is at
> 0x1d?
This register is not defined in include/linux/microchipphy.h. :(
Also agree that there parts should be applied to internal PHY only.

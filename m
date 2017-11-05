From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 3/4] RFC: net: dsa: Add bindings for Realtek SMI DSAs
Date: Mon, 6 Nov 2017 00:48:31 +0100
Message-ID: <20171105234831.GA24822@lunn.ch>
References: <20171105231909.5599-1-linus.walleij@linaro.org>
 <20171105231909.5599-4-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171105231909.5599-4-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> This interrupt construction is similar to how we handle
> interrupt controllers inside PCI bridges etc.

Hi Linus

Your interrupt handling is going in the right direction, but needs
further work. The PHY interrupt is a phy property, so should be in the
PHY node in device tree.

The Marvell driver gives an example of this, and
vf610-zii-dev-rev-c.dts is an example DT blob you can look at.

> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +		port@0 {
> +			reg = <0>;
> +			label = "lan0";

So here, you should have a

   	     	    	phy-handle = <&phy0>;

linking this MAC to the PHY connected to it.


> +		};

And then an MDIO bus, listing the PHYs

               mdio {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        phy0: phy@0 {
                                reg = <0>;
				interrupt-parent = <&switch_intc>;
				interrupts = <0>;
                        };

It is here you list the interrupts. And the PHY subsystem will link
the interrupt to the PHY when it enumerate the MDIO bus.

You have most of the code already for implementing the MDIO bus. The
rest you can probably borrow from the mv88e6xxx driver.

     Andrew

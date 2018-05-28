From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4 RFCv2] net: dsa: Add bindings for Realtek SMI DSAs
Date: Mon, 28 May 2018 20:54:25 +0200
Message-ID: <20180528185425.GD27177@lunn.ch>
References: <20180528174752.6806-1-linus.walleij@linaro.org>
 <20180528174752.6806-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180528174752.6806-3-linus.walleij@linaro.org>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +Examples:
> +
> +switch {
> +	compatible = "realtek,rtl8366rb";
> +	/* 22 = MDIO (has input reads), 21 = MDC (clock, output only) */
> +	mdc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
> +	mdio-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
> +	reset-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
> +
> +	switch_intc: interrupt-controller {
> +		/* GPIO 15 provides the interrupt */
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +	};
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +		port@0 {
> +			reg = <0>;
> +			label = "lan0";
> +			phy-handle = <&phy0>;
> +		};
> +		port@1 {
> +			reg = <1>;
> +			label = "lan1";
> +			phy-handle = <&phy1>;
> +		};
> +		port@2 {
> +			reg = <2>;
> +			label = "lan2";
> +			phy-handle = <&phy2>;
> +		};
> +		port@3 {
> +			reg = <3>;
> +			label = "lan3";
> +			phy-handle = <&phy3>;
> +		};
> +		port@4 {
> +			reg = <4>;
> +			label = "wan";
> +			phy-handle = <&phy4>;
> +		};
> +		port@5 {
> +			reg = <5>;
> +			label = "cpu";
> +			ethernet = <&gmac0>;
> +			phy-mode = "rgmii";
> +			fixed-link {
> +				speed = <1000>;
> +				full-duplex;
> +			};
> +		};
> +	};
> +
> +	mdio {
> +		compatible = "realtek,smi-mdio", "dsa-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		phy0: phy@0 {
> +			reg = <0>;
> +			interrupt-parent = <&switch_intc>;
> +			interrupts = <0>;
> +		};

Hi Linus

This all looks correct, and as i suggested a while ago.

But since then, i discovered something, which allows this to be
simplified.

The mdio bus structure has an irq array. If you put the interrupt
numbers into this array, when the phy is connected, it will use that
interrupt. You then don't need a lot of this in your device tree.

Take a look at:

commit 6f88284f3bd77a0e51de22d4956f07557bcc0dbf
Author: Andrew Lunn <andrew@lunn.ch>
Date:   Sat Mar 17 20:32:05 2018 +0100

    net: dsa: mv88e6xxx: Add MDIO interrupts for internal PHYs
    
    When registering an MDIO bus, it is possible to pass an array of
    interrupts, one per address on the bus. phylib will then associate the
    interrupt to the PHY device, if no other interrupt is provided.
    
    Some of the global2 interrupts are PHY interrupts. Place them into the
    MDIO bus structure.


    Andrew

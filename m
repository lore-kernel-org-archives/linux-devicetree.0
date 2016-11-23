From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH] ARM: dts: Add support for Turris Omnia
Date: Wed, 23 Nov 2016 01:35:05 +0100
Message-ID: <20161123003505.GL2691@lunn.ch>
References: <1479851991.26813.2@smtp.gmail.com>
 <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479859770-9375-1-git-send-email-tmshlvck@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomas Hlavacek <tmshlvck@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> @@ -0,0 +1,279 @@
> +/*
> + * Device Tree file for the Turris Omnia
> + * Schematic available at https://www.turris.cz/doc/_media/rtrom01-schema.pdf

Hi Tomas

Cool that there is a link to the schematics. But please could you put
it lower down. It is more likely to be seen if it comes after the
copyright and license section.

> +			sdhci@d8000 {
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&sdhci_pins>;
> +				status = "okay";
> +
> +				bus-width = <8>;
> +				no-1-8-v;
> +				non-removable;
> +			};

> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	status = "okay";
> +
> +	i2cmux@70 {
> +		compatible = "nxp,pca9547";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		status = "okay";
> +
> +		/* Channel 1: Routed to PCIe0/mSATA connector (CN7A).
> +		 * Channel 2: Routed to PCIe1/USB2 connector (CN61A).
> +		 * Channel 3: Routed to PCIe2 connector (CN62A).
> +		 * Channel 4: Routed to SFP+.
> +		 * Channel 5: ATSHA204A at address 0x64.
> +		 * Channel 6: Routed to user pin header CN11.
> +		 */

I've not looked at how the pca9547 works.... Will it instantiate a bus
only if there is a node in the device tree with a reg property?

What i'm thinking is that it is possible to indicate to the i2c core
that a device is on a bus using echo to a file. But this only works if
the bus exists. You could for example say using echo that there is an
at24 EEPROM on channel 4 and get access to the EEPROM inside the SFP
module. But that only works if the i2c bus exists. Does it?

No leds? No buttons via gpio-keys?

   Andrew

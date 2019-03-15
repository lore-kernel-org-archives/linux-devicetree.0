From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: Add support for the RerVision
 H3-DVK board
Date: Fri, 15 Mar 2019 13:35:15 +0100
Message-ID: <c1d9d2df993f1b6313f48d41631eb80d9f1ae109.camel@bootlin.com>
References: <20190314130656.8010-1-paul.kocialkowski@bootlin.com>
         <20190314155011.znrhrxp6jyrxdodt@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314155011.znrhrxp6jyrxdodt@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, 2019-03-14 at 16:50 +0100, Maxime Ripard wrote:
> On Thu, Mar 14, 2019 at 02:06:56PM +0100, Paul Kocialkowski wrote:
> > This is an H3-based board that sticks close to the reference design.
> > 
> > Supported features:
> > * UART
> > * DRAM
> > * MMC
> > * eMMC
> > * Ethernet
> > * USB host
> > * USB peripheral
> > * HDMI
> > 
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  arch/arm/boot/dts/Makefile                   |   1 +
> >  arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts | 119 +++++++++++++++++++
> >  2 files changed, 120 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index bd40148a15b2..8db275b75214 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1078,6 +1078,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> >  	sun8i-h3-orangepi-plus.dtb \
> >  	sun8i-h3-orangepi-plus2e.dtb \
> >  	sun8i-h3-orangepi-zero-plus2.dtb \
> > +	sun8i-h3-rervision-dvk.dtb \
> >  	sun8i-r16-bananapi-m2m.dtb \
> >  	sun8i-r16-nintendo-nes-classic.dtb \
> >  	sun8i-r16-nintendo-super-nes-classic.dtb \
> > diff --git a/arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts b/arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts
> > new file mode 100644
> > index 000000000000..94b71e064eb6
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun8i-h3-rervision-dvk.dts
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2019 Bootlin
> > + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "sun8i-h3.dtsi"
> > +#include "sunxi-common-regulators.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +	model = "RerVision H3-DVK";
> > +	compatible = "rervision,h3-dvk", "allwinner,sun8i-h3";
> > +
> > +	aliases {
> > +		ethernet0 = &emac;
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +
> > +	connector {
> > +		compatible = "hdmi-connector";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_connector_input: endpoint {
> > +				remote-endpoint = <&hdmi_connector_output>;
> 
> Those are pretty long labels, how would you feel about hdmi_con_in and
> hdmi_out_con, as we've used on all the other boards?

Sure, let's go with label names that match what is done on other
boards!

> > +&mmc2_8bit_pins {
> > +	drive-strength = <40>;
> > +	bias-pull-up;
> > +};
> 
> bias-pull-up is already set by default, and a 30mA drive strength
> should cover what the spec asks for. Did you encounter any issue with
> this?

You're right, I don't need to set this in particular and the eMMC works
just as well with the defaults.

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

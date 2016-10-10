From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] MIPS: DTS: img: add device tree for Marduk board
Date: Mon, 10 Oct 2016 09:21:52 -0500
Message-ID: <20161010142152.GA7920@rob-hp-laptop>
References: <1475757094-31089-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1475757094-31089-2-git-send-email-rahul.bedarkar@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475757094-31089-2-git-send-email-rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 06, 2016 at 06:01:34PM +0530, Rahul Bedarkar wrote:
> Add support for Imagination Technologies' Marduk board which is based
> on Pistachio SoC. It is also known as Creator Ci40. Marduk is legacy
> name and will be there for decades.
> 
> Documentation for this board can be found on
> https://docs.creatordev.io/ci40/
> 
> This patch adds initial support for board with following peripherals:
> 
> * PWM based heartbeat LED
> * GPIO based buttons
> * SPI NOR flash on SPI1
> * UART0 and UART1
> * SD card
> * Ethernet
> * USB
> * PWM
> * ADC
> * I2C
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/mips/img/pistachio-marduk.txt         |  10 ++
>  MAINTAINERS                                        |   6 +
>  arch/mips/boot/dts/img/Makefile                    |   9 ++
>  arch/mips/boot/dts/img/pistachio_marduk.dts        | 163 +++++++++++++++++++++
>  4 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
>  create mode 100644 arch/mips/boot/dts/img/Makefile
>  create mode 100644 arch/mips/boot/dts/img/pistachio_marduk.dts
> 
> diff --git a/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt b/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
> new file mode 100644
> index 0000000..2d5126d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
> @@ -0,0 +1,10 @@
> +Imagination Technologies' Pistachio SoC based Marduk Board
> +==========================================================
> +
> +Compatible string must be "img,pistachio-marduk", "img,pistachio"
> +
> +Hardware and other related documentation is available at
> +https://docs.creatordev.io/ci40/
> +
> +It is also known as Creator Ci40. Marduk is legacy name and will
> +be there for decades.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98bcf06..8e6c962b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7515,6 +7515,12 @@ W:	http://www.kernel.org/doc/man-pages
>  L:	linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
>  
> +MARDUK (CREATOR CI40) DEVICE TREE SUPPORT
> +M:	Rahul Bedarkar <rahul.bedarkar-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> +L:	linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> +S:	Maintained
> +F:	arch/mips/boot/dts/img/pistachio_marduk.dts
> +
>  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>  M:	Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>  M:	Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
> diff --git a/arch/mips/boot/dts/img/Makefile b/arch/mips/boot/dts/img/Makefile
> new file mode 100644
> index 0000000..69a65f0
> --- /dev/null
> +++ b/arch/mips/boot/dts/img/Makefile
> @@ -0,0 +1,9 @@
> +dtb-$(CONFIG_MACH_PISTACHIO)	+= pistachio_marduk.dtb
> +
> +obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
> +
> +# Force kbuild to make empty built-in.o if necessary
> +obj-				+= dummy.o
> +
> +always				:= $(dtb-y)
> +clean-files			:= *.dtb *.dtb.S
> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
> new file mode 100644
> index 0000000..378381e
> --- /dev/null
> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
> @@ -0,0 +1,163 @@
> +/*
> + * Copyright (C) 2015, 2016 Imagination Technologies Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * IMG Marduk board is also known as Creator Ci40.
> + */
> +
> +/dts-v1/;
> +
> +#include "pistachio.dtsi"
> +
> +/ {
> +	model = "IMG Marduk (Creator Ci40)";
> +	compatible = "img,pistachio-marduk", "img,pistachio";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		ethernet0 = &enet;
> +		spi0 = &spfi0;
> +		spi1 = &spfi1;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/sda1 rootwait ro lpj=723968";
> +		stdout-path = "serial1:115200";
> +	};
> +
> +	memory {

Is 0 the actual base, or that gets filled in by bootloader? If the 
formet, add unit address.

> +		device_type = "memory";
> +		reg =  <0x00000000 0x08000000>;
> +	};
> +
> +	reg_1v8: fixed-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "aux_adc_vref";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +	};
> +
> +	internal_dac_supply: internal_dac_supply {

Don't use '_' in node names.

> +		compatible = "regulator-fixed";
> +		regulator-name = "internal_dac_supply";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	pwm_leds {

Just 'leds'.

> +		compatible = "pwm-leds";
> +		heartbeat {
> +			label = "marduk:red:heartbeat";
> +			pwms = <&pwm 3 300000>;
> +			max-brightness = <255>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	gpio_keys {

keys {

> +		compatible = "gpio-keys";
> +		button@1 {
> +			label = "Button 1";
> +			linux,code = <0x101>; /* BTN_1 */
> +			gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
> +		};
> +		button@2 {
> +			label = "Button 2";
> +			linux,code = <0x102>; /* BTN_2 */
> +			gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&internal_dac {
> +	VDD-supply = <&internal_dac_supply>;
> +};
> +
> +&spfi1 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&spim1_pins>, <&spim1_quad_pins>, <&spim1_cs0_pin>,
> +		    <&spim1_cs1_pin>;
> +	pinctrl-names = "default";
> +	cs-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>, <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";

This should have the specific part too.

> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +	assigned-clock-rates = <114278400>, <1843200>;
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";
> +};
> +
> +&enet {
> +	status = "okay";
> +};
> +
> +&pin_enet {
> +	drive-strength = <2>;
> +};
> +
> +&pin_enet_phy_clk {
> +	drive-strength = <2>;
> +};
> +
> +&sdhost {
> +	status = "okay";
> +	bus-width = <4>;
> +	disable-wp;
> +};
> +
> +&pin_sdhost_cmd {
> +	drive-strength = <2>;
> +};
> +
> +&pin_sdhost_data {
> +	drive-strength = <2>;
> +};
> +
> +&pwm {
> +	status = "okay";
> +
> +	pinctrl-0 = <&pwmpdm0_pin>, <&pwmpdm1_pin>, <&pwmpdm2_pin>,
> +		    <&pwmpdm3_pin>;
> +	pinctrl-names = "default";
> +};
> +
> +&adc {
> +	status = "okay";
> +	vref-supply = <&reg_1v8>;
> +	adc-reserved-channels = <0x10>;
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	tpm@20 {
> +		compatible = "infineon,slb9645tt";
> +		reg = <0x20>;
> +	};
> +
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +};
> -- 
> 2.6.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

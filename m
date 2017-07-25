From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: imx: add CX9020 Embedded PC device tree
Date: Tue, 25 Jul 2017 15:59:35 +0800
Message-ID: <20170725075934.GA20064@dragon>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
 <20170721040640.31424-1-linux-kernel-dev@beckhoff.com>
 <20170721040640.31424-3-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170721040640.31424-3-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 21, 2017 at 06:06:40AM +0200, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> 
> The CX9020 differs from i.MX53 Quick Start Board by:
> - use uart2 instead of uart1
> - DVI-D connector instead of VGA
> - no audio
> - no SATA connector
> - CCAT FPGA connected to emi
> - enable rtc
> 
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

Where is the patch 1/2?

> 
> ---
> 
> v4:
> - move alternative UART2 pinmux settings to imx53-pinfunc.h
> - fix copyright notice and model name to clearify cx9020 is a
>   Beckhoff board and not from Freescale/NXP/Qualcomm
> - add "bhf,cx9020" compatible
> - remove ccat node and pin configuration as long as the ccat
>   driver is not mainlined
> - use dvi-connector + ti,tfp410 instead of panel-simple
> - add newlines between property list and child nodes
> - replace underscores in node names with hypens
> - replace magic number 0 with polarity defines from
>   include/dt-bindings/gpio/gpio.h
> - move rtc node into imx53.dtsi, change it's name into 'srtc',
>   to avoid a conflict with 'rtc' node in imx53-m53.dtsi
> - rename regulator-3p2v
> - drop imx53-qsb container node
> - make iomux configuration explicit
> - remove unused audmux
> - remove unused led_pin_gpio3_23 configuration
> - use blue gpio-leds as disk-activity indicators for mmc0 and mmc1
> - add mmc indicator leds to sdhc pingroups
> - keep node names in alphabetical order
> - remove unused sata and ssi2
> - remove unused pin configs from hoggrp
> - add entry for imx53-cx9020.dts to MAINTAINERS
> 
> v3: add missig changelog
> v2:
> - keep alphabetic order of dts/Makefile
> - configure uart2 with 'fsl,dte-mode'
> - use display-0 and panel-0 as node names
> - remove unnecessary "simple-bus" for fixed regulators
> 
> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> ---
>  MAINTAINERS                        |   1 +

I do not take the changes on this file.

>  arch/arm/boot/dts/Makefile         |   1 +
>  arch/arm/boot/dts/imx53-cx9020.dts | 295 +++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx53-pinfunc.h  |   4 +
>  arch/arm/boot/dts/imx53.dtsi       |   9 ++

Please have separate patches for imx53-pinfunc.h and imx53.dtsi.  Do not
mix them up with board support dts changes.

>  5 files changed, 310 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx53-cx9020.dts
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bf282843dc2..1bd06328f79b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1176,6 +1176,7 @@ ARM/BECKHOFF SUPPORT
>  M:	Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/bhf.txt
> +F:	arch/arm/boot/dts/imx53-cx9020.dts
>  
>  ARM/CALXEDA HIGHBANK ARCHITECTURE
>  M:	Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 4b17f35dc9a7..f0ba9be523e0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -340,6 +340,7 @@ dtb-$(CONFIG_SOC_IMX51) += \
>  	imx51-ts4800.dtb
>  dtb-$(CONFIG_SOC_IMX53) += \
>  	imx53-ard.dtb \
> +	imx53-cx9020.dtb \
>  	imx53-m53evk.dtb \
>  	imx53-mba53.dtb \
>  	imx53-qsb.dtb \
> diff --git a/arch/arm/boot/dts/imx53-cx9020.dts b/arch/arm/boot/dts/imx53-cx9020.dts
> new file mode 100644
> index 000000000000..c4f9c89668c2
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx53-cx9020.dts
> @@ -0,0 +1,295 @@
> +/*
> + * Copyright 2017 Beckhoff Automation GmbH & Co. KG
> + * based on imx53-qsb.dts
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx53.dtsi"
> +
> +/ {
> +	model = "Beckhoff CX9020 Embedded PC";
> +	compatible = "bhf,cx9020", "fsl,imx53";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	memory {
> +		reg = <0x70000000 0x20000000>,
> +		      <0xb0000000 0x20000000>;
> +	};
> +
> +	display-0 {
> +		#address-cells =<1>;
> +		#size-cells = <0>;
> +		compatible = "fsl,imx-parallel-display";
> +		interface-pix-fmt = "rgb24";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ipu_disp0>;
> +		status = "okay";

This status line is not necessary.  We usually use "okay" to toggle the
status which is set "disabled" in <soc>.dtsi.

> +
> +		port@0 {
> +			reg = <0>;
> +
> +			display0_in: endpoint {
> +				remote-endpoint = <&ipu_di0_disp0>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			display0_out: endpoint {
> +				remote-endpoint = <&tfp410_in>;
> +			};
> +		};
> +	};
> +
> +	dvi-connector {
> +		compatible = "dvi-connector";
> +		ddc-i2c-bus = <&i2c2>;
> +		digital;
> +
> +		port {
> +			dvi_connector_in: endpoint {
> +				remote-endpoint = <&tfp410_out>;
> +			};
> +		};
> +	};
> +
> +	dvi-converter {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "ti,tfp410";
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			tfp410_in: endpoint {
> +				remote-endpoint = <&display0_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			tfp410_out: endpoint {
> +				remote-endpoint = <&dvi_connector_in>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pwr-r {
> +			gpios = <&gpio3 22 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		pwr-g {
> +			gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		pwr-b {
> +			gpios = <&gpio3 23 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		sd1-b {
> +			linux,default-trigger = "mmc0";
> +			gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		sd2-b {
> +			linux,default-trigger = "mmc1";
> +			gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	regulator-3p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P2V";
> +		regulator-min-microvolt = <3200000>;
> +		regulator-max-microvolt = <3200000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb_vbus: regulator {

The node name "regulator" is too generic.  The "regulator-vbus"
might be the one you want to use.

Shawn

> +		compatible = "regulator-fixed";
> +		regulator-name = "usb_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio7 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

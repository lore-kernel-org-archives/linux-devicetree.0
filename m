From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1] ARM: dts: nitrogen6x: add CAN support
Date: Thu, 21 May 2015 09:33:52 +0800
Message-ID: <20150521013351.GK24844@dragon>
References: <1432158569-4415-1-git-send-email-ps.report@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432158569-4415-1-git-send-email-ps.report-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Seiderer <ps.report-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 20, 2015 at 11:49:29PM +0200, Peter Seiderer wrote:
> Regulator stuff copied from imx6qdl-tx6.dtsi, pin configuration
> taken from Boundary Devices linux kernel tree ([1] and [2]).
> 
> [1] https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_3.10.17_1.0.2_ga/arch/arm/boot/dts/imx6qdl-nitrogen6x.dts
> [2] https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_3.10.17_1.0.2_ga/arch/arm/boot/dts/imx6qdl.dtsi
> 
> Signed-off-by: Peter Seiderer <ps.report-hi6Y0CQ0nG0@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> index fd096dc..1c415e4 100644
> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> @@ -54,6 +54,17 @@
>  			gpio = <&gpio3 22 0>;
>  			enable-active-high;
>  		};
> +
> +		reg_can_xcvr: regulator@3 {
> +			compatible = "regulator-fixed";
> +			reg = <3>;
> +			regulator-name = "CAN XCVR";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_can_xcvr>;
> +			gpio = <&gpio1 2 GPIO_ACTIVE_HIGH>;
> +		};
>  	};
>  
>  	gpio-keys {
> @@ -138,6 +149,13 @@
>  	status = "okay";
>  };
>  
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can1_1>;
> +	xceiver-supply = <&reg_can_xcvr>;
> +	status = "okay";
> +};
> +
>  &ecspi1 {
>  	fsl,spi-num-chipselects = <1>;
>  	cs-gpios = <&gpio3 19 0>;
> @@ -234,6 +252,20 @@
>  			>;
>  		};
>  
> +		pinctrl_can1_1: can1grp-1 {

The '_1' suffix is meaningless.

		pinctrl_can1: can1grp {

Shawn

> +			fsl,pins = <
> +				MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX 0x80000000
> +				MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX 0x80000000
> +			>;
> +		};
> +
> +		pinctrl_can_xcvr: can-xcvrgrp {
> +			fsl,pins = <
> +				/* Flexcan XCVR enable */
> +				MX6QDL_PAD_GPIO_2__GPIO1_IO02		0x1b0b0
> +			>;
> +		};
> +
>  		pinctrl_ecspi1: ecspi1grp {
>  			fsl,pins = <
>  				MX6QDL_PAD_EIM_D17__ECSPI1_MISO		0x100b1
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

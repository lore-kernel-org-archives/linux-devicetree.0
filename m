From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: move flexcan1 configuration to hummingboard
Date: Sun, 19 Jan 2014 11:26:15 +0800
Message-ID: <20140119032613.GE16158@S2101-09.ap.freescale.net>
References: <20140116182211.GX15937@n2100.arm.linux.org.uk>
 <E1W3rab-00009u-5I@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1W3rab-00009u-5I-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 06:22:49PM +0000, Russell King wrote:
> Flexcan1 is not used on the cubox-i, so move it out of the microsom.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

The patch will not apply against the branch/tag - imx-dt-3.14 I'm
sending to arm-soc.  Please re-generate it against the tag.

Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/boot/dts/imx6dl-hummingboard.dts | 13 +++++++++++++
>  arch/arm/boot/dts/imx6qdl-microsom.dtsi   | 13 -------------
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-hummingboard.dts b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> index 6184b0366926..e22f3d855c02 100644
> --- a/arch/arm/boot/dts/imx6dl-hummingboard.dts
> +++ b/arch/arm/boot/dts/imx6dl-hummingboard.dts
> @@ -36,6 +36,12 @@
>  	};
>  };
>  
> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hummingboard_flexcan1>;
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c1_1>;
> @@ -53,6 +59,13 @@
>  
>  &iomuxc {
>  	hummingboard {
> +		pinctrl_hummingboard_flexcan1: hummingboard-flexcan1 {
> +			fsl,pins = <
> +				MX6QDL_PAD_SD3_CLK__FLEXCAN1_RX 0x80000000
> +				MX6QDL_PAD_SD3_CMD__FLEXCAN1_TX 0x80000000
> +			>;
> +		};
> +
>  		pinctrl_hummingboard_gpio1_2: hummingboard-gpio1_2 {
>  			fsl,pins = <
>  				MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000
> diff --git a/arch/arm/boot/dts/imx6qdl-microsom.dtsi b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
> index 8aa31a842236..965ac4c1f509 100644
> --- a/arch/arm/boot/dts/imx6qdl-microsom.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-microsom.dtsi
> @@ -36,21 +36,8 @@
>  	};
>  };
>  
> -&can1 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_microsom_flexcan1>;
> -	status = "okay";
> -};
> -
>  &iomuxc {
>  	microsom {
> -		pinctrl_microsom_flexcan1: microsom-flexcan1 {
> -			fsl,pins = <
> -				MX6QDL_PAD_SD3_CLK__FLEXCAN1_RX 0x80000000
> -				MX6QDL_PAD_SD3_CMD__FLEXCAN1_TX 0x80000000
> -			>;
> -		};
> -
>  		pinctrl_microsom_usbotg: microsom-usbotg {
>  			/*
>  			 * Similar to pinctrl_usbotg_2, but we want it
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

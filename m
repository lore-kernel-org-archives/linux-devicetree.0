From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: rockchip: enable saradc for rk3288-evb
Date: Sat, 01 Jul 2017 13:06:12 +0200
Message-ID: <10342435.5c883YxTZd@phil>
References: <1498874567-11219-1-git-send-email-jacob-chen@iotwrt.com> <1498874567-11219-5-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498874567-11219-5-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jacob,

Am Samstag, 1. Juli 2017, 10:02:46 CEST schrieb Jacob Chen:
> saradc in rk3288-evb use 1.8v ref.
> 
> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-evb.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
> index f226ca7..9cee856 100644
> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -129,6 +129,15 @@
>  		};
>  	};
>  
> +	vccadc_ref: vccadc-ref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc1v8_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};

this looks wrong. Regulators should always be named with the name
used in schematics and also, according to the rk3288-evb schematics
I have here, the saradc uses vcc_18 directly which comes from either
the rk808 or act8846 pmics (depending on the board version).

> +
>  	/* This turns on USB vbus for both host0 (ehci) and host1 (dwc2) */
>  	vcc_host: vcc-host-regulator {
>  		compatible = "regulator-fixed";
> @@ -218,6 +227,11 @@
>  	status = "okay";
>  };
>  
> +&saradc {
> +	vref-supply = <&vccadc_ref>;

So taking the above into account
	vref-supply = <&vcc_18>; ?


Heiko

> +	status = "okay";
> +};
> +
>  &sdmmc {
>  	bus-width = <4>;
>  	cap-mmc-highspeed;
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

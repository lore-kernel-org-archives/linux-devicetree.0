From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: Enable SGTL5000 codec based audio driver
 node for VF610 TOWER.
Date: Wed, 19 Feb 2014 15:13:51 +0800
Message-ID: <20140219071349.GH3010@S2101-09.ap.freescale.net>
References: <1392788323-6092-1-git-send-email-Li.Xiubo@freescale.com>
 <1392788323-6092-4-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392788323-6092-4-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 01:38:42PM +0800, Xiubo Li wrote:
> This patch adds and enables SGTL5000 codec support.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/vf610-twr.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
> index 8217854..29790c9 100644
> --- a/arch/arm/boot/dts/vf610-twr.dts
> +++ b/arch/arm/boot/dts/vf610-twr.dts
> @@ -34,6 +34,17 @@
>  		};
>  	};
>  
> +	regulators {
> +		compatible = "simple-bus";

		#address-cells = <1>;
		#size-cells = <0>;

> +
> +		reg_3p3v: 3p3v {

		reg_3p3v: regulator@0 {

> +			compatible = "regulator-fixed";

			reg = <0>;

Shawn

> +			regulator-name = "3P3V";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +	};
>  };
>  
>  &dspi0 {
> @@ -72,6 +83,14 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c0>;
>  	status = "okay";
> +
> +	codec: sgtl5000@0a {
> +	       compatible = "fsl,sgtl5000";
> +	       reg = <0x0a>;
> +	       VDDA-supply = <&reg_3p3v>;
> +	       VDDIO-supply = <&reg_3p3v>;
> +	       clocks = <&clks VF610_CLK_SAI2>;
> +       };
>  };
>  
>  &iomuxc {
> -- 
> 1.8.4
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

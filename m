From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: apf27dev: Add pwm0 support
Date: Tue, 3 Dec 2013 18:58:16 +0800
Message-ID: <20131203105814.GC13726@S2101-09.ap.freescale.net>
References: <1385822170-98486-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
 <1385822170-98486-2-git-send-email-gwenhael.goavec-merou@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385822170-98486-2-git-send-email-gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 30, 2013 at 03:36:09PM +0100, Gwenhael Goavec-Merou wrote:
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx27-apf27dev.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
> index 0010b3e..6069331 100644
> --- a/arch/arm/boot/dts/imx27-apf27dev.dts
> +++ b/arch/arm/boot/dts/imx27-apf27dev.dts
> @@ -125,6 +125,10 @@
>  		pinctrl_sdhc2: sdhc2grp {
>  			fsl,pins = <MX27_SDHC2_PINGRP1>;
>  		};
> +
> +		pinctrl_pwm0: pwm0grp {

Please sort these pinctrl entries alphabetically.

Shawn

> +			fsl,pins = <MX27_PWM_PINGRP1>;
> +		};
>  	};
>  };
>  
> @@ -135,3 +139,8 @@
>  	pinctrl-0 = <&pinctrl_sdhc2>;
>  	status = "okay";
>  };
> +
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0>;
> +};
> -- 
> 1.8.3.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

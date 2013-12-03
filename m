From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: apf27dev: Add pwm support
Date: Tue, 3 Dec 2013 21:33:29 +0800
Message-ID: <20131203133327.GJ13726@S2101-09.ap.freescale.net>
References: <1386069015-10718-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
 <1386069015-10718-2-git-send-email-gwenhael.goavec-merou@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386069015-10718-2-git-send-email-gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 03, 2013 at 12:10:14PM +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx27-apf27dev.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
> index d02c67f..a794b1a 100644
> --- a/arch/arm/boot/dts/imx27-apf27dev.dts
> +++ b/arch/arm/boot/dts/imx27-apf27dev.dts
> @@ -123,6 +123,10 @@
>  			fsl,pins = <MX27_I2C2_PINGRP1>;
>  		};
>  
> +		pinctrl_pwm0: pwm0grp {

s/pwm0/pwm

Shawn

> +			fsl,pins = <MX27_PWM_PINGRP1>;
> +		};
> +
>  		pinctrl_sdhc2: sdhc2grp {
>  			fsl,pins = <MX27_SDHC2_PINGRP1>;
>  		};
> @@ -136,3 +140,8 @@
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

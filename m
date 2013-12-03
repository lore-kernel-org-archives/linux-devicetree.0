From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: imx27: add pwm pingrp
Date: Tue, 3 Dec 2013 21:32:54 +0800
Message-ID: <20131203133252.GI13726@S2101-09.ap.freescale.net>
References: <1386069015-10718-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386069015-10718-1-git-send-email-gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 03, 2013 at 12:10:13PM +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-W7CSdorvuhNZroRs9YW3xA@public.gmane.org>

Applied all 3 with some small fix-ups (see replies to patch #2 and #3).

Shawn

> ---
>  arch/arm/boot/dts/imx27-pingrp.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx27-pingrp.h b/arch/arm/boot/dts/imx27-pingrp.h
> index f3fbf5a..edc1e90 100644
> --- a/arch/arm/boot/dts/imx27-pingrp.h
> +++ b/arch/arm/boot/dts/imx27-pingrp.h
> @@ -88,6 +88,9 @@
>  #define MX27_OWIRE1_PINGRP1 \
>  	MX27_PAD_RTCK__OWIRE 0x0
>  
> +#define MX27_PWM_PINGRP1 \
> +	MX27_PAD_PWMO__PWMO 0x0
> +
>  #define MX27_SDHC1_PINGRP1 \
>  	MX27_PAD_SD1_CLK__SD1_CLK \
>  	MX27_PAD_SD1_CMD__SD1_CMD \
> -- 
> 1.8.3.2
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH v5 14/26] ARM: shmobile: defconfig: Enable RENESAS_WDT_GEN
Date: Tue, 13 Feb 2018 13:08:19 +0000
Message-ID: <TY1PR06MB0895970E6725F954D1A97E4CC0F60@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1518457475-4480-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1518457475-4480-15-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518457475-4480-15-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>C
List-Id: devicetree@vger.kernel.org

Hello Simon,

what do you think about enabling the watchdog in multi_v7_defconfig as a mo=
dule?

Thanks,
Fab

> Subject: [PATCH v5 14/26] ARM: shmobile: defconfig: Enable RENESAS_WDT_GE=
N
>
> R-Car Gen2 and RZ/G1 platforms come with a watchdog IP, therefore enable
> its driver by default.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRj3fQ9qLvQP4Q@public.gmane.org=
s.com>
> Reviewed-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> ---
> v4->v5:
> * no change
>
>  arch/arm/configs/shmobile_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmob=
ile_defconfig
> index 578434c..d5cdad8 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -132,6 +132,7 @@ CONFIG_CPU_THERMAL=3Dy
>  CONFIG_RCAR_THERMAL=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_DA9063_WATCHDOG=3Dy
> +CONFIG_RENESAS_WDT=3Dy
>  CONFIG_MFD_AS3711=3Dy
>  CONFIG_MFD_DA9063=3Dy
>  CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

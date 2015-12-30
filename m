From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] soc: mediatek: Add MT2701/MT7623 scpsys driver
Date: Wed, 30 Dec 2015 17:01:54 +0800
Message-ID: <CAGS+omCwxB+4VFOA1hA9Rg-ekWCVM8Y_c7woTEXnvX6FG1y9mQ@mail.gmail.com>
References: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com> <1451457706-14798-5-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451457706-14798-5-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 30, 2015 at 2:41 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> Add scpsys driver for MT2701 and MT7623.
>
> Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/soc/mediatek/Kconfig             |  11 +++
>  drivers/soc/mediatek/Makefile            |   1 +
>  drivers/soc/mediatek/mtk-scpsys-mt2701.c | 161 +++++++++++++++++++++++++++++++
>  3 files changed, 173 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-scpsys-mt2701.c
>
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index eca6fb7..92cf838 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -39,3 +39,14 @@ config MTK_SCPSYS_MT8173
>           driver.
>           The System Control Processor System (SCPSYS) has several power
>           management related tasks in the system.
> +
> +config MTK_SCPSYS_MT2701
> +       bool "SCPSYS Support MediaTek MT2701 and MT7623"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       select MTK_SCPSYS
> +       default ARCH_MEDIATEK
> +       help
> +         Say yes here to add support for the MT2701/MT7623 SCPSYS power
> +         domain driver.
> +         The System Control Processor System (SCPSYS) has several power
> +         management related tasks in the system.

I don't think we really want different drivers and Kconfig options.

Can we just use different compatibles to select the appropriate scp_domain_data?

-Dan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

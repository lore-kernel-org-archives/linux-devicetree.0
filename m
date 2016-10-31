From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v9 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Mon, 31 Oct 2016 01:08:08 +0100
Message-ID: <14a1ebb2-fda2-278b-b2f0-8f9c6ff6a83d@gmail.com>
References: <1476953798-23263-1-git-send-email-jamesjj.liao@mediatek.com>
 <1476953798-23263-3-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476953798-23263-3-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi James,

On 10/20/2016 10:56 AM, James Liao wrote:
> Some power domain comsumers may init before module_init.
> So the power domain provider (scpsys) need to be initialized
> earlier too.
>
> Take an example for our IOMMU (M4U) and SMI. SMI is a bridge
> between IOMMU and multimedia HW. SMI is responsible to
> enable/disable iommu and help transfer data for each multimedia
> HW. Both of them have to wait until the power and clocks are
> enabled.
>
> So scpsys driver should be initialized before SMI, and SMI should
> be initialized before IOMMU, and then init IOMMU consumers
> (display/vdec/venc/camera etc.).
>
> IOMMU is subsys_init by default. So we need to init scpsys driver
> before subsys_init.
>
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---

I didn't applied this patch for now.
I answered you in v7 of this series [1]. I would prefer to see if we can 
fix that otherwise.

Would be great if you or Yong could provide some feedback.

Thanks,
Matthias

[1] https://patchwork.kernel.org/patch/9397405/

>  drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index fa9ee69..dd7a07d 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -613,4 +613,21 @@ static int scpsys_probe(struct platform_device *pdev)
>  		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
>  	},
>  };
> -builtin_platform_driver(scpsys_drv);
> +
> +static int __init scpsys_drv_init(void)
> +{
> +	return platform_driver_register(&scpsys_drv);
> +}
> +
> +/*
> + * There are some Mediatek drivers which depend on the power domain driver need
> + * to probe in earlier initcall levels. So scpsys driver also need to probe
> + * earlier.
> + *
> + * IOMMU(M4U) and SMI drivers for example. SMI is a bridge between IOMMU and
> + * multimedia HW. IOMMU depends on SMI, and SMI is a power domain consumer,
> + * so the proper probe sequence should be scpsys -> SMI -> IOMMU driver.
> + * IOMMU drivers are initialized during subsys_init by default, so we need to
> + * move SMI and scpsys drivers to subsys_init or earlier init levels.
> + */
> +subsys_initcall(scpsys_drv_init);
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

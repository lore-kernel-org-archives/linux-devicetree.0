From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Sat, 2 Jul 2016 18:35:41 +0200
Message-ID: <34025ec4-19d3-8b25-d669-50c6f19159cd@gmail.com>
References: <1463390894-32062-1-git-send-email-jamesjj.liao@mediatek.com>
 <1463390894-32062-3-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1463390894-32062-3-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/16/2016 11:28 AM, James Liao wrote:
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
>  drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 5870a24..00c0adb 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -617,4 +617,21 @@ static struct platform_driver scpsys_drv = {
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

Can't we achieve this with probe deferring? I'm not really keen on 
coding the order of the different drivers like this.

Regards,
Matthias

From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 4/8] drm/mediatek: add support for Mediatek SoC MT2701
Date: Wed, 20 Jul 2016 14:53:19 +0800
Message-ID: <1468997599.11841.49.camel@mtksdaap41>
References: <1468577274-6178-1-git-send-email-yt.shen@mediatek.com>
	 <1468577274-6178-5-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468577274-6178-5-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, YT:

Some comments inline.

On Fri, 2016-07-15 at 18:07 +0800, YT Shen wrote:
> This patch add support for the Mediatek MT2701 DISP subsystem.
> There is only one OVL engine in MT2701.
> 
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |    6 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |    6 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |   41 +++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |    7 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   31 ++++++++++++++++++++
>  6 files changed, 92 insertions(+)
> 

[snip...]

>  
>  static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
> +	{ .compatible = "mediatek,mt2701-disp-ovl",   .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8173-disp-ovl",   .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt2701-disp-rdma",  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-rdma",  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt2701-disp-wdma",  .data = (void *)MTK_DISP_WDMA },

Is WDMA different from MT8173 to MT2701. If they are the same, you need
not to add compatible of 'mediatek,mt2701-disp-wdma' because use
'mediatek,mt8173-disp-wdma' is enough.

>  	{ .compatible = "mediatek,mt8173-disp-wdma",  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt2701-disp-color", .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color", .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-aal",   .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma", .data = (void *)MTK_DISP_GAMMA, },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",  .data = (void *)MTK_DISP_UFOE },
> +	{ .compatible = "mediatek,mt2701-dsi",	      .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",        .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt2701-dpi",	      .data = (void *)MTK_DPI },

Is DPI different from MT8173 to MT2701. If they are the same, you need
not to add compatible of 'mediatek,mt2701-dpi' because use
'mediatek,mt8173-dpi' is enough.

>  	{ .compatible = "mediatek,mt8173-dpi",        .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt2701-disp-mutex", .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8173-disp-mutex", .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt2701-disp-pwm",   .data = (void *)MTK_DISP_PWM },

Is pwm different from MT8173 to MT2701. If they are the same, you need
not to add compatible of 'mediatek,mt2701-disp-pwm' because use
'mediatek,mt8173-disp-pwm' is enough.

>  	{ .compatible = "mediatek,mt8173-disp-pwm",   .data = (void *)MTK_DISP_PWM },
>  	{ .compatible = "mediatek,mt8173-disp-od",    .data = (void *)MTK_DISP_OD },
>  	{ }
> @@ -514,6 +543,8 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>  			 mtk_drm_sys_resume);
>  
>  static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt2701-mmsys",
> +	  .data = &mt2701_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8173-mmsys",
>  	  .data = &mt8173_mmsys_driver_data},
>  	{ }

Regards,
CK

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

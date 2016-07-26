From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 4/8] drm/mediatek: add support for Mediatek SoC MT2701
Date: Tue, 26 Jul 2016 18:42:54 +0800
Message-ID: <1469529774.4678.34.camel@mtksdaap41>
References: <1468577274-6178-1-git-send-email-yt.shen@mediatek.com>
 <1468577274-6178-5-git-send-email-yt.shen@mediatek.com>
 <1468997599.11841.49.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1468997599.11841.49.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi CK,

On Wed, 2016-07-20 at 14:53 +0800, CK Hu wrote:
> Hi, YT:
> 
> Some comments inline.
> 
> On Fri, 2016-07-15 at 18:07 +0800, YT Shen wrote:
> > This patch add support for the Mediatek MT2701 DISP subsystem.
> > There is only one OVL engine in MT2701.
> > 
> > Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |    6 ++++
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |    6 ++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |   41 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |    7 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |    1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   31 ++++++++++++++++++++
> >  6 files changed, 92 insertions(+)
> > 
> 
> [snip...]
> 
> >  
> >  static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
> > +	{ .compatible = "mediatek,mt2701-disp-ovl",   .data = (void *)MTK_DISP_OVL },
> >  	{ .compatible = "mediatek,mt8173-disp-ovl",   .data = (void *)MTK_DISP_OVL },
> > +	{ .compatible = "mediatek,mt2701-disp-rdma",  .data = (void *)MTK_DISP_RDMA },
> >  	{ .compatible = "mediatek,mt8173-disp-rdma",  .data = (void *)MTK_DISP_RDMA },
> > +	{ .compatible = "mediatek,mt2701-disp-wdma",  .data = (void *)MTK_DISP_WDMA },
> 
> Is WDMA different from MT8173 to MT2701. If they are the same, you need
> not to add compatible of 'mediatek,mt2701-disp-wdma' because use
> 'mediatek,mt8173-disp-wdma' is enough.
Yes, the hardware has differences, so we need add new compatible
'mt2701-disp-wdma'

> 
> >  	{ .compatible = "mediatek,mt8173-disp-wdma",  .data = (void *)MTK_DISP_WDMA },
> > +	{ .compatible = "mediatek,mt2701-disp-color", .data = (void *)MTK_DISP_COLOR },
> >  	{ .compatible = "mediatek,mt8173-disp-color", .data = (void *)MTK_DISP_COLOR },
> >  	{ .compatible = "mediatek,mt8173-disp-aal",   .data = (void *)MTK_DISP_AAL},
> >  	{ .compatible = "mediatek,mt8173-disp-gamma", .data = (void *)MTK_DISP_GAMMA, },
> >  	{ .compatible = "mediatek,mt8173-disp-ufoe",  .data = (void *)MTK_DISP_UFOE },
> > +	{ .compatible = "mediatek,mt2701-dsi",	      .data = (void *)MTK_DSI },
> >  	{ .compatible = "mediatek,mt8173-dsi",        .data = (void *)MTK_DSI },
> > +	{ .compatible = "mediatek,mt2701-dpi",	      .data = (void *)MTK_DPI },
> 
> Is DPI different from MT8173 to MT2701. If they are the same, you need
> not to add compatible of 'mediatek,mt2701-dpi' because use
> 'mediatek,mt8173-dpi' is enough.
Yes, the hardware has differences, so we need add new compatible
'mt2701-dpi'

> 
> >  	{ .compatible = "mediatek,mt8173-dpi",        .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt2701-disp-mutex", .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8173-disp-mutex", .data = (void *)MTK_DISP_MUTEX },
> > +	{ .compatible = "mediatek,mt2701-disp-pwm",   .data = (void *)MTK_DISP_PWM },
> 
> Is pwm different from MT8173 to MT2701. If they are the same, you need
> not to add compatible of 'mediatek,mt2701-disp-pwm' because use
> 'mediatek,mt8173-disp-pwm' is enough.
Yes, the hardware has differences, so we need add new compatible
'mt2701-disp-pwm'

Regards,
yt.shen

> 
> >  	{ .compatible = "mediatek,mt8173-disp-pwm",   .data = (void *)MTK_DISP_PWM },
> >  	{ .compatible = "mediatek,mt8173-disp-od",    .data = (void *)MTK_DISP_OD },
> >  	{ }
> > @@ -514,6 +543,8 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> >  			 mtk_drm_sys_resume);
> >  
> >  static const struct of_device_id mtk_drm_of_ids[] = {
> > +	{ .compatible = "mediatek,mt2701-mmsys",
> > +	  .data = &mt2701_mmsys_driver_data},
> >  	{ .compatible = "mediatek,mt8173-mmsys",
> >  	  .data = &mt8173_mmsys_driver_data},
> >  	{ }
> 
> Regards,
> CK
> 

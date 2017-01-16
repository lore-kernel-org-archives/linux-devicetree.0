From: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v11 02/12] drm/mediatek: add helpers for coverting from
 the generic components
Date: Mon, 16 Jan 2017 09:09:36 +0800
Message-ID: <1484528976.11503.1.camel@mtksdaap41>
References: <1484117473-46644-1-git-send-email-yt.shen@mediatek.com>
         <1484117473-46644-3-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484117473-46644-3-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-11 at 14:51 +0800, YT Shen wrote:
> define helpers for converting from 'mtk_ddp_comp' to 'mtk_disp_ovl'
> define helpers for converting from 'mtk_ddp_comp' to 'mtk_disp_rdma'
> 
> Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Acked-by CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 15 +++++++++------
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 15 +++++++++------
>  2 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index c703102..ce2759f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -57,6 +57,11 @@ struct mtk_disp_ovl {
>  	struct drm_crtc			*crtc;
>  };
>  
> +static inline struct mtk_disp_ovl *comp_to_ovl(struct mtk_ddp_comp *comp)
> +{
> +	return container_of(comp, struct mtk_disp_ovl, ddp_comp);
> +}
> +
>  static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
>  {
>  	struct mtk_disp_ovl *priv = dev_id;
> @@ -76,20 +81,18 @@ static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
>  static void mtk_ovl_enable_vblank(struct mtk_ddp_comp *comp,
>  				  struct drm_crtc *crtc)
>  {
> -	struct mtk_disp_ovl *priv = container_of(comp, struct mtk_disp_ovl,
> -						 ddp_comp);
> +	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
>  
> -	priv->crtc = crtc;
> +	ovl->crtc = crtc;
>  	writel(0x0, comp->regs + DISP_REG_OVL_INTSTA);
>  	writel_relaxed(OVL_FME_CPL_INT, comp->regs + DISP_REG_OVL_INTEN);
>  }
>  
>  static void mtk_ovl_disable_vblank(struct mtk_ddp_comp *comp)
>  {
> -	struct mtk_disp_ovl *priv = container_of(comp, struct mtk_disp_ovl,
> -						 ddp_comp);
> +	struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
>  
> -	priv->crtc = NULL;
> +	ovl->crtc = NULL;
>  	writel_relaxed(0x0, comp->regs + DISP_REG_OVL_INTEN);
>  }
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 0df05f9..21eff6f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -49,6 +49,11 @@ struct mtk_disp_rdma {
>  	struct drm_crtc			*crtc;
>  };
>  
> +static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
> +{
> +	return container_of(comp, struct mtk_disp_rdma, ddp_comp);
> +}
> +
>  static irqreturn_t mtk_disp_rdma_irq_handler(int irq, void *dev_id)
>  {
>  	struct mtk_disp_rdma *priv = dev_id;
> @@ -77,20 +82,18 @@ static void rdma_update_bits(struct mtk_ddp_comp *comp, unsigned int reg,
>  static void mtk_rdma_enable_vblank(struct mtk_ddp_comp *comp,
>  				   struct drm_crtc *crtc)
>  {
> -	struct mtk_disp_rdma *priv = container_of(comp, struct mtk_disp_rdma,
> -						  ddp_comp);
> +	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
>  
> -	priv->crtc = crtc;
> +	rdma->crtc = crtc;
>  	rdma_update_bits(comp, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT,
>  			 RDMA_FRAME_END_INT);
>  }
>  
>  static void mtk_rdma_disable_vblank(struct mtk_ddp_comp *comp)
>  {
> -	struct mtk_disp_rdma *priv = container_of(comp, struct mtk_disp_rdma,
> -						  ddp_comp);
> +	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
>  
> -	priv->crtc = NULL;
> +	rdma->crtc = NULL;
>  	rdma_update_bits(comp, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
>  }
>  


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

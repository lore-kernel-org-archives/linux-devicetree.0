From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 20/32] drm/mediatek: add function to background
 color input select for ovl/ovl_2l direct link
Date: Wed, 9 Oct 2019 17:24:13 +0800
Message-ID: <1570613053.7713.5.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
         <1567090254-15566-21-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-21-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add function to background color input select for ovl/ovl_2l direct link
> for ovl/ovl_2l direct link usecase, we need set background color
> input select for these hardware.
> this is preparation patch for ovl/ovl_2l usecase
> 

Applied to mediatek-drm-next-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.5

Regards,
CK

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 85e096a..268d416 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -84,6 +84,8 @@ struct mtk_ddp_comp_funcs {
>  			     struct mtk_plane_state *state);
>  	void (*gamma_set)(struct mtk_ddp_comp *comp,
>  			  struct drm_crtc_state *state);
> +	void (*bgclr_in_on)(struct mtk_ddp_comp *comp);
> +	void (*bgclr_in_off)(struct mtk_ddp_comp *comp);
>  };
>  
>  struct mtk_ddp_comp {
> @@ -164,6 +166,18 @@ static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
>  		comp->funcs->gamma_set(comp, state);
>  }
>  
> +static inline void mtk_ddp_comp_bgclr_in_on(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->bgclr_in_on)
> +		comp->funcs->bgclr_in_on(comp);
> +}
> +
> +static inline void mtk_ddp_comp_bgclr_in_off(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->bgclr_in_off)
> +		comp->funcs->bgclr_in_off(comp);
> +}
> +
>  int mtk_ddp_comp_get_id(struct device_node *node,
>  			enum mtk_ddp_comp_type comp_type);
>  int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,

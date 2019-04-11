From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 16/25] drm/mediatek: add ddp write register common api
Date: Thu, 11 Apr 2019 19:15:19 +0800
Message-ID: <1554981319.31170.2.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
         <1553667561-25447-17-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-17-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com, airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Wed, 2019-03-27 at 14:19 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add ddp write register common api
> this is preparation patch for ovl/ovl_2l direct link
> usecase.
> in that case, we need this funtion to set one bit of ovl_2l
> register

The reason is so strange. You could grep 'readl' in mediatek drm driver,
and you would find that many place need this function. 

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 11 +++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index afd6ca2..72288b4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -84,6 +84,17 @@
>  #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
>  #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
>  
> +void mtk_ddp_write_mask(unsigned int value,
> +			struct mtk_ddp_comp *comp,
> +			unsigned int offset,
> +			unsigned int mask)
> +{
> +	unsigned int tmp = readl(comp->regs + offset);
> +
> +	tmp = (tmp & ~mask) | (value & mask);

Why not just place this calculation into writel()?

Regards,
CK

> +	writel(tmp, comp->regs + offset);
> +}
> +
>  void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
>  		    unsigned int CFG)
>  {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 20e8061..ed715ff 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -198,5 +198,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *comp_node,
>  void mtk_ddp_comp_unregister(struct drm_device *drm, struct mtk_ddp_comp *comp);
>  void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
>  		    unsigned int CFG);
> +void mtk_ddp_write_mask(unsigned int value,
> +			struct mtk_ddp_comp *comp,
> +			unsigned int offset,
> +			unsigned int mask);
>  
>  #endif /* MTK_DRM_DDP_COMP_H */

From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 22/25] drm/mediatek: adjust ddp clock control flow
Date: Tue, 16 Apr 2019 16:24:50 +0800
Message-ID: <1555403090.11519.7.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
         <1553667561-25447-23-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-23-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com, airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Wed, 2019-03-27 at 14:19 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> display hardware clock will not unprepare when
> crtc is disable, until crtc is destroyed.
> with this patch, hard clock will disable and unprepare
> at the same time.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 0f97ee3..606c6e2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -195,7 +195,7 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
>  
>  	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> -		ret = clk_enable(mtk_crtc->ddp_comp[i]->clk);
> +		ret = clk_prepare_enable(mtk_crtc->ddp_comp[i]->clk);
>  		if (ret) {
>  			DRM_ERROR("Failed to enable clock %d: %d\n", i, ret);
>  			goto err;
> @@ -205,7 +205,7 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
>  	return 0;
>  err:
>  	while (--i >= 0)
> -		clk_disable(mtk_crtc->ddp_comp[i]->clk);
> +		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
>  	return ret;
>  }
>  
> @@ -215,7 +215,7 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
>  
>  	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> -		clk_disable(mtk_crtc->ddp_comp[i]->clk);
> +		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
>  }
>  
>  static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> @@ -615,15 +615,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		if (!comp) {
>  			dev_err(dev, "Component %pOF not initialized\n", node);
>  			ret = -ENODEV;
> -			goto unprepare;
> -		}
> -
> -		ret = clk_prepare(comp->clk);
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to prepare clock for component %pOF: %d\n",
> -				node, ret);
> -			goto unprepare;
> +			return ret;
>  		}
>  
>  		mtk_crtc->ddp_comp[i] = comp;
> @@ -649,23 +641,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		ret = mtk_plane_init(drm_dev, &mtk_crtc->planes[zpos],
>  				     BIT(pipe), type);
>  		if (ret)
> -			goto unprepare;
> +			return ret;
>  	}
>  
>  	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
>  				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
>  				NULL, pipe);
>  	if (ret < 0)
> -		goto unprepare;
> +		return ret;
>  	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
>  	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
>  	priv->num_pipes++;
>  
>  	return 0;
> -
> -unprepare:
> -	while (--i >= 0)
> -		clk_unprepare(mtk_crtc->ddp_comp[i]->clk);
> -
> -	return ret;
>  }

From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 04/25] drm/mediatek: add mutex sof into ddp private
 data
Date: Thu, 28 Mar 2019 11:02:00 +0800
Message-ID: <1553742120.14682.3.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
         <1553667561-25447-5-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553667561-25447-5-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com, airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Wed, 2019-03-27 at 14:19 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> mutex0 SOF register offset not always 0x30.
> for mt8183, that offset will be 0x2C,
> add this regsiter offset into private data

I think you do two things in this patch. One is mutex0 SOF register
offset, and another is making sof value variable. So please split this
into two patches.

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 51 ++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 7f0d46e..495ebc5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -42,12 +42,13 @@
>  #define DISP_REG_CONFIG_DPI_SEL			0x064
>  
>  #define MT2701_DISP_MUTEX0_MOD0 0x2C
> +#define MT2701_DISP_MUTEX0_SOF0  0x30
>  
>  #define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * (n))
>  #define DISP_REG_MUTEX(n)	(0x24 + 0x20 * (n))
>  #define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * (n))
>  #define DISP_REG_MUTEX_MOD(data, n)	((data)->mutex_mod_reg + 0x20 * (n))
> -#define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
> +#define DISP_REG_MUTEX_SOF(data, n)	((data)->mutex_sof_reg + 0x20 * (n))

Even though previous patch's indent is not aligned, I would like you to
align this indent.

Regards,
CK

>  #define DISP_REG_MUTEX_MOD2(n)	(0x34 + 0x20 * (n))
>  
>  #define INT_MUTEX				BIT(1)
> @@ -149,9 +150,22 @@ struct mtk_disp_mutex {
>  	bool claimed;
>  };
>  
> +enum mtk_ddp_mutex_sof_id {
> +	DDP_MUTEX_SOF_SINGLE_MODE,
> +	DDP_MUTEX_SOF_DSI0,
> +	DDP_MUTEX_SOF_DSI1,
> +	DDP_MUTEX_SOF_DPI0,
> +	DDP_MUTEX_SOF_DPI1,
> +	DDP_MUTEX_SOF_DSI2,
> +	DDP_MUTEX_SOF_DSI3,
> +	DDP_MUTEX_SOF_MAX,
> +};
> +
>  struct mtk_ddp_data {
>  	const unsigned int *mutex_mod;
> +	const unsigned int *mutex_sof;
>  	unsigned int mutex_mod_reg;
> +	unsigned int mutex_sof_reg;
>  };
>  
>  struct mtk_ddp {
> @@ -209,19 +223,35 @@ struct mtk_ddp {
>  	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
>  };
>  
> +static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
> +	[DDP_MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
> +	[DDP_MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
> +	[DDP_MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
> +	[DDP_MUTEX_SOF_DPI0] = MUTEX_SOF_DPI0,
> +	[DDP_MUTEX_SOF_DPI1] = MUTEX_SOF_DPI1,
> +	[DDP_MUTEX_SOF_DSI2] = MUTEX_SOF_DSI2,
> +	[DDP_MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
> +};
> +
>  static const struct mtk_ddp_data mt2701_ddp_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
> +	.mutex_sof = mt2712_mutex_sof,
>  	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>  };
>  
>  static const struct mtk_ddp_data mt2712_ddp_driver_data = {
>  	.mutex_mod = mt2712_mutex_mod,
> +	.mutex_sof = mt2712_mutex_sof,
>  	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>  };
>  
>  static const struct mtk_ddp_data mt8173_ddp_driver_data = {
>  	.mutex_mod = mt8173_mutex_mod,
> +	.mutex_sof = mt2712_mutex_sof,
>  	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
> +	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>  };
>  
>  static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> @@ -462,28 +492,29 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>  	struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
>  					   mutex[mutex->id]);
>  	unsigned int reg;
> +	unsigned int sof_id;
>  	unsigned int offset;
>  
>  	WARN_ON(&ddp->mutex[mutex->id] != mutex);
>  
>  	switch (id) {
>  	case DDP_COMPONENT_DSI0:
> -		reg = MUTEX_SOF_DSI0;
> +		sof_id = DDP_MUTEX_SOF_DSI0;
>  		break;
>  	case DDP_COMPONENT_DSI1:
> -		reg = MUTEX_SOF_DSI0;
> +		sof_id = DDP_MUTEX_SOF_DSI0;
>  		break;
>  	case DDP_COMPONENT_DSI2:
> -		reg = MUTEX_SOF_DSI2;
> +		sof_id = DDP_MUTEX_SOF_DSI2;
>  		break;
>  	case DDP_COMPONENT_DSI3:
> -		reg = MUTEX_SOF_DSI3;
> +		sof_id = DDP_MUTEX_SOF_DSI3;
>  		break;
>  	case DDP_COMPONENT_DPI0:
> -		reg = MUTEX_SOF_DPI0;
> +		sof_id = DDP_MUTEX_SOF_DPI0;
>  		break;
>  	case DDP_COMPONENT_DPI1:
> -		reg = MUTEX_SOF_DPI1;
> +		sof_id = DDP_MUTEX_SOF_DPI1;
>  		break;
>  	default:
>  		if (ddp->data->mutex_mod[id] < 32) {
> @@ -500,7 +531,8 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>  		return;
>  	}
>  
> -	writel_relaxed(reg, ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
> +	writel_relaxed(ddp->data->mutex_sof[sof_id],
> +		       ddp->regs + DISP_REG_MUTEX_SOF(ddp->data, mutex->id));
>  }
>  
>  void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
> @@ -521,7 +553,8 @@ void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
>  	case DDP_COMPONENT_DPI0:
>  	case DDP_COMPONENT_DPI1:
>  		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
> -			       ddp->regs + DISP_REG_MUTEX_SOF(mutex->id));
> +			       ddp->regs +
> +			       DISP_REG_MUTEX_SOF(ddp->data, mutex->id));
>  		break;
>  	default:
>  		if (ddp->data->mutex_mod[id] < 32) {

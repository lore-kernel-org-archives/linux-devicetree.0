From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 08/32] drm/mediatek: add mutex mod register offset
 into ddp private data
Date: Wed, 9 Oct 2019 17:32:39 +0800
Message-ID: <1570613559.7713.11.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
         <1567090254-15566-9-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-9-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> mutex mod register offset will be private data of ddp.
> 

Applied to mediatek-drm-next-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.5

Regards,
CK

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index b6cc3d8..ae22e21 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -33,12 +33,14 @@
>  #define DISP_REG_CONFIG_DSI_SEL			0x050
>  #define DISP_REG_CONFIG_DPI_SEL			0x064
>  
> -#define DISP_REG_MUTEX_EN(n)	(0x20 + 0x20 * (n))
> -#define DISP_REG_MUTEX(n)	(0x24 + 0x20 * (n))
> -#define DISP_REG_MUTEX_RST(n)	(0x28 + 0x20 * (n))
> -#define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * (n))
> -#define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
> -#define DISP_REG_MUTEX_MOD2(n)	(0x34 + 0x20 * (n))
> +#define MT2701_DISP_MUTEX0_MOD0			0x2c
> +
> +#define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
> +#define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> +#define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
> +#define DISP_REG_MUTEX_SOF(n)			(0x30 + 0x20 * (n))
> +#define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
>  
>  #define INT_MUTEX				BIT(1)
>  
> @@ -141,6 +143,7 @@ struct mtk_disp_mutex {
>  
>  struct mtk_ddp_data {
>  	const unsigned int *mutex_mod;
> +	const unsigned int mutex_mod_reg;
>  };
>  
>  struct mtk_ddp {
> @@ -200,14 +203,17 @@ struct mtk_ddp {
>  
>  static const struct mtk_ddp_data mt2701_ddp_driver_data = {
>  	.mutex_mod = mt2701_mutex_mod,
> +	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
>  };
>  
>  static const struct mtk_ddp_data mt2712_ddp_driver_data = {
>  	.mutex_mod = mt2712_mutex_mod,
> +	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
>  };
>  
>  static const struct mtk_ddp_data mt8173_ddp_driver_data = {
>  	.mutex_mod = mt8173_mutex_mod,
> +	.mutex_mod_reg = MT2701_DISP_MUTEX0_MOD0,
>  };
>  
>  static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
> @@ -473,7 +479,8 @@ void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>  		break;
>  	default:
>  		if (ddp->data->mutex_mod[id] < 32) {
> -			offset = DISP_REG_MUTEX_MOD(mutex->id);
> +			offset = DISP_REG_MUTEX_MOD(ddp->data->mutex_mod_reg,
> +						    mutex->id);
>  			reg = readl_relaxed(ddp->regs + offset);
>  			reg |= 1 << ddp->data->mutex_mod[id];
>  			writel_relaxed(reg, ddp->regs + offset);
> @@ -511,7 +518,8 @@ void mtk_disp_mutex_remove_comp(struct mtk_disp_mutex *mutex,
>  		break;
>  	default:
>  		if (ddp->data->mutex_mod[id] < 32) {
> -			offset = DISP_REG_MUTEX_MOD(mutex->id);
> +			offset = DISP_REG_MUTEX_MOD(ddp->data->mutex_mod_reg,
> +						    mutex->id);
>  			reg = readl_relaxed(ddp->regs + offset);
>  			reg &= ~(1 << ddp->data->mutex_mod[id]);
>  			writel_relaxed(reg, ddp->regs + offset);

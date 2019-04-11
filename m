From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 12/25] drm/mediatek: add component DITHER
Date: Thu, 11 Apr 2019 14:28:08 +0800
Message-ID: <1554964088.4768.8.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
 <1553667561-25447-13-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553667561-25447-13-git-send-email-yongqiang.niu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: yongqiang.niu@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Bibby.Hsieh@mediatek.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, yt.shen@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Wed, 2019-03-27 at 14:19 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add component DITHER

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 32 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  2 ++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 24152e5..afd6ca2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -47,6 +47,12 @@
>  #define CCORR_RELAY_MODE			BIT(0)
>  #define DISP_CCORR_SIZE				0x0030
>  
> +#define DISP_DITHER_EN				0x0000
> +#define DITHER_EN				BIT(0)
> +#define DISP_DITHER_CFG                        0x0020
> +#define DITHER_RELAY_MODE			BIT(0)
> +#define DISP_DITHER_SIZE			0x0030
> +
>  #define DISP_GAMMA_EN				0x0000
>  #define DISP_GAMMA_CFG				0x0020
>  #define DISP_GAMMA_SIZE				0x0030
> @@ -155,6 +161,24 @@ static void mtk_ccorr_stop(struct mtk_ddp_comp *comp)
>  	writel_relaxed(0x0, comp->regs + DISP_CCORR_EN);
>  }
>  
> +static void mtk_dither_config(struct mtk_ddp_comp *comp, unsigned int w,
> +			      unsigned int h, unsigned int vrefresh,
> +			      unsigned int bpc)
> +{
> +	writel(h << 16 | w, comp->regs + DISP_DITHER_SIZE);
> +	writel(DITHER_RELAY_MODE, comp->regs + DISP_DITHER_CFG);
> +}
> +
> +static void mtk_dither_start(struct mtk_ddp_comp *comp)
> +{
> +	writel(DITHER_EN, comp->regs + DISP_DITHER_EN);
> +}
> +
> +static void mtk_dither_stop(struct mtk_ddp_comp *comp)
> +{
> +	writel_relaxed(0x0, comp->regs + DISP_DITHER_EN);
> +}
> +
>  static void mtk_gamma_config(struct mtk_ddp_comp *comp, unsigned int w,
>  			     unsigned int h, unsigned int vrefresh,
>  			     unsigned int bpc)
> @@ -209,6 +233,12 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
>  	.stop = mtk_ccorr_stop,
>  };
>  
> +static const struct mtk_ddp_comp_funcs ddp_dither = {
> +	.config = mtk_dither_config,
> +	.start = mtk_dither_start,
> +	.stop = mtk_dither_stop,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_gamma = {
>  	.gamma_set = mtk_gamma_set,
>  	.config = mtk_gamma_config,
> @@ -234,6 +264,7 @@ static void mtk_gamma_set(struct mtk_ddp_comp *comp,
>  	[MTK_DISP_CCORR] = "ccorr",
>  	[MTK_DISP_AAL] = "aal",
>  	[MTK_DISP_GAMMA] = "gamma",
> +	[MTK_DISP_DITHER] = "dither",
>  	[MTK_DISP_UFOE] = "ufoe",
>  	[MTK_DSI] = "dsi",
>  	[MTK_DPI] = "dpi",
> @@ -256,6 +287,7 @@ struct mtk_ddp_comp_match {
>  	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
>  	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, NULL },
>  	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, NULL },
> +	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
>  	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, NULL },
>  	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, NULL },
>  	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, NULL },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 2c1b006..b76b663 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_WDMA,
>  	MTK_DISP_COLOR,
>  	MTK_DISP_CCORR,
> +	MTK_DISP_DITHER,
>  	MTK_DISP_AAL,
>  	MTK_DISP_GAMMA,
>  	MTK_DISP_UFOE,
> @@ -49,6 +50,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_CCORR,
>  	DDP_COMPONENT_COLOR0,
>  	DDP_COMPONENT_COLOR1,
> +	DDP_COMPONENT_DITHER,
>  	DDP_COMPONENT_DPI0,
>  	DDP_COMPONENT_DPI1,
>  	DDP_COMPONENT_DSI0,

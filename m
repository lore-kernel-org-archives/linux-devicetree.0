From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 30/32] drm/mediatek: add connection from DITHER0 to
 DSI0
Date: Fri, 30 Aug 2019 14:34:32 +0800
Message-ID: <1567146872.5942.21.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
         <1567090254-15566-31-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-31-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add connection from DITHER0 to DSI0

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 237824f..fd38658 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -35,10 +35,12 @@
>  
>  #define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
>  #define MT8183_DISP_OVL1_2L_MOUT_EN		0xf08
> +#define MT8183_DISP_DITHER0_MOUT_EN		0xf0c
>  #define MT8183_DISP_PATH0_SEL_IN		0xf24
>  
>  #define OVL0_2L_MOUT_EN_DISP_PATH0			BIT(0)
>  #define OVL1_2L_MOUT_EN_RDMA1				BIT(4)
> +#define DITHER0_MOUT_IN_DSI0				BIT(0)
>  #define DISP_PATH0_SEL_IN_OVL0_2L			0x1
>  
>  #define MT2701_DISP_MUTEX0_MOD0			0x2c
> @@ -323,6 +325,9 @@ static unsigned int mtk_ddp_mout_en(const struct mtk_mmsys_reg_data *data,
>  		   next == DDP_COMPONENT_RDMA1) {
>  		*addr = MT8183_DISP_OVL1_2L_MOUT_EN;
>  		value = OVL1_2L_MOUT_EN_RDMA1;
> +	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
> +		*addr = MT8183_DISP_DITHER0_MOUT_EN;
> +		value = DITHER0_MOUT_IN_DSI0;
>  	} else {
>  		value = 0;
>  	}

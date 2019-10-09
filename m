From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 16/32] drm/mediatek: add component OVL_2L1
Date: Wed, 9 Oct 2019 17:18:26 +0800
Message-ID: <1570612706.7713.2.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
         <1567090254-15566-17-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-17-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add component OVL_2L1
> 

Applied to mediatek-drm-next-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.5

Regards,
CK

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 4200f89..af8e872 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -260,6 +260,7 @@ struct mtk_ddp_comp_match {
>  	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, NULL },
>  	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, NULL },
>  	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
> +	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, NULL },
>  	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
>  	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
>  	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 9caec2d..962d14a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -52,6 +52,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_OD1,
>  	DDP_COMPONENT_OVL0,
>  	DDP_COMPONENT_OVL_2L0,
> +	DDP_COMPONENT_OVL_2L1,
>  	DDP_COMPONENT_OVL1,
>  	DDP_COMPONENT_PWM0,
>  	DDP_COMPONENT_PWM1,

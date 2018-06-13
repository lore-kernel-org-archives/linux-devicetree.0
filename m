From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 22/28] drm/mediatek: add connection from RDMA2 to DSI3
Date: Wed, 13 Jun 2018 15:19:48 +0800
Message-ID: <1528874388.30263.9.camel@mtksdaap41>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
         <1528687580-549-23-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528687580-549-23-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Stu:

On Mon, 2018-06-11 at 11:26 +0800, Stu Hsieh wrote:
> This patch add the connection from RDMA2 to DSI3
> 
> Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index ce89a1d86b93..5a8569fa6505 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -96,6 +96,7 @@
>  #define RDMA2_MOUT_DPI1			0x3
>  #define RDMA2_MOUT_DSI1			0x1
>  #define RDMA2_MOUT_DSI2			0x4
> +#define RDMA2_MOUT_DSI3			0x5

Usually, each bit of a mout register represent a output enable. Is this
value 0x5 a correct value?

Regards,
CK

>  #define DPI0_SEL_IN_RDMA1		0x1
>  #define DPI0_SEL_IN_RDMA2		0x3
>  #define DPI1_SEL_IN_RDMA1		(0x1 << 8)
> @@ -105,6 +106,7 @@
>  #define DSI2_SEL_IN_RDMA1		(0x1 << 16)
>  #define DSI2_SEL_IN_RDMA2		(0x4 << 16)
>  #define DSI3_SEL_IN_RDMA1		(0x1 << 16)
> +#define DSI3_SEL_IN_RDMA2		(0x4 << 16)
>  #define COLOR1_SEL_IN_OVL1		0x1
>  
>  #define OVL_MOUT_EN_RDMA		0x1
> @@ -214,6 +216,9 @@ static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>  		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>  		value = RDMA2_MOUT_DSI2;
> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
> +		value = RDMA2_MOUT_DSI3;
>  	} else {
>  		value = 0;
>  	}
> @@ -257,6 +262,9 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>  		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>  		value = DSI2_SEL_IN_RDMA2;
> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
> +		value = DSI3_SEL_IN_RDMA2;
>  	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>  		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>  		value = COLOR1_SEL_IN_OVL1;

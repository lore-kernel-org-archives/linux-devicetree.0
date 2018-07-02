From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 00/29] Add support for mediatek SOC MT2712
Date: Mon, 2 Jul 2018 09:39:10 +0800
Message-ID: <1530495550.4568.2.camel@mtksdaap41>
References: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529482771-2153-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi, Stu:

On Wed, 2018-06-20 at 16:19 +0800, Stu Hsieh wrote:
> This patch add support for the Mediatek MT2712 DISP subsystem.
> MT2712 is base on MT8173, there are some difference as following:
> MT2712 support three disp output(two ovl and one rdma)
> 

For the series, applied to mediatek-drm-next-4.19 [1], the patch
'drm/mediatek: Add support for mediatek SOC MT2712' has line over 80
character, so I've modified it.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-4.19

Regards,
CK

> Change in v6:
> - Update commit message for the patch
>   "drm/mediatek: Update the definition of connection from RDMA1 to DPI0"
> 
> Stu Hsieh (29):
>   drm/mediatek: update dt-bindings for mt2712
>   drm/mediatek: support maximum 64 mutex mod
>   drm/mediatek: add ddp component AAL1
>   drm/mediatek: add ddp component OD1
>   drm/mediatek: add ddp component PWM1
>   drm/mediatek: add ddp component PWM2
>   drm/mediatek: add component DPI1
>   drm/mediatek: add component DSI2
>   drm/mediatek: add component DSI3
>   drm/mediatek: add the DSI1 for component init condition
>   drm/mediatek: add connection from OD1 to RDMA1
>   drm/mediatek: Update the definition of connection from RDMA1 to DPI0
>   drm/mediatek: add connection from RDMA0 to DPI0
>   drm/mediatek: add connection from RDMA0 to DSI2
>   drm/mediatek: add connection from RDMA0 to DSI3
>   drm/mediatek: add connection from RDMA1 to DPI1
>   drm/mediatek: add connection from RDMA1 to DSI1
>   drm/mediatek: add connection from RDMA1 to DSI2
>   drm/mediatek: add connection from RDMA1 to DSI3
>   drm/mediatek: add connection from RDMA2 to DPI0
>   drm/mediatek: add connection from RDMA2 to DPI1
>   drm/mediatek: add connection from RDMA2 to DSI1
>   drm/mediatek: add connection from RDMA2 to DSI2
>   drm/mediatek: add connection from RDMA2 to DSI3
>   drm/mediatek: add DPI1 support for mutex
>   drm/mediatek: add DSI2 support for mutex
>   drm/mediatek: add DSI3 support for mutex
>   drm/mediatek: add third ddp path
>   drm/mediatek: Add support for mediatek SOC MT2712
> 
>  .../bindings/display/mediatek/mediatek,disp.txt    |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 235 ++++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  15 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  10 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  47 ++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   5 +-
>  7 files changed, 274 insertions(+), 43 deletions(-)
> 

From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 00/32] add drm support for MT8183
Date: Wed, 9 Oct 2019 17:47:25 +0800
Message-ID: <1570614445.12886.4.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

To make process more smoothly, I've applied some stable patches of this
series in mediatek-drm-next-5.5 [1]. The applied patches include
dt-bindings, CCORR, DITHER, OVL, Mutex related patches. The non-applied
patches include mmsys related patches. Please based on the applied
patches to send new version.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.5

Regards,
CK

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This series are based on 5.3-rc1 and provid 32 patch
> to support mediatek SOC MT8183
> 
> Change since v4
> - fix reviewed issue in v4
> 
> Change since v3
> - fix reviewed issue in v3
> - fix type error in v3
> - fix conflict with iommu patch
> 
> Change since v2
> - fix reviewed issue in v2
> - add mutex node into dts file
> 
> Changes since v1:
> - fix reviewed issue in v1
> - add dts for mt8183 display nodes
> - adjust display clock control flow in patch 22
> - add vmap support for mediatek drm in patch 23
> - fix page offset issue for mmap function in patch 24
> - enable allow_fb_modifiers for mediatek drm in patch 25
> 
> Yongqiang Niu (32):
>   dt-bindings: mediatek: add binding for mt8183 display
>   dt-bindings: mediatek: add ovl_2l description for mt8183 display
>   dt-bindings: mediatek: add ccorr description for mt8183 display
>   dt-bindings: mediatek: add dither description for mt8183 display
>   dt-bindings: mediatek: add mutex description for mt8183 display
>   arm64: dts: add display nodes for mt8183
>   drm/mediatek: add mutex mod into ddp private data
>   drm/mediatek: add mutex mod register offset into ddp private data
>   drm/mediatek: add mutex sof into ddp private data
>   drm/mediatek: add mutex sof register offset into ddp private data
>   drm/mediatek: split DISP_REG_CONFIG_DSI_SEL setting into another use
>     case
>   drm/mediatek: add mmsys private data for ddp path config
>   drm/mediatek: move rdma sout from mtk_ddp_mout_en into
>     mtk_ddp_sout_sel
>   drm/mediatek: add ddp component CCORR
>   drm/mediatek: add commponent OVL_2L0
>   drm/mediatek: add component OVL_2L1
>   drm/mediatek: add component DITHER
>   drm/mediatek: add gmc_bits for ovl private data
>   drm/medaitek: add layer_nr for ovl private data
>   drm/mediatek: add function to background color input select for
>     ovl/ovl_2l direct link
>   drm/mediatek: add background color input select function for
>     ovl/ovl_2l
>   drm/mediatek: add ovl0/ovl_2l0 usecase
>   drm/mediatek: distinguish ovl and ovl_2l by layer_nr
>   drm/mediatek: add clock property check before get it
>   drm/mediatek: add connection from OVL0 to OVL_2L0
>   drm/mediatek: add connection from RDMA0 to COLOR0
>   drm/mediatek: add connection from RDMA1 to DSI0
>   drm/mediatek: add connection from OVL_2L0 to RDMA0
>   drm/mediatek: add connection from OVL_2L1 to RDMA1
>   drm/mediatek: add connection from DITHER0 to DSI0
>   drm/mediatek: add connection from RDMA0 to DSI0
>   drm/mediatek: add support for mediatek SOC MT8183
> 
>  .../bindings/display/mediatek/mediatek,disp.txt    |  30 +-
>  .../bindings/display/mediatek/mediatek,display.txt |  21 ++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 111 ++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  79 +++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  27 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  42 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 410 ++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |   6 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  67 ++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  21 ++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  50 +++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   3 +
>  12 files changed, 745 insertions(+), 122 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,display.txt
> 

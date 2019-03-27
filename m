From: <yongqiang.niu@mediatek.com>
Subject: [PATCH v2 00/25] add drm support for MT8183
Date: Wed, 27 Mar 2019 14:18:56 +0800
Message-ID: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This series are based on 5.1-rc1 and provide 25 patches to
support mediatek SOC MT8183

Changes since v1:
- fix reviewed issue in v1
- add dts for mt8183 display nodes
- adjust display clock control flow in patch 22
- add vmap support for mediatek drm in patch 23
- fix page offset issue for mmap function in patch 24
- enable allow_fb_modifiers for mediatek drm in patch 25

Yongqiang Niu (25):
  arm64: dts: add display nodes for mt8183
  dt-bindings: mediatek: add binding for mt8183 display
  drm/mediatek: add mutex mod into ddp private data
  drm/mediatek: add mutex sof into ddp private data
  drm/mediatek: split DISP_REG_CONFIG_DSI_SEL setting into another use
    case
  drm/mediatek: redefine mtk_ddp_sout_sel
  drm/mediatek: move rdma sout from mtk_ddp_mout_en into
    mtk_ddp_sout_sel
  drm/mediatek: add ddp component CCORR
  drm/mediatek: add mmsys private data for ddp path config
  drm/mediatek: add commponent OVL0_2L
  drm/mediatek: add component OVL1_2L
  drm/mediatek: add component DITHER
  drm/mediatek: add gmc_bits for ovl private data
  drm/medaitek: add layer_nr for ovl private data
  drm/mediatek: add function to background color input select for
    ovl/ovl_2l direct link
  drm/mediatek: add ddp write register common api
  drm/mediatek: add background color input select function for
    ovl/ovl_2l
  drm/mediatek: add RDMA fifo size error handle
  drm/mediatek: add function mtk_ddp_comp_get_type
  drm/mediatek: add ovl0/ovl0_2l usecase
  drm/mediatek: add support for mediatek SOC MT8183
  drm/mediatek: adjust ddp clock control flow
  drm/mediatek: add vmap support for mediatek drm
  drm/mediatek: respect page offset for PRIME mmap calls
  drm/mediatek: enable allow_fb_modifiers for mediatek drm

 .../bindings/display/mediatek/mediatek,disp.txt    |  37 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           | 107 +++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  81 +++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  21 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  68 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 444 ++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  11 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  87 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  28 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  61 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |  14 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h             |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  15 +-
 14 files changed, 838 insertions(+), 141 deletions(-)

-- 
1.8.1.1.dirty

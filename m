From: <yt.shen@mediatek.com>
Subject: [RFC 0/3] MT2701 DRM support
Date: Thu, 12 May 2016 19:49:52 +0800
Message-ID: <1463053795-55455-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, YT Shen <yt.shen@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: YT Shen <yt.shen@mediatek.com>

This is MT2701 DRM support RFC, based on MT8173 DRM patch v16.
Most codes are the same, except some register changed.

For example:
 - DISP_OVL address offset changed, color format definition changed.
 - DISP_RDMA fifo size changed.
 - DISP_COLOR offset changed.

We add a new component DISP_BLS, and the connection settings are updated.
And we have shadow register support in MT2701.

The RFC depends on MT2701 iommu/smi driver.
https://patchwork.kernel.org/patch/9043411/ ("dt-bindings: mediatek: add descriptions for mediatek mt2701 iommu and smi"),
https://patchwork.kernel.org/patch/9043391/ ("iommu/mediatek: move the common struct into header file"),
https://patchwork.kernel.org/patch/9043421/ ("memory/mediatek: add support for mt2701"),
https://patchwork.kernel.org/patch/9043451/ ("iommu/mediatek: add support for mtk iommu generation one HW"),
https://patchwork.kernel.org/patch/9043471/ ("ARM: dts: mt2701: add iommu/smi dtsi node for mt2701"),

Thanks,
yt.shen

YT Shen (3):
  dt-bindings: drm/mediatek: Add display binding for Mediatek SoC MT2701
  drm/mediatek: add support for Mediatek SoC MT2701
  arm: dts: mt2701: Add display subsystem related nodes for MT2701

 .../bindings/display/mediatek/mediatek,disp.txt    |    1 +
 arch/arm/boot/dts/mt2701.dtsi                      |  117 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   49 +++++--
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   36 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |   78 ++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             |  151 +++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |    2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   63 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |   15 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   72 ++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |    9 ++
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |    4 +
 12 files changed, 491 insertions(+), 106 deletions(-)

-- 
1.7.9.5

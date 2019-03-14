From: <yongqiang.niu@mediatek.com>
Subject: [RESEND PATCH v1 00/18] add drm support for MT8183
Date: Thu, 14 Mar 2019 20:05:02 +0800
Message-ID: <1552565120-24329-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com, Yongqiang Niu <yongqiang.niu@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

This series are based on 4.20-rc1 and provide 18 patches to
support mediatek SOC MT8183
Resend first version 

Yongqiang Niu (18):
  drm/mediatek: update dt-bindings for mt8183
  drm/mediatek: add mutex mod and sof into ddp private data
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
  drm/mediatek: add function to connect module with it's previous one
  drm/mediatek: add ddp write register common api
  drm/mediatek: add connect function for ovl
  drm/mediatek: add RDMA1 fifo size into RDMA private data
  drm/mediatek: add function mtk_ddp_comp_get_type
  drm/mediatek: add ovl0/ovl0_2l usecase
  drm/mediatek: add support for mediatek SOC MT8183

 .../bindings/display/mediatek/mediatek,disp.txt    |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  64 ++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  42 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 458 ++++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  11 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 100 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  55 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
 10 files changed, 688 insertions(+), 104 deletions(-)

-- 
1.8.1.1.dirty

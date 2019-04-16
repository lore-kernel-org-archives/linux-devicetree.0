From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v1 0/4] make hdmi work on bananapi-r2
Date: Tue, 16 Apr 2019 16:58:44 +0200
Message-ID: <20190416145848.11932-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, chunhui dai <chunhui.dai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

This Patch-Series adds missing Patches/Bugfixes to get hdmi working on BPI=
-R2

first 2 Patches were already posted, but not yet merged into mainline
i found no hint why
- config component output by device node port
  https://patchwork.kernel.org/patch/10609007/
- add display subsystem related device nodes (resend)
  https://patchwork.kernel.org/patch/10588951/

Bibby Hsieh (1):
  drm/mediatek: config component output by device node port

Ryder Lee (2):
  arm: dts: mt7623: add display subsystem related device nodes
  drm/mediatek: fix possible_crtcs

chunhui dai (1):
  drm/mediatek: fix boot up for 720 and 480 but 1080

 arch/arm/boot/dts/mt7623.dtsi                 | 177 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  85 +++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  85 +++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  41 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c       |   3 +
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |   1 +
 .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |   1 +
 9 files changed, 390 insertions(+), 9 deletions(-)

=2D-
2.17.1

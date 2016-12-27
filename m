From: HS Liao <hs.liao@mediatek.com>
Subject: [PATCH v18 0/4] Mediatek MT8173 CMDQ support
Date: Tue, 27 Dec 2016 11:39:17 +0800
Message-ID: <1482809961-31930-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.co>
List-Id: devicetree@vger.kernel.org


Hi,

This is Mediatek MT8173 Command Queue(CMDQ) driver. The CMDQ is used
to help write registers with critical time limitation, such as
updating display configuration during the vblank. It controls Global
Command Engine (GCE) hardware to achieve this requirement.

These patches have a build dependency on top of v4.10-rc1.

Changes since v17:
 - rebase to v4.10-rc1

Best regards,
HS Liao

HS Liao (4):
  dt-bindings: soc: Add documentation for the MediaTek GCE unit
  mailbox: mediatek: Add Mediatek CMDQ driver
  arm64: dts: mt8173: Add GCE node
  soc: mediatek: Add Mediatek CMDQ helper

 .../devicetree/bindings/mailbox/mtk-gce.txt        |  43 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 | 632 +++++++++++++++++++++
 drivers/soc/mediatek/Kconfig                       |  11 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 310 ++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h           |  75 +++
 include/linux/soc/mediatek/mtk-cmdq.h              | 174 ++++++
 10 files changed, 1268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
 create mode 100644 drivers/mailbox/mtk-cmdq-mailbox.c
 create mode 100644 drivers/soc/mediatek/mtk-cmdq-helper.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-mailbox.h
 create mode 100644 include/linux/soc/mediatek/mtk-cmdq.h

-- 
1.9.1

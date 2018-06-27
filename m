From: Houlong Wei <houlong.wei@mediatek.com>
Subject: [PATCH v22 0/4] MediaTek MT8173 CMDQ support
Date: Wed, 27 Jun 2018 19:16:08 +0800
Message-ID: <1530098172-31385-1-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>, ginny.chen@mediatek.com, enzhu.wa
List-Id: devicetree@vger.kernel.org

Hi,

This is Mediatek MT8173 Command Queue(CMDQ) driver. The CMDQ is used
to help write registers with critical time limitation, such as
updating display configuration during the vblank. It controls Global
Command Engine (GCE) hardware to achieve this requirement.

Changes since v21:
 -rebase on v4.18-rc1
 -remove subsys code and event id definition from mtk-cmdq-helper.c
 -add mt8173-gce.h to define the subsys code and envent id
Changes since v20:
 -rebase on v4.15-rc1
 -move dma_map_single outside of spinlock
Changes since v19:
- rebase to v4.10-rc2

Houlong Wei (4):
  dt-bindings: soc: Add documentation for the MediaTek GCE unit
  mailbox: mediatek: Add Mediatek CMDQ driver
  arm64: dts: mt8173: Add GCE node
  soc: mediatek: Add Mediatek CMDQ helper

 .../devicetree/bindings/mailbox/mtk-gce.txt        |   65 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   11 +
 drivers/mailbox/Kconfig                            |   10 +
 drivers/mailbox/Makefile                           |    2 +
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  633 ++++++++++++++++++++
 drivers/soc/mediatek/Kconfig                       |   12 +
 drivers/soc/mediatek/Makefile                      |    1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             |  258 ++++++++
 include/dt-bindings/gce/mt8173-gce.h               |   48 ++
 include/linux/mailbox/mtk-cmdq-mailbox.h           |   70 +++
 include/linux/soc/mediatek/mtk-cmdq.h              |  132 ++++
 11 files changed, 1242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
 create mode 100644 drivers/mailbox/mtk-cmdq-mailbox.c
 create mode 100644 drivers/soc/mediatek/mtk-cmdq-helper.c
 create mode 100644 include/dt-bindings/gce/mt8173-gce.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-mailbox.h
 create mode 100644 include/linux/soc/mediatek/mtk-cmdq.h

-- 
1.7.9.5 

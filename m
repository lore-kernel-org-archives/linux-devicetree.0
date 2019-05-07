From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v5 00/14] support gce on mt8183 platform
Date: Tue, 7 May 2019 16:13:43 +0800
Message-ID: <20190507081355.52630-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Changes since v4:
 - refine the architecture of the packet encoder function
 - refine the gce enevt property
 - change the patch's title

Changes since v3:
 - fix a typo in dt-binding and dtsi
 - cast the return value to right format

Changes since v2:
 - according to CK's review comment, change the property name and
   refine the parameter
 - change the patch's title
 - remove unused property from dt-binding and dts

Changes since v1:
 - add prefix "cmdq" in the commit subject
 - add dt-binding document for get event and subsys function
 - add fix up tag in fixup patch
 - fix up some coding style (alignment)

MTK will support gce function on mt8183 platform.
  dt-binding: gce: add gce header file for mt8183
  mailbox: mediatek: cmdq: support mt8183 gce function
  arm64: dts: add gce node for mt8183

Besides above patches, we refine gce driver on those patches.
  mailbox: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
  soc: mediatek: cmdq: clear the event in cmdq initial flow

In order to enhance the convenience of gce usage, we add new helper
functions and refine the method of instruction combining.
  dt-binding: gce: remove thread-num property
  dt-binding: gce: add binding for gce subsys property
  dt-binding: gce: add binding for gce event property
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_subsys function
  soc: mediatek: cmdq: add cmdq_dev_get_event function

Bibby Hsieh (12):
  dt-binding: gce: remove thread-num property
  dt-binding: gce: add gce header file for mt8183
  dt-binding: gce: add binding for gce subsys property
  dt-binding: gce: add binding for gce event property
  mailbox: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
  mailbox: mediatek: cmdq: support mt8183 gce function
  soc: mediatek: cmdq: clear the event in cmdq initial flow
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_subsys function
  soc: mediatek: cmdq: add cmdq_dev_get_event function
  arm64: dts: add gce node for mt8183

 .../devicetree/bindings/mailbox/mtk-gce.txt   |  31 ++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  11 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  18 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 195 ++++++++++++++----
 include/dt-bindings/gce/mt8183-gce.h          | 177 ++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   5 +
 include/linux/soc/mediatek/mtk-cmdq.h         |  62 +++++-
 7 files changed, 437 insertions(+), 62 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8183-gce.h

-- 
2.18.0

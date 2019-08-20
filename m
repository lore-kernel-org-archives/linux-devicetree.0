From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v13 00/12] support gce on mt8183 platform
Date: Tue, 20 Aug 2019 16:36:23 +0800
Message-ID: <20190820083635.5404-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

Changes since v12:
 - clear the value of command ptr address.
 - fixup some typo and remove unused define.

Changes since v11:
 - correct some data type to avoid type conversion.

Changes since v10:
 - remove subsys-cell from gce device node
 - use of_parse_phandle_with_fixed_args instead of
   of_parse_phandle_with_args

Changes since v8 and v9:
 - change the error return code in cmdq_dev_get_client_reg()

Changes since v7:
 - remove the memory allocation out of cmdq_dev_get_client_reg()
 - rebase onto 5.2-rc1

Changes since v6:
 - remove cmdq_dev_get_event function and gce event property
 - separate some changes to indepentent patch
 - change the binding document related to gce-client-reg property

Changes since v5:
 - fix typo
 - remove gce-event-name form the dt-binding
 - add reasons in commit message

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
  soc: mediatek: cmdq: reorder the parameter
  soc: mediatek: cmdq: change the type of input parameter
  mailbox: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
  soc: mediatek: cmdq: clear the event in cmdq initial flow

In order to enhance the convenience of gce usage, we add new
helper functions and refine the method of instruction combining.
  dt-binding: gce: remove thread-num property
  dt-binding: gce: add binding for gce client reg property
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_client_reg function

Bibby Hsieh (12):
  dt-binding: gce: remove thread-num property
  dt-binding: gce: add gce header file for mt8183
  dt-binding: gce: add binding for gce client reg property
  mailbox: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
  mailbox: mediatek: cmdq: support mt8183 gce function
  soc: mediatek: cmdq: clear the event in cmdq initial flow
  soc: mediatek: cmdq: reorder the parameter
  soc: mediatek: cmdq: change the type of input parameter
  soc: mediatek: cmdq: define the instruction struct
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_client_reg function
  arm64: dts: add gce node for mt8183

 .../devicetree/bindings/mailbox/mtk-gce.txt   |  23 ++-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  10 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  18 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 173 +++++++++++++----
 include/dt-bindings/gce/mt8183-gce.h          | 175 ++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   5 +
 include/linux/soc/mediatek/mtk-cmdq.h         |  53 +++++-
 7 files changed, 395 insertions(+), 62 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8183-gce.h

-- 
2.18.0

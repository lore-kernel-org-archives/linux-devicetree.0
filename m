From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 00/10] support gce on mt8183 platform
Date: Wed, 6 Mar 2019 17:50:25 +0800
Message-ID: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Changes since v1:
 - add prefix "cmdq" in the commit subject
 - add dt-binding document for get event and subsys function
 - add fix up tag in fixup patch
 - fix up some coding style (alignment)

MTK will support gce function on mt8183 platform.
	dt-binding: gce: add gce header file for mt8183
	soc: mediatek: cmdq: add mt8183 compatible name

Besides above patches, we refine gce driver on those patches.
	soc: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
	soc: mediatek: cmdq: clear the event in cmdq initial flow

In ordet to enhance the convenience of gce usage, we add new helper
functions and refine the method of instruction combining. 
	dt-binding: gce: add binding for gce event property
	dt-binding: gce: add binding for gce subsys property
	soc: mediatek: cmdq: add packet encoder function
	soc: mediatek: cmdq: add polling function
	soc: mediatek: cmdq: add cmdq_dev_get_subsys function
	soc: mediatek: cmdq: add cmdq_dev_get_event function

Bibby Hsieh (10):
  dt-binding: gce: add gce header file for mt8183
  dt-binding: gce: add binding for gce event property
  dt-binding: gce: add binding for gce subsys property
  soc: mediatek: cmdq: add mt8183 compatible name
  soc: mediatek: cmdq: move the CMDQ_IRQ_MASK into cmdq driver data
  soc: mediatek: cmdq: clear the event in cmdq initial flow
  soc: mediatek: cmdq: add packet encoder function
  soc: mediatek: cmdq: add polling function
  soc: mediatek: cmdq: add cmdq_dev_get_subsys function
  soc: mediatek: cmdq: add cmdq_dev_get_event function

 .../devicetree/bindings/mailbox/mtk-gce.txt        |  33 +++-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  18 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 202 +++++++++++++++++----
 include/dt-bindings/gce/mt8183-gce.h               | 177 ++++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h           |   5 +
 include/linux/soc/mediatek/mtk-cmdq.h              |  61 ++++++-
 6 files changed, 439 insertions(+), 57 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8183-gce.h

-- 
1.9.1

From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 00/10] support gce on mt8183 platform
Date: Tue, 29 Jan 2019 15:31:57 +0800
Message-ID: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, kendrick.hsu@mediatek.com, linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Frederic Chen <Frederic.Chen@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

MTK will support gce function on mt8183 platform.
	soc: mediatek: add mt8183 compatible name
	dt-binding: gce: add gce header file for mt8183

Besides above patches, we refine gce driver on those patches.
	soc: mediatek: move the CMDQ_IRQ_MASK into cmdq driver data
	soc: mediatek: clear the event in cmdq initial flow

In ordet to enhance the convenience of gce usage, we add new helper
functions and refine the method of instruction combining. 
	soc: mediatek: add subsys-base address transform function
	soc: mediatek: add register device function
	soc: mediatek: add cmdq_dev_get_event function
	soc: mediatek: add packet encoder function
	soc: mediatek: change the argument of write and write_mask API
	soc: mediatek: add polling function

Bibby Hsieh (10):
  soc: mediatek: add mt8183 compatible name
  dt-binding: gce: add gce header file for mt8183
  soc: mediatek: move the CMDQ_IRQ_MASK into cmdq driver data
  soc: mediatek: clear the event in cmdq initial flow
  soc: mediatek: add subsys-base address transform function
  soc: mediatek: add register device function
  soc: mediatek: add cmdq_dev_get_event function
  soc: mediatek: add packet encoder function
  soc: mediatek: change the argument of write and write_mask API
  soc: mediatek: add polling function

 .../devicetree/bindings/mailbox/mtk-gce.txt        |   6 +-
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  18 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 212 +++++++++++++++++----
 include/dt-bindings/gce/mt8183-gce.h               | 177 +++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h           |   5 +
 include/linux/soc/mediatek/mtk-cmdq.h              |  52 +++--
 6 files changed, 412 insertions(+), 58 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8183-gce.h

-- 
1.9.1

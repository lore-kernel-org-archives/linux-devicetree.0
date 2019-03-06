From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 09/10] soc: mediatek: cmdq: add cmdq_dev_get_subsys function
Date: Wed, 6 Mar 2019 17:50:34 +0800
Message-ID: <1551865835-50974-10-git-send-email-bibby.hsieh@mediatek.com>
References: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

GCE cannot know the register base address, this function
can help cmdq client to get the relationship of subsys
and register base address.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 24 ++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 17 +++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 71c167c..0a9609e 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -47,6 +47,30 @@ static void cmdq_pkt_instr_encoder(struct cmdq_pkt *pkt, s16 arg_c, s16 arg_b,
 	pkt->cmd_buf_size += CMDQ_INST_SIZE;
 }
 
+struct cmdq_subsys *cmdq_dev_get_subsys(struct device *dev, int idx)
+{
+	struct cmdq_subsys *subsys;
+	struct of_phandle_args spec;
+
+	subsys = devm_kzalloc(dev, sizeof(*subsys), GFP_KERNEL);
+	if (!subsys)
+		return NULL;
+
+	if (of_parse_phandle_with_args(dev->of_node, "mediatek,gce-subsys",
+				       "#subsys-cells", idx, &spec)) {
+		dev_err(dev, "can't parse gce-subsys property");
+
+		return -ENODEV;
+	}
+
+	subsys->base = spec.args[0];
+	subsys->id = spec.args[1];
+	of_node_put(spec.np);
+
+	return subsys;
+}
+EXPORT_SYMBOL(cmdq_dev_get_subsys);
+
 static void cmdq_client_timeout(struct timer_list *t)
 {
 	struct cmdq_client *client = from_timer(client, t, timer);
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 0651a0b..e39ba1e 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -15,6 +15,11 @@
 
 struct cmdq_pkt;
 
+struct cmdq_subsys {
+	u32 base;
+	u8 id;
+};
+
 struct cmdq_client {
 	spinlock_t lock;
 	u32 pkt_cnt;
@@ -142,4 +147,16 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
  */
 int cmdq_pkt_flush(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_dev_get_subsys() - parse sub system from the device node of CMDQ client
+ * @dev:	device of CMDQ mailbox client
+ * @idx:	the index of desired subsys
+ *
+ * Return: CMDQ subsys pointer
+ *
+ * Help CMDQ client pasing the sub system number
+ * from the device node of CMDQ client.
+ */
+struct cmdq_subsys *cmdq_dev_get_subsys(struct device *dev, int idx);
+
 #endif	/* __MTK_CMDQ_H__ */
-- 
1.9.1

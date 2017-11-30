From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] soc: qcom: smp2p: Access APCS as mailbox client
Date: Wed, 29 Nov 2017 16:00:40 -0800
Message-ID: <20171130000040.23681-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Attempt to acquire the APCS IPC through the mailbox framework and fall
back to the old syscon based approach, to allow us to move away from
using the syscon.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added dt binding update
- Specifies knows_txdone on the mailbox client

 .../devicetree/bindings/soc/qcom/qcom,smp2p.txt    |  8 ++++-
 drivers/soc/qcom/Kconfig                           |  1 +
 drivers/soc/qcom/smp2p.c                           | 39 ++++++++++++++++++----
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
index af9ca37221ce..a35af2dafdad 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
@@ -17,9 +17,15 @@ processor ID) and a string identifier.
 	Value type: <prop-encoded-array>
 	Definition: one entry specifying the smp2p notification interrupt
 
-- qcom,ipc:
+- mboxes:
 	Usage: required
 	Value type: <prop-encoded-array>
+	Definition: reference to the associated doorbell in APCS, as described
+		    in mailbox/mailbox.txt
+
+- qcom,ipc:
+	Usage: required, unless mboxes is specified
+	Value type: <prop-encoded-array>
 	Definition: three entries specifying the outgoing ipc bit used for
 		    signaling the remote end of the smp2p edge:
 		    - phandle to a syscon node representing the apcs registers
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index b81374bb6713..40c711583f0d 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,6 +75,7 @@ config QCOM_SMEM_STATE
 
 config QCOM_SMP2P
 	tristate "Qualcomm Shared Memory Point to Point support"
+	depends on MAILBOX
 	depends on QCOM_SMEM
 	select QCOM_SMEM_STATE
 	help
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index f51fb2ea7200..669c8baa971b 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -126,6 +127,8 @@ struct smp2p_entry {
  * @ipc_regmap:	regmap for the outbound ipc
  * @ipc_offset:	offset within the regmap
  * @ipc_bit:	bit in regmap@offset to kick to signal remote processor
+ * @mbox_client: mailbox client handle
+ * @mbox_chan:	apcs ipc mailbox channel handle
  * @inbound:	list of inbound entries
  * @outbound:	list of outbound entries
  */
@@ -146,6 +149,9 @@ struct qcom_smp2p {
 	int ipc_offset;
 	int ipc_bit;
 
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+
 	struct list_head inbound;
 	struct list_head outbound;
 };
@@ -154,7 +160,13 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 {
 	/* Make sure any updated data is written before the kick */
 	wmb();
-	regmap_write(smp2p->ipc_regmap, smp2p->ipc_offset, BIT(smp2p->ipc_bit));
+
+	if (smp2p->mbox_chan) {
+		mbox_send_message(smp2p->mbox_chan, NULL);
+		mbox_client_txdone(smp2p->mbox_chan, 0);
+	} else {
+		regmap_write(smp2p->ipc_regmap, smp2p->ipc_offset, BIT(smp2p->ipc_bit));
+	}
 }
 
 /**
@@ -453,10 +465,6 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, smp2p);
 
-	ret = smp2p_parse_ipc(smp2p);
-	if (ret)
-		return ret;
-
 	key = "qcom,smem";
 	ret = of_property_read_u32_array(pdev->dev.of_node, key,
 					 smp2p->smem_items, 2);
@@ -483,9 +491,23 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		return irq;
 	}
 
+	smp2p->mbox_client.dev = &pdev->dev;
+	smp2p->mbox_client.knows_txdone = true;
+	smp2p->mbox_chan = mbox_request_channel(&smp2p->mbox_client, 0);
+	if (IS_ERR(smp2p->mbox_chan)) {
+		if (PTR_ERR(smp2p->mbox_chan) != -ENODEV)
+			return PTR_ERR(smp2p->mbox_chan);
+
+		smp2p->mbox_chan = NULL;
+
+		ret = smp2p_parse_ipc(smp2p);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_smp2p_alloc_outbound_item(smp2p);
 	if (ret < 0)
-		return ret;
+		goto release_mbox;
 
 	for_each_available_child_of_node(pdev->dev.of_node, node) {
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
@@ -540,6 +562,9 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 
 	smp2p->out->valid_entries = 0;
 
+release_mbox:
+	mbox_free_channel(smp2p->mbox_chan);
+
 	return ret;
 }
 
@@ -554,6 +579,8 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
 	list_for_each_entry(entry, &smp2p->outbound, node)
 		qcom_smem_state_unregister(entry->state);
 
+	mbox_free_channel(smp2p->mbox_chan);
+
 	smp2p->out->valid_entries = 0;
 
 	return 0;
-- 
2.15.0

From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v4 2/3] firmware: xilinx: Add APIs to control node status/power
Date: Fri, 1 Feb 2019 14:08:49 -0800
Message-ID: <1549058930-18644-3-git-send-email-jollys@xilinx.com>
References: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Rajan Vaja <rajan.vaja@xilinx.com>

Add Xilinx ZynqMP firmware APIs to control node status
and power. These APIs allows turning on/off power domain
and setting capabilities of devices present in power domain.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 58 ++++++++++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 26 ++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 8065e33..6660b8c 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -534,6 +534,61 @@ static int zynqmp_pm_set_suspend_mode(u32 mode)
 	return zynqmp_pm_invoke_fn(PM_SET_SUSPEND_MODE, mode, 0, 0, 0, NULL);
 }
 
+/**
+ * zynqmp_pm_request_node() - Request a node with specific capabilities
+ * @node:		Node ID of the slave
+ * @capabilities:	Requested capabilities of the slave
+ * @qos:		Quality of service (not supported)
+ * @ack:		Flag to specify whether acknowledge is requested
+ *
+ * This function is used by master to request particular node from firmware.
+ * Every master must request node before using it.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
+				  const u32 qos,
+				  const enum zynqmp_pm_request_ack ack)
+{
+	return zynqmp_pm_invoke_fn(PM_REQUEST_NODE, node, capabilities,
+				   qos, ack, NULL);
+}
+
+/**
+ * zynqmp_pm_release_node() - Release a node
+ * @node:	Node ID of the slave
+ *
+ * This function is used by master to inform firmware that master
+ * has released node. Once released, master must not use that node
+ * without re-request.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_release_node(const u32 node)
+{
+	return zynqmp_pm_invoke_fn(PM_RELEASE_NODE, node, 0, 0, 0, NULL);
+}
+
+/**
+ * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
+ * @node:		Node ID of the slave
+ * @capabilities:	Requested capabilities of the slave
+ * @qos:		Quality of service (not supported)
+ * @ack:		Flag to specify whether acknowledge is requested
+ *
+ * This API function is to be used for slaves a PU already has requested
+ * to change its capabilities.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_set_requirement(const u32 node, const u32 capabilities,
+				     const u32 qos,
+				     const enum zynqmp_pm_request_ack ack)
+{
+	return zynqmp_pm_invoke_fn(PM_SET_REQUIREMENT, node, capabilities,
+				   qos, ack, NULL);
+}
+
 static const struct zynqmp_eemi_ops eemi_ops = {
 	.get_api_version = zynqmp_pm_get_api_version,
 	.query_data = zynqmp_pm_query_data,
@@ -551,6 +606,9 @@ static const struct zynqmp_eemi_ops eemi_ops = {
 	.reset_get_status = zynqmp_pm_reset_get_status,
 	.init_finalize = zynqmp_pm_init_finalize,
 	.set_suspend_mode = zynqmp_pm_set_suspend_mode,
+	.request_node = zynqmp_pm_request_node,
+	.release_node = zynqmp_pm_release_node,
+	.set_requirement = zynqmp_pm_set_requirement,
 };
 
 /**
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index f84d700..c7a7748 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -40,8 +40,19 @@
 /* Payload size (consists of callback API ID + arguments) */
 #define CB_PAYLOAD_SIZE (CB_ARG_CNT + 1)
 
+#define ZYNQMP_PM_MAX_QOS		100U
+
+/* Node capabilities */
+#define	ZYNQMP_PM_CAPABILITY_ACCESS	0x1U
+#define	ZYNQMP_PM_CAPABILITY_CONTEXT	0x2U
+#define	ZYNQMP_PM_CAPABILITY_WAKEUP	0x4U
+#define	ZYNQMP_PM_CAPABILITY_POWER	0x8U
+
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_REQUEST_NODE = 13,
+	PM_RELEASE_NODE,
+	PM_SET_REQUIREMENT,
 	PM_RESET_ASSERT = 17,
 	PM_RESET_GET_STATUS,
 	PM_PM_INIT_FINALIZE = 21,
@@ -223,6 +234,12 @@ enum zynqmp_pm_suspend_reason {
 	SUSPEND_SYSTEM_SHUTDOWN,
 };
 
+enum zynqmp_pm_request_ack {
+	ZYNQMP_PM_REQUEST_ACK_NO = 1,
+	ZYNQMP_PM_REQUEST_ACK_BLOCKING,
+	ZYNQMP_PM_REQUEST_ACK_NON_BLOCKING,
+};
+
 /**
  * struct zynqmp_pm_query_data - PM query data
  * @qid:	query ID
@@ -255,6 +272,15 @@ struct zynqmp_eemi_ops {
 	int (*reset_get_status)(const enum zynqmp_pm_reset reset, u32 *status);
 	int (*init_finalize)(void);
 	int (*set_suspend_mode)(u32 mode);
+	int (*request_node)(const u32 node,
+			    const u32 capabilities,
+			    const u32 qos,
+			    const enum zynqmp_pm_request_ack ack);
+	int (*release_node)(const u32 node);
+	int (*set_requirement)(const u32 node,
+			       const u32 capabilities,
+			       const u32 qos,
+			       const enum zynqmp_pm_request_ack ack);
 };
 
 int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 arg0, u32 arg1,
-- 
2.7.4

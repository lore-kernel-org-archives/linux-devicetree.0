From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v6 2/3] firmware: xilinx: Implement ZynqMP power management APIs
Date: Tue, 29 Jan 2019 12:38:20 -0800
Message-ID: <1548794301-30483-3-git-send-email-jollys@xilinx.com>
References: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajan.vaja@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add Xilinx ZynqMP firmware APIs to set suspend mode
and inform firmware that master has initialized its
own power management.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 29 +++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 70b5037..8065e33 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -507,6 +507,33 @@ static int zynqmp_pm_reset_get_status(const enum zynqmp_pm_reset reset,
 	return ret;
 }
 
+/**
+ * zynqmp_pm_init_finalize() - PM call to inform firmware that the caller
+ *			       master has initialized its own power management
+ *
+ * This API function is to be used for notify the power management controller
+ * about the completed power management initialization.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_init_finalize(void)
+{
+	return zynqmp_pm_invoke_fn(PM_PM_INIT_FINALIZE, 0, 0, 0, 0, NULL);
+}
+
+/**
+ * zynqmp_pm_set_suspend_mode()	- Set system suspend mode
+ * @mode:	Mode to set for system suspend
+ *
+ * This API function is used to set mode of system suspend.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_set_suspend_mode(u32 mode)
+{
+	return zynqmp_pm_invoke_fn(PM_SET_SUSPEND_MODE, mode, 0, 0, 0, NULL);
+}
+
 static const struct zynqmp_eemi_ops eemi_ops = {
 	.get_api_version = zynqmp_pm_get_api_version,
 	.query_data = zynqmp_pm_query_data,
@@ -522,6 +549,8 @@ static const struct zynqmp_eemi_ops eemi_ops = {
 	.ioctl = zynqmp_pm_ioctl,
 	.reset_assert = zynqmp_pm_reset_assert,
 	.reset_get_status = zynqmp_pm_reset_get_status,
+	.init_finalize = zynqmp_pm_init_finalize,
+	.set_suspend_mode = zynqmp_pm_set_suspend_mode,
 };
 
 /**
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 07c587a..f84d700 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -28,14 +28,23 @@
 /* SMC SIP service Call Function Identifier Prefix */
 #define PM_SIP_SVC			0xC2000000
 #define PM_GET_TRUSTZONE_VERSION	0xa03
+#define PM_SET_SUSPEND_MODE		0xa02
+#define GET_CALLBACK_DATA		0xa01
 
 /* Number of 32bits values in payload */
 #define PAYLOAD_ARG_CNT	4U
 
+/* Number of arguments for a callback */
+#define CB_ARG_CNT     4
+
+/* Payload size (consists of callback API ID + arguments) */
+#define CB_PAYLOAD_SIZE (CB_ARG_CNT + 1)
+
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
 	PM_RESET_ASSERT = 17,
 	PM_RESET_GET_STATUS,
+	PM_PM_INIT_FINALIZE = 21,
 	PM_IOCTL = 34,
 	PM_QUERY_DATA,
 	PM_CLOCK_ENABLE,
@@ -208,6 +217,12 @@ enum zynqmp_pm_reset {
 	ZYNQMP_PM_RESET_END = ZYNQMP_PM_RESET_PS_PL3
 };
 
+enum zynqmp_pm_suspend_reason {
+	SUSPEND_POWER_REQUEST = 201,
+	SUSPEND_ALERT,
+	SUSPEND_SYSTEM_SHUTDOWN,
+};
+
 /**
  * struct zynqmp_pm_query_data - PM query data
  * @qid:	query ID
@@ -238,8 +253,13 @@ struct zynqmp_eemi_ops {
 	int (*reset_assert)(const enum zynqmp_pm_reset reset,
 			    const enum zynqmp_pm_reset_action assert_flag);
 	int (*reset_get_status)(const enum zynqmp_pm_reset reset, u32 *status);
+	int (*init_finalize)(void);
+	int (*set_suspend_mode)(u32 mode);
 };
 
+int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 arg0, u32 arg1,
+			u32 arg2, u32 arg3, u32 *ret_payload);
+
 #if IS_REACHABLE(CONFIG_ARCH_ZYNQMP)
 const struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void);
 #else
-- 
2.7.4

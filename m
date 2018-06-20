From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v9 03/10] firmware: xilinx: Add zynqmp IOCTL API for device control
Date: Wed, 20 Jun 2018 10:40:28 -0700
Message-ID: <1529516435-7315-4-git-send-email-jollys@xilinx.com>
References: <1529516435-7315-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529516435-7315-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Rajan Vaja <rajanv@xilinx.com>

Add ZynqMP firmware IOCTL API to control and configure
devices like PLLs, SD, Gem, etc.

Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 20 ++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 70e335a..34c5ad5 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -241,8 +241,28 @@ static int get_set_conduit_method(struct device_node *np)
 	return 0;
 }
 
+/**
+ * zynqmp_pm_ioctl() - PM IOCTL API for device control and configs
+ * @node_id:	Node ID of the device
+ * @ioctl_id:	ID of the requested IOCTL
+ * @arg1:	Argument 1 to requested IOCTL call
+ * @arg2:	Argument 2 to requested IOCTL call
+ * @out:	Returned output value
+ *
+ * This function calls IOCTL to firmware for device control and configuration.
+ *
+ * Return: Returns status, either success or error+reason
+ */
+static int zynqmp_pm_ioctl(u32 node_id, u32 ioctl_id, u32 arg1, u32 arg2,
+			   u32 *out)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id, ioctl_id,
+				   arg1, arg2, out);
+}
+
 static const struct zynqmp_eemi_ops eemi_ops = {
 	.get_api_version = zynqmp_pm_get_api_version,
+	.ioctl = zynqmp_pm_ioctl,
 };
 
 /**
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index cb63bed..2eec6e7 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -34,6 +34,7 @@
 
 enum pm_api_id {
 	PM_GET_API_VERSION = 1,
+	PM_IOCTL = 34,
 };
 
 /* PMU-FW return status codes */
@@ -49,6 +50,7 @@ enum pm_ret_status {
 
 struct zynqmp_eemi_ops {
 	int (*get_api_version)(u32 *version);
+	int (*ioctl)(u32 node_id, u32 ioctl_id, u32 arg1, u32 arg2, u32 *out);
 };
 
 #if IS_REACHABLE(CONFIG_ARCH_ZYNQMP)
-- 
2.7.4

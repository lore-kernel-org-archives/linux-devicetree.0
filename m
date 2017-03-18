From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] firmware: qcom: scm: Expose download-mode control
Date: Fri, 17 Mar 2017 21:15:22 -0700
Message-ID: <20170318041523.29757-2-bjorn.andersson@linaro.org>
References: <20170318041523.29757-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170318041523.29757-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to aid post-mortem debugging the Qualcomm platforms provides a
"memory download mode", where the boot loader will provide an interface
for custom tools to "download" the content of RAM to a host machine.

The mode is triggered by writing a magic value somehwere in RAM, that is
read in the boot code path after a warm-restart. Two mechanism for
setting this magic value are supported in modern platforms; a direct SCM
call to enable the mode or through a secure io write of a magic value.

In order for a normal reboot not to trigger "download mode" the magic
must be cleared during a clean reboot.

Download mode has to be enabled by including qcom_scm.download_mode=1 on
the command line.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
 drivers/firmware/qcom_scm-32.c                     |  6 ++++
 drivers/firmware/qcom_scm-64.c                     | 16 +++++++++
 drivers/firmware/qcom_scm.c                        | 42 ++++++++++++++++++++++
 drivers/firmware/qcom_scm.h                        |  2 ++
 5 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 20f26fbce875..8467a181f22c 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -18,6 +18,7 @@ Required properties:
  * Core, iface, and bus clocks required for "qcom,scm"
 - clock-names: Must contain "core" for the core clock, "iface" for the interface
   clock and "bus" for the bus clock per the requirements of the compatible.
+- qcom,dload-mode-addr: Specifies the address for the download mode magic (optional)
 
 Example for MSM8916:
 
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 4284745e5516..f944dae950ad 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -561,6 +561,12 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	return ret ? : le32_to_cpu(out);
 }
 
+int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
+{
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
+				     enable ? QCOM_SCM_SET_DLOAD_MODE : 0, 0);
+}
+
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 {
 	struct {
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index eb92e67e9e41..9d7c37577be3 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -382,6 +382,22 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 	return ret ? : res.a1;
 }
 
+int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+	int ret;
+
+	desc.args[0] = QCOM_SCM_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_SET_DLOAD_MODE : 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_SET_DLOAD_MODE,
+			    &desc, &res);
+
+	return ret ? : res.a0;
+}
+
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr)
 {
 	struct qcom_scm_desc desc = {0};
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7a443e3afb6a..a1632002c67c 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -19,6 +19,7 @@
 #include <linux/cpumask.h>
 #include <linux/export.h>
 #include <linux/dma-mapping.h>
+#include <linux/module.h>
 #include <linux/types.h>
 #include <linux/qcom_scm.h>
 #include <linux/of.h>
@@ -28,6 +29,9 @@
 
 #include "qcom_scm.h"
 
+static bool download_mode;
+module_param(download_mode, bool, 0);
+
 #define SCM_HAS_CORE_CLK	BIT(0)
 #define SCM_HAS_IFACE_CLK	BIT(1)
 #define SCM_HAS_BUS_CLK		BIT(2)
@@ -38,6 +42,8 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct reset_controller_dev reset;
+
+	phys_addr_t dload_mode_addr;
 };
 
 static struct qcom_scm *__scm;
@@ -327,6 +333,27 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
 }
 EXPORT_SYMBOL(qcom_scm_io_writel);
 
+static void qcom_scm_set_download_mode(bool enable)
+{
+	bool avail;
+	int ret;
+
+	avail = __qcom_scm_is_call_available(__scm->dev,
+					     QCOM_SCM_SVC_BOOT,
+					     QCOM_SCM_SET_DLOAD_MODE);
+	if (avail) {
+		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
+		if (ret)
+			dev_err(__scm->dev, "SCM failed to set download mode: %d\n", ret);
+	} else if (__scm->dload_mode_addr) {
+		ret = __qcom_scm_io_writel(__scm->dev, enable ? QCOM_SCM_SET_DLOAD_MODE : 0, 0x7b3000);
+		if (ret)
+			dev_err(__scm->dev, "SCM failed to set download mode: %d\n", ret);
+	} else {
+		dev_err(__scm->dev, "No available mechanism for setting download mode\n");
+	}
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -347,6 +374,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_scm *scm;
 	unsigned long clks;
 	int ret;
+	u64 val;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -400,9 +428,22 @@ static int qcom_scm_probe(struct platform_device *pdev)
 
 	__qcom_scm_init();
 
+	ret = of_property_read_u64(pdev->dev.of_node, "qcom,dload-mode-addr", &val);
+	if (!ret)
+		scm->dload_mode_addr = val;
+
+	if (download_mode)
+		qcom_scm_set_download_mode(true);
+
 	return 0;
 }
 
+void qcom_scm_shutdown(struct platform_device *pdev)
+{
+	if (download_mode)
+		qcom_scm_set_download_mode(false);
+}
+
 static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm-apq8064",
 	  /* FIXME: This should have .data = (void *) SCM_HAS_CORE_CLK */
@@ -430,6 +471,7 @@ static struct platform_driver qcom_scm_driver = {
 		.of_match_table = qcom_scm_dt_match,
 	},
 	.probe = qcom_scm_probe,
+	.shutdown = qcom_scm_shutdown,
 };
 
 static int __init qcom_scm_init(void)
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 327d5e0a1ec3..1655810c1b2f 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -14,9 +14,11 @@
 
 #define QCOM_SCM_SVC_BOOT		0x1
 #define QCOM_SCM_BOOT_ADDR		0x1
+#define QCOM_SCM_SET_DLOAD_MODE		0x10
 #define QCOM_SCM_BOOT_ADDR_MC		0x11
 #define QCOM_SCM_SET_REMOTE_STATE	0xa
 extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
+extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
 
 #define QCOM_SCM_FLAG_HLOS		0x01
 #define QCOM_SCM_FLAG_COLDBOOT_MC	0x02
-- 
2.12.0

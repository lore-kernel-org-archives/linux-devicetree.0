From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] firmware: qcom: scm: Expose PAS command 10 as reset-controller
Date: Fri, 10 Jun 2016 21:52:20 -0700
Message-ID: <1465620740-24474-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PAS command 10 is used to assert and deassert the MSS reset via
TrustZone, expose this as a reset-controller to follow the non-secure
case where GCC exposes this control.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/firmware/qcom,scm.txt      |  6 ++++
 drivers/firmware/qcom_scm-32.c                     | 13 +++++++++
 drivers/firmware/qcom_scm-64.c                     | 17 +++++++++++
 drivers/firmware/qcom_scm.c                        | 34 ++++++++++++++++++++++
 drivers/firmware/qcom_scm.h                        |  2 ++
 5 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 3b4436e56865..f1ae9d3871f5 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -17,6 +17,11 @@ Required properties:
 - clock-names: Must contain "core" for the core clock, "iface" for the interface
   clock and "bus" for the bus clock per the requirements of the compatible.
 
+Optional properties:
+- #reset-cells: must be 1, if specified. Specifies that the scm implements a
+  reset controller exposing the modem subsystem reset as a single reset, at
+  index 0.
+
 Example for MSM8916:
 
 	firmware {
@@ -24,5 +29,6 @@ Example for MSM8916:
 			compatible = "qcom,scm";
 			clocks = <&gcc GCC_CRYPTO_CLK> , <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
 			clock-names = "core", "bus", "iface";
+			#reset-cells = <1>;
 		};
 	};
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 5e00aa400c4a..41d56013f6fc 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -513,3 +513,16 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 
 	return ret ? : le32_to_cpu(out);
 }
+
+int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
+{
+	__le32 out;
+	__le32 in = cpu_to_le32(reset);
+	int ret;
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
+			&in, sizeof(in),
+			&out, sizeof(out));
+
+	return ret ? : le32_to_cpu(out);
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 496badd49fe8..e720100f2cb1 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -342,3 +342,20 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 
 	return ret ? : scm_ret;
 }
+
+int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
+{
+	struct qcom_scm_desc desc = {0};
+	u32 scm_ret;
+	int ret;
+
+	desc.args[0] = reset;
+	desc.args[1] = 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
+			    &desc);
+	scm_ret = desc.res.a1;
+
+	return ret ? : scm_ret;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 79bb0b00577e..b0119535c0fb 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/clk.h>
+#include <linux/reset-controller.h>
 
 #include "qcom_scm.h"
 
@@ -29,6 +30,7 @@ struct qcom_scm {
 	struct clk *core_clk;
 	struct clk *iface_clk;
 	struct clk *bus_clk;
+	struct reset_controller_dev reset;
 };
 
 static struct qcom_scm *__scm;
@@ -283,6 +285,33 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long idx)
+{
+	struct qcom_scm *scm = container_of(rcdev, struct qcom_scm, reset);
+
+	if (idx != 0)
+		return -EINVAL;
+
+	return __qcom_scm_pas_mss_reset(scm->dev, 1);
+}
+
+static int qcom_scm_pas_reset_deassert(struct reset_controller_dev *rcdev,
+				       unsigned long idx)
+{
+	struct qcom_scm *scm = container_of(rcdev, struct qcom_scm, reset);
+
+	if (idx != 0)
+		return -EINVAL;
+
+	return __qcom_scm_pas_mss_reset(scm->dev, 0);
+}
+
+static struct reset_control_ops qcom_scm_pas_reset_ops = {
+	.assert = qcom_scm_pas_reset_assert,
+	.deassert = qcom_scm_pas_reset_deassert,
+};
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_scm *scm;
@@ -317,6 +346,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		}
 	}
 
+	scm->reset.ops = &qcom_scm_pas_reset_ops;
+	scm->reset.nr_resets = 1;
+	scm->reset.of_node = pdev->dev.of_node;
+	reset_controller_register(&scm->reset);
+
 	/* vote for max clk rate for highest performance */
 	ret = clk_set_rate(scm->core_clk, INT_MAX);
 	if (ret)
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 1a16ff925d6d..3584b00fe7e6 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -46,6 +46,7 @@ extern void __qcom_scm_init(void);
 #define QCOM_SCM_PAS_AUTH_AND_RESET_CMD	0x5
 #define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
 #define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
+#define QCOM_SCM_PAS_MSS_RESET		0xa
 extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 		dma_addr_t metadata_phys);
@@ -53,6 +54,7 @@ extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 		phys_addr_t addr, phys_addr_t size);
 extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
 extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
-- 
2.5.0

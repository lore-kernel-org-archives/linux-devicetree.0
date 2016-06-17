From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] firmware: qcom: scm: Expose PAS command 10 as reset-controller
Date: Fri, 17 Jun 2016 10:40:43 -0700
Message-ID: <1466185243-31569-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PAS command 10 is used to assert and deassert the MSS reset via
TrustZone, expose this as a reset-controller to mimic the direct
access case.

Cc: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Selecting RESET_CONTROLLER
- Constifying reset_ops

 drivers/firmware/Kconfig       |  1 +
 drivers/firmware/qcom_scm-32.c | 13 +++++++++++++
 drivers/firmware/qcom_scm-64.c | 14 ++++++++++++++
 drivers/firmware/qcom_scm.c    | 30 ++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  2 ++
 5 files changed, 60 insertions(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 6664f1108c7c..5e618058defe 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -184,6 +184,7 @@ config FW_CFG_SYSFS_CMDLINE
 config QCOM_SCM
 	bool
 	depends on ARM || ARM64
+	select RESET_CONTROLLER
 
 config QCOM_SCM_32
 	def_bool y
diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 3df3798729c3..cf731b3452f3 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -564,3 +564,16 @@ int __qcom_scm_pas_shutdown(u32 peripheral)
 
 	return ret ? : le32_to_cpu(out);
 }
+
+int __qcom_scm_pas_mss_reset(bool reset)
+{
+	__le32 out;
+	__le32 in = cpu_to_le32(reset);
+	int ret;
+
+	ret = qcom_scm_call(QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET,
+			&in, sizeof(in),
+			&out, sizeof(out));
+
+	return ret ? : le32_to_cpu(out);
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 72c2f81b8fd3..45ee872b6e6d 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -565,6 +565,20 @@ int __qcom_scm_pas_shutdown(u32 peripheral)
 	return ret ? : scm_ret;
 }
 
+int __qcom_scm_pas_mss_reset(bool reset)
+{
+	struct qcom_scm_desc desc = {0};
+	int ret;
+
+	desc.args[0] = reset;
+	desc.args[1] = 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(QCOM_SCM_SVC_PIL, QCOM_SCM_PAS_MSS_RESET, &desc);
+
+	return ret ? : desc.ret[0];
+}
+
 int __qcom_scm_pil_init_image_cmd(u32 proc, u64 image_addr)
 {
 	struct qcom_scm_desc desc = {0};
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 6fc9580a26bd..bfa9bfd9a62c 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -20,6 +20,7 @@
 #include <linux/qcom_scm.h>
 #include <linux/of.h>
 #include <linux/clk.h>
+#include <linux/reset-controller.h>
 
 #include "qcom_scm.h"
 
@@ -28,6 +29,7 @@ struct qcom_scm {
 	struct clk *core_clk;
 	struct clk *iface_clk;
 	struct clk *bus_clk;
+	struct reset_controller_dev reset;
 };
 
 static struct qcom_scm *__scm;
@@ -280,6 +282,29 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_shutdown);
 
+static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long idx)
+{
+	if (idx != 0)
+		return -EINVAL;
+
+	return __qcom_scm_pas_mss_reset(1);
+}
+
+static int qcom_scm_pas_reset_deassert(struct reset_controller_dev *rcdev,
+				       unsigned long idx)
+{
+	if (idx != 0)
+		return -EINVAL;
+
+	return __qcom_scm_pas_mss_reset(0);
+}
+
+static const struct reset_control_ops qcom_scm_pas_reset_ops = {
+	.assert = qcom_scm_pas_reset_assert,
+	.deassert = qcom_scm_pas_reset_deassert,
+};
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -322,6 +347,11 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return PTR_ERR(scm->bus_clk);
 	}
 
+	scm->reset.ops = &qcom_scm_pas_reset_ops;
+	scm->reset.nr_resets = 1;
+	scm->reset.of_node = pdev->dev.of_node;
+	reset_controller_register(&scm->reset);
+
 	/* vote for max clk rate for highest performance */
 	rate = clk_round_rate(scm->core_clk, INT_MAX);
 	ret = clk_set_rate(scm->core_clk, rate);
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 8f1207fca771..80752cbfd139 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -44,11 +44,13 @@ extern int __qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 #define QCOM_SCM_PAS_AUTH_AND_RESET_CMD	0x5
 #define QCOM_SCM_PAS_SHUTDOWN_CMD	0x6
 #define QCOM_SCM_PAS_IS_SUPPORTED_CMD	0x7
+#define QCOM_SCM_PAS_MSS_RESET		0xa
 extern bool __qcom_scm_pas_supported(u32 peripheral);
 extern int  __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t metadata_phys);
 extern int  __qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
 extern int  __qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int  __qcom_scm_pas_shutdown(u32 peripheral);
+extern int  __qcom_scm_pas_mss_reset(bool reset);
 
 /* common error codes */
 #define QCOM_SCM_ENOMEM		-5
-- 
2.5.0

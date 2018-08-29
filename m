From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/3] firmware: qcom: scm: Refactor clock handling
Date: Wed, 29 Aug 2018 16:15:04 -0700
Message-ID: <20180829231505.22660-3-bjorn.andersson@linaro.org>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

At one point in time all "future" platforms required three clocks, so
the binding and driver was written to treat this as the default case.
But new platforms has no clock requirements, which currently makes them
all a special case, causing the need for a patch in the binding and
driver for each new platform added.

This patch reworks the driver logic so that it will attempt to acquire
all three clocks and fail based on the given compatible. This allow us
to drop the clock requirement from "qcom,scm", in a way that will remain
backwards compatible with existing DT files.

Specific compatibles are added for apq8084, msm8916 and msm8974 to match
the updated binding and although equivalent to qcom,scm both ipq4019 and
msm8996 are kept as these have been used without fallback to qcom,scm.

The result of this patch is that new platforms, that require no clocks,
can be use the fallback compatible of "qcom,scm".

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/firmware/qcom_scm.c | 74 +++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index e778af766fae..af4eee86919d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -525,34 +525,44 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return ret;
 
 	clks = (unsigned long)of_device_get_match_data(&pdev->dev);
-	if (clks & SCM_HAS_CORE_CLK) {
-		scm->core_clk = devm_clk_get(&pdev->dev, "core");
-		if (IS_ERR(scm->core_clk)) {
-			if (PTR_ERR(scm->core_clk) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to acquire core clk\n");
+
+	scm->core_clk = devm_clk_get(&pdev->dev, "core");
+	if (IS_ERR(scm->core_clk)) {
+		if (PTR_ERR(scm->core_clk) == -EPROBE_DEFER)
+			return PTR_ERR(scm->core_clk);
+
+		if (clks & SCM_HAS_CORE_CLK) {
+			dev_err(&pdev->dev, "failed to acquire core clk\n");
 			return PTR_ERR(scm->core_clk);
 		}
+
+		scm->core_clk = NULL;
 	}
 
-	if (clks & SCM_HAS_IFACE_CLK) {
-		scm->iface_clk = devm_clk_get(&pdev->dev, "iface");
-		if (IS_ERR(scm->iface_clk)) {
-			if (PTR_ERR(scm->iface_clk) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to acquire iface clk\n");
+	scm->iface_clk = devm_clk_get(&pdev->dev, "iface");
+	if (IS_ERR(scm->iface_clk)) {
+		if (PTR_ERR(scm->iface_clk) == -EPROBE_DEFER)
+			return PTR_ERR(scm->iface_clk);
+
+		if (clks & SCM_HAS_IFACE_CLK) {
+			dev_err(&pdev->dev, "failed to acquire iface clk\n");
 			return PTR_ERR(scm->iface_clk);
 		}
+
+		scm->iface_clk = NULL;
 	}
 
-	if (clks & SCM_HAS_BUS_CLK) {
-		scm->bus_clk = devm_clk_get(&pdev->dev, "bus");
-		if (IS_ERR(scm->bus_clk)) {
-			if (PTR_ERR(scm->bus_clk) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to acquire bus clk\n");
+	scm->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	if (IS_ERR(scm->bus_clk)) {
+		if (PTR_ERR(scm->bus_clk) == -EPROBE_DEFER)
+			return PTR_ERR(scm->bus_clk);
+
+		if (clks & SCM_HAS_BUS_CLK) {
+			dev_err(&pdev->dev, "failed to acquire bus clk\n");
 			return PTR_ERR(scm->bus_clk);
 		}
+
+		scm->bus_clk = NULL;
 	}
 
 	scm->reset.ops = &qcom_scm_pas_reset_ops;
@@ -594,23 +604,23 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 	{ .compatible = "qcom,scm-apq8064",
 	  /* FIXME: This should have .data = (void *) SCM_HAS_CORE_CLK */
 	},
-	{ .compatible = "qcom,scm-msm8660",
-	  .data = (void *) SCM_HAS_CORE_CLK,
-	},
-	{ .compatible = "qcom,scm-msm8960",
-	  .data = (void *) SCM_HAS_CORE_CLK,
-	},
-	{ .compatible = "qcom,scm-msm8996",
-	  .data = NULL, /* no clocks */
+	{ .compatible = "qcom,scm-apq8084", .data = (void *)(SCM_HAS_CORE_CLK |
+							     SCM_HAS_IFACE_CLK |
+							     SCM_HAS_BUS_CLK)
 	},
-	{ .compatible = "qcom,scm-ipq4019",
-	  .data = NULL, /* no clocks */
+	{ .compatible = "qcom,scm-ipq4019" },
+	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
+	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
+	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
+							     SCM_HAS_IFACE_CLK |
+							     SCM_HAS_BUS_CLK)
 	},
-	{ .compatible = "qcom,scm",
-	  .data = (void *)(SCM_HAS_CORE_CLK
-			   | SCM_HAS_IFACE_CLK
-			   | SCM_HAS_BUS_CLK),
+	{ .compatible = "qcom,scm-msm8974", .data = (void *)(SCM_HAS_CORE_CLK |
+							     SCM_HAS_IFACE_CLK |
+							     SCM_HAS_BUS_CLK)
 	},
+	{ .compatible = "qcom,scm-msm8996" },
+	{ .compatible = "qcom,scm" },
 	{}
 };
 
-- 
2.18.0

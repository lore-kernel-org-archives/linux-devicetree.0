From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v7 09/10] soc: qcom: rpmpd: Use simple_opp_to_performance_state() helper
Date: Wed, 12 Dec 2018 14:51:30 +0530
Message-ID: <20181212092131.13046-10-rnayak@codeaurora.org>
References: <20181212092131.13046-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212092131.13046-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Get rid of the duplicate code across rpmpd and rpmhpd to read the
performance state value from Device tree and use the
simple_opp_to_performance_state() helper instead.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmhpd.c | 11 +----------
 drivers/soc/qcom/rpmpd.c  | 11 +----------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index e37976e87370..f7fbe57f31ae 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -276,16 +276,7 @@ static int rpmhpd_set_performance_state(struct generic_pm_domain *domain,
 static unsigned int rpmhpd_get_performance_state(struct generic_pm_domain *genpd,
 						 struct dev_pm_opp *opp)
 {
-	struct device_node *np;
-	unsigned int level = 0;
-
-	np = dev_pm_opp_get_of_node(opp);
-	if (of_property_read_u32(np, "qcom,level", &level))
-		pr_err("%s: missing 'qcom,level' property\n", __func__);
-
-	of_node_put(np);
-
-	return level;
+	return simple_opp_to_performance_state(genpd, opp, "qcom,level");
 }
 
 static int rpmhpd_update_level_mapping(struct rpmhpd *rpmhpd)
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 59e21c88a144..29288af502b0 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -248,16 +248,7 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 static unsigned int rpmpd_get_performance(struct generic_pm_domain *genpd,
 					  struct dev_pm_opp *opp)
 {
-	struct device_node *np;
-	unsigned int corner = 0;
-
-	np = dev_pm_opp_get_of_node(opp);
-	if (of_property_read_u32(np, "qcom,level", &corner))
-		pr_err("%s: missing 'qcom,level' property\n", __func__);
-
-	of_node_put(np);
-
-	return corner;
+	return simple_opp_to_performance_state(genpd, opp, "qcom,level");
 }
 
 static int rpmpd_probe(struct platform_device *pdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

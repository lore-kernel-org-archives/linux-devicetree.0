From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v5 4/8] soc: qcom: rpmpd: Add support for get/set performance state
Date: Tue,  4 Dec 2018 10:51:15 +0530
Message-ID: <20181204052119.806-5-rnayak@codeaurora.org>
References: <20181204052119.806-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204052119.806-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support for the .set_performace_state() and .opp_to_performance_state()
callbacks in the rpmpd driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/soc/qcom/rpmpd.c | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index a0b9f122d793..eb1cfa6a03d6 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/soc/qcom/smd-rpm.h>
 
 #include <dt-bindings/mfd/qcom-rpm.h>
@@ -28,6 +29,8 @@
 #define KEY_ENABLE		0x6e657773 /* swen */
 #define KEY_FLOOR_CORNER	0x636676   /* vfc */
 
+#define MAX_RPMPD_STATE		6
+
 #define DEFINE_RPMPD_CORN_SMPA(_platform, _name, _active, r_id)		\
 	static struct rpmpd _platform##_##_active;			\
 	static struct rpmpd _platform##_##_name = {			\
@@ -221,6 +224,47 @@ static int rpmpd_power_off(struct generic_pm_domain *domain)
 	return ret;
 }
 
+static int rpmpd_set_performance(struct generic_pm_domain *domain,
+				 unsigned int state)
+{
+	int ret = 0;
+	struct rpmpd *pd = domain_to_rpmpd(domain);
+
+	mutex_lock(&rpmpd_lock);
+
+	if (state > MAX_RPMPD_STATE)
+		goto out;
+
+	pd->corner = state;
+
+	if (!pd->enabled && (pd->key != KEY_FLOOR_CORNER))
+		goto out;
+
+	ret = rpmpd_aggregate_corner(pd);
+
+out:
+	mutex_unlock(&rpmpd_lock);
+
+	return ret;
+}
+
+static unsigned int rpmpd_get_performance(struct generic_pm_domain *genpd,
+					  struct dev_pm_opp *opp)
+{
+	struct device_node *np;
+	unsigned int corner = 0;
+
+	np = dev_pm_opp_get_of_node(opp);
+	if (of_property_read_u32(np, "qcom,level", &corner)) {
+		pr_err("%s: missing 'qcom,level' property\n", __func__);
+		return 0;
+	}
+
+	of_node_put(np);
+
+	return corner;
+}
+
 static int rpmpd_probe(struct platform_device *pdev)
 {
 	int i;
@@ -261,6 +305,8 @@ static int rpmpd_probe(struct platform_device *pdev)
 		rpmpds[i]->rpm = rpm;
 		rpmpds[i]->pd.power_off = rpmpd_power_off;
 		rpmpds[i]->pd.power_on = rpmpd_power_on;
+		rpmpds[i]->pd.set_performance_state = rpmpd_set_performance;
+		rpmpds[i]->pd.opp_to_performance_state = rpmpd_get_performance;
 		pm_genpd_init(&rpmpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmpds[i]->pd;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

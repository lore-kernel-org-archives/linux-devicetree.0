From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/7] PM / OPP: Add dev_pm_opp_get_of_node()
Date: Fri, 16 Mar 2018 09:38:18 +0530
Message-ID: <20180316040824.21472-2-rnayak@codeaurora.org>
References: <20180316040824.21472-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316040824.21472-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

From: Viresh Kumar <viresh.kumar@linaro.org>

This adds a new helper to let the power domain drivers to access
opp->np, so that they can read platform specific properties from the
node.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/opp/of.c       | 19 +++++++++++++++++++
 include/linux/pm_opp.h |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 21265af55117..b17715bc3c0a 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -736,3 +736,22 @@ struct dev_pm_opp *of_dev_pm_opp_find_required_opp(struct device *dev,
 	return opp;
 }
 EXPORT_SYMBOL_GPL(of_dev_pm_opp_find_required_opp);
+
+/**
+ * dev_pm_opp_get_of_node() - Gets the DT node corresponding to an opp
+ * @opp:	opp for which DT node has to be returned for
+ *
+ * Return: DT node corresponding to the opp, else 0 on success.
+ *
+ * The caller needs to put the node of_node_put() after using it.
+ */
+struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp)
+{
+	if (IS_ERR_OR_NULL(opp)) {
+		pr_err("%s: Invalid parameters\n", __func__);
+		return NULL;
+	}
+
+	return of_node_get(opp->np);
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_get_of_node);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 528a7d9cf2ef..099b31960dec 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -300,6 +300,7 @@ void dev_pm_opp_of_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
 struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev);
 struct dev_pm_opp *of_dev_pm_opp_find_required_opp(struct device *dev, struct device_node *np);
+struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp);
 #else
 static inline int dev_pm_opp_of_add_table(struct device *dev)
 {
@@ -338,6 +339,10 @@ static inline struct dev_pm_opp *of_dev_pm_opp_find_required_opp(struct device *
 {
 	return NULL;
 }
+static inline struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp)
+{
+	return NULL;
+}
 #endif
 
 #endif		/* __LINUX_OPP_H__ */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

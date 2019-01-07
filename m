From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v9 08/10] OPP: Add a dev_pm_opp_of_get_level() helper
Date: Mon,  7 Jan 2019 15:39:57 +0530
Message-ID: <20190107100959.14528-9-rnayak@codeaurora.org>
References: <20190107100959.14528-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107100959.14528-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Now that we have atleast 2 genpd providers, both using a simple
routine to read a performance state (opp-level) value from device
tree, in order to implement the .opp_to_performance_state
callback, add a dev_pm_opp_of_get_level() helper to do
it, so it can be resued across all such genpd providers which
just need to read the value from DT.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/opp/of.c       | 23 +++++++++++++++++++++++
 include/linux/pm_opp.h |  5 +++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 06f0f632ec47..6fb383fee601 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1029,6 +1029,29 @@ int of_get_required_opp_performance_state(struct device_node *np, int index)
 }
 EXPORT_SYMBOL_GPL(of_get_required_opp_performance_state);
 
+/**
+ * dev_pm_opp_of_get_level() - Reads the opp-level value from Device Tree
+ * @opp: opp for which 'opp-level' should be read and returned
+ *
+ * Returns the opp-level value read from Device Tree, if present, else 0
+ *
+ * Return: Zero or positive opp-level value read from Device tree
+ */
+unsigned int dev_pm_opp_of_get_level(struct dev_pm_opp *opp)
+{
+	struct device_node *np;
+	unsigned int perf_state = 0;
+
+	np = dev_pm_opp_get_of_node(opp);
+	if (of_property_read_u32(np, "opp-level", &perf_state))
+		pr_err("%s: missing 'opp-level' property\n", __func__);
+
+	of_node_put(np);
+
+	return perf_state;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_of_get_level);
+
 /**
  * dev_pm_opp_get_of_node() - Gets the DT node corresponding to an opp
  * @opp:	opp for which DT node has to be returned for
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 0a2a88e5a383..bf7d21b23a5e 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -322,6 +322,7 @@ int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpuma
 struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev);
 struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp);
 int of_get_required_opp_performance_state(struct device_node *np, int index);
+unsigned int dev_pm_opp_of_get_level(struct dev_pm_opp *opp);
 #else
 static inline int dev_pm_opp_of_add_table(struct device *dev)
 {
@@ -364,6 +365,10 @@ static inline int of_get_required_opp_performance_state(struct device_node *np,
 {
 	return -ENOTSUPP;
 }
+static inline int dev_pm_opp_of_get_level(struct dev_pm_opp *opp)
+{
+	return 0;
+}
 #endif
 
 #endif		/* __LINUX_OPP_H__ */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

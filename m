From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 4/9] OPP: Add API to find an OPP table from its DT node
Date: Fri,  7 Jun 2019 21:43:34 -0700
Message-ID: <20190608044339.115026-5-saravanak@google.com>
References: <20190608044339.115026-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608044339.115026-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This allows finding a device's OPP table (when it has multiple) from a
phandle to the OPP table in DT.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/opp/of.c       | 42 ++++++++++++++++++++++++++++++++++--------
 include/linux/pm_opp.h |  7 +++++++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 54fa70ed2adc..34c51905f56d 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -42,14 +42,9 @@ struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_get_opp_desc_node);
 
-struct opp_table *_managed_opp(struct device *dev, int index)
+struct opp_table *_find_opp_table_from_node(struct device_node *np)
 {
 	struct opp_table *opp_table, *managed_table = NULL;
-	struct device_node *np;
-
-	np = _opp_of_get_opp_desc_node(dev->of_node, index);
-	if (!np)
-		return NULL;
 
 	list_for_each_entry(opp_table, &opp_tables, node) {
 		if (opp_table->np == np) {
@@ -69,11 +64,42 @@ struct opp_table *_managed_opp(struct device *dev, int index)
 		}
 	}
 
-	of_node_put(np);
-
 	return managed_table;
 }
 
+/**
+ * dev_pm_opp_of_find_table_from_node() - Find OPP table from its DT node
+ * @np: DT node used for finding the OPP table
+ *
+ * Return: OPP table corresponding to the DT node, else NULL on failure.
+ *
+ * The caller needs to put the node with of_node_put() after using it.
+ */
+struct opp_table *dev_pm_opp_of_find_table_from_node(struct device_node *np)
+{
+	struct opp_table *opp_table;
+
+	mutex_lock(&opp_table_lock);
+	opp_table = _find_opp_table_from_node(np);
+	mutex_unlock(&opp_table_lock);
+	return opp_table;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_of_find_table_from_node);
+
+struct opp_table *_managed_opp(struct device *dev, int index)
+{
+	struct device_node *np;
+	struct opp_table *opp_table;
+
+	np = _opp_of_get_opp_desc_node(dev->of_node, index);
+	if (!np)
+		return NULL;
+
+	opp_table = _find_opp_table_from_node(np);
+	of_node_put(np);
+	return opp_table;
+}
+
 /* The caller must call dev_pm_opp_put() after the OPP is used */
 static struct dev_pm_opp *_find_opp_of_np(struct opp_table *opp_table,
 					  struct device_node *opp_np)
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 7f040cc20daf..3f30ce55e8eb 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -359,6 +359,7 @@ int dev_pm_opp_of_cpumask_add_table(const struct cpumask *cpumask);
 void dev_pm_opp_of_cpumask_remove_table(const struct cpumask *cpumask);
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
 struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev);
+struct opp_table *dev_pm_opp_of_find_table_from_node(struct device_node *np);
 struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp);
 int of_get_required_opp_performance_state(struct device_node *np, int index);
 void dev_pm_opp_of_register_em(struct cpumask *cpus);
@@ -396,6 +397,12 @@ static inline struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device
 	return NULL;
 }
 
+static inline struct opp_table *dev_pm_opp_of_find_table_from_node(
+							struct device_node *np)
+{
+	return NULL;
+}
+
 static inline struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp)
 {
 	return NULL;
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

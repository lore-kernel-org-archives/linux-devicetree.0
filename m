From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 1/2] regulator: Add generic DT parsing for regulators
Date: Thu, 26 Apr 2012 16:52:20 +0200
Message-ID: <1335451941-26333-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Looking up init data for regulators found on chips is a common operation
that can be handled in a generic way. The new helper function introduced
by this patch looks up the children of a given node by names specified
in a match table and fills that match table with information parsed from
the DT.

This is based on work by Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/regulator/of_regulator.c       |   47 ++++++++++++++++++++++++++++++++
 include/linux/regulator/of_regulator.h |   18 ++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 679734d..56593b7 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
 
 static void of_get_regulation_constraints(struct device_node *np,
 					struct regulator_init_data **init_data)
@@ -85,3 +86,49 @@ struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
 	return init_data;
 }
 EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
+
+/**
+ * of_regulator_match - extract regulator init data
+ * @dev: device requesting the data
+ * @node: parent device node of the regulators
+ * @matches: match table for the regulators
+ * @num_matches: number of entries in match table
+ *
+ * This function uses a match table specified by the regulator driver and
+ * looks up the corresponding init data in the device tree. Note that the
+ * match table is modified in place.
+ *
+ * Returns the number of matches found or a negative error code on failure.
+ */
+int of_regulator_match(struct device *dev, struct device_node *node,
+		       struct of_regulator_match *matches,
+		       unsigned int num_matches)
+{
+	unsigned int count = 0;
+	unsigned int i;
+
+	if (!dev || !node)
+		return -EINVAL;
+
+	for (i = 0; i < num_matches; i++) {
+		struct of_regulator_match *match = &matches[i];
+		struct device_node *child;
+
+		child = of_find_node_by_name(node, match->name);
+		if (!child)
+			continue;
+
+		match->init_data = of_get_regulator_init_data(dev, child);
+		if (!match->init_data) {
+			dev_err(dev, "failed to parse DT for regulator %s\n",
+				child->name);
+			return -EINVAL;
+		}
+
+		match->of_node = child;
+		count++;
+	}
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_regulator_match);
diff --git a/include/linux/regulator/of_regulator.h b/include/linux/regulator/of_regulator.h
index 769704f..f921796 100644
--- a/include/linux/regulator/of_regulator.h
+++ b/include/linux/regulator/of_regulator.h
@@ -6,10 +6,20 @@
 #ifndef __LINUX_OF_REG_H
 #define __LINUX_OF_REG_H
 
+struct of_regulator_match {
+	const char *name;
+	void *driver_data;
+	struct regulator_init_data *init_data;
+	struct device_node *of_node;
+};
+
 #if defined(CONFIG_OF)
 extern struct regulator_init_data
 	*of_get_regulator_init_data(struct device *dev,
 				    struct device_node *node);
+extern int of_regulator_match(struct device *dev, struct device_node *node,
+			      struct of_regulator_match *matches,
+			      unsigned int num_matches);
 #else
 static inline struct regulator_init_data
 	*of_get_regulator_init_data(struct device *dev,
@@ -17,6 +27,14 @@ static inline struct regulator_init_data
 {
 	return NULL;
 }
+
+static inline int of_regulator_match(struct device *dev,
+				     struct device_node *node,
+				     struct of_regulator_match *matches,
+				     unsigned int num_matches)
+{
+	return 0;
+}
 #endif /* CONFIG_OF */
 
 #endif /* __LINUX_OF_REG_H */
-- 
1.7.10

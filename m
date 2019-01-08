From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 2/3] clk: keystone: sci-clk: add support from parsing clock
 info from DT
Date: Tue, 8 Jan 2019 15:30:22 +0200
Message-ID: <1546954223-9738-3-git-send-email-t-kristo@ti.com>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Currently the sci-clk driver queries clock data from the firmware, which
can be pretty slow operation in certain cases. Add an option for the
driver to probe the available clocks from DT also, in this case the
number of clocks probed from firmware gets cut down drastically. To
enable the feature, a new flag ti,scan-clocks-from-dt can be added
under the clock provider node.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Andreas Dannenberg <dannenberg@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 188 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 159 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 4cb70be..d1d6dc8 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/bsearch.h>
+#include <linux/list_sort.h>
 
 #define SCI_CLK_SSC_ENABLE		BIT(0)
 #define SCI_CLK_ALLOW_FREQ_CHANGE	BIT(1)
@@ -52,6 +53,7 @@ struct sci_clk_provider {
  * @num_parents: Number of parents for this clock
  * @provider:	 Master clock provider
  * @flags:	 Flags for the clock
+ * @node:	 Link for handling clocks probed via DT
  */
 struct sci_clk {
 	struct clk_hw hw;
@@ -60,6 +62,7 @@ struct sci_clk {
 	u8 num_parents;
 	struct sci_clk_provider *provider;
 	u8 flags;
+	struct list_head node;
 };
 
 #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
@@ -353,6 +356,15 @@ static int _cmp_sci_clk(const void *a, const void *b)
 	return -1;
 }
 
+static int _cmp_sci_clk_list(void *priv, struct list_head *a,
+			     struct list_head *b)
+{
+	struct sci_clk *ca = container_of(a, struct sci_clk, node);
+	struct sci_clk *cb = container_of(b, struct sci_clk, node);
+
+	return _cmp_sci_clk(ca, &cb);
+}
+
 /**
  * sci_clk_get - Xlate function for getting clock handles
  * @clkspec: device tree clock specifier
@@ -404,22 +416,8 @@ static int ti_sci_init_clocks(struct sci_clk_provider *p)
 };
 MODULE_DEVICE_TABLE(of, ti_sci_clk_of_match);
 
-/**
- * ti_sci_clk_probe - Probe function for the TI SCI clock driver
- * @pdev: platform device pointer to be probed
- *
- * Probes the TI SCI clock device. Allocates a new clock provider
- * and registers this to the common clock framework. Also applies
- * any required flags to the identified clocks via clock lists
- * supplied from DT. Returns 0 for success, negative error value
- * for failure.
- */
-static int ti_sci_clk_probe(struct platform_device *pdev)
+static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct sci_clk_provider *provider;
-	const struct ti_sci_handle *handle;
 	int ret;
 	int num_clks = 0;
 	struct sci_clk **clks = NULL;
@@ -430,18 +428,7 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 	int dev_id = 0;
 	u8 num_parents;
 	int gap_size = 0;
-
-	handle = devm_ti_sci_get_handle(dev);
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
-	if (!provider)
-		return -ENOMEM;
-
-	provider->sci = handle;
-	provider->ops = &handle->ops.clk_ops;
-	provider->dev = dev;
+	struct device *dev = provider->dev;
 
 	while (1) {
 		ret = provider->ops->get_num_parents(provider->sci, dev_id,
@@ -502,13 +489,156 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 
 	devm_kfree(dev, clks);
 
+	return 0;
+}
+
+static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+{
+	struct device *dev = provider->dev;
+	struct device_node *np = NULL;
+	int ret;
+	int index;
+	struct of_phandle_args args;
+	struct list_head clks;
+	struct sci_clk *sci_clk, *prev;
+	int num_clks = 0;
+	int num_parents;
+	int clk_id;
+
+	INIT_LIST_HEAD(&clks);
+
+	while (1) {
+		np = of_find_node_with_property(np, "clocks");
+		if (!np)
+			break;
+
+		index = 0;
+
+		do {
+			ret = of_parse_phandle_with_args(np, "clocks",
+							 "#clock-cells", index,
+							 &args);
+			if (ret)
+				break;
+
+			if (args.args_count == 2 && args.np == dev->of_node) {
+				sci_clk = devm_kzalloc(dev, sizeof(*sci_clk),
+						       GFP_KERNEL);
+				if (!sci_clk)
+					return -ENOMEM;
+
+				sci_clk->dev_id = args.args[0];
+				sci_clk->clk_id = args.args[1];
+				sci_clk->provider = provider;
+				provider->ops->
+					get_num_parents(provider->sci,
+							sci_clk->dev_id,
+							sci_clk->clk_id,
+							&sci_clk->num_parents);
+				list_add_tail(&sci_clk->node, &clks);
+
+				num_clks++;
+
+				num_parents = sci_clk->num_parents;
+				if (num_parents == 1)
+					num_parents = 0;
+
+				clk_id = args.args[1] + 1;
+
+				while (num_parents--) {
+					sci_clk = devm_kzalloc(dev,
+							       sizeof(*sci_clk),
+							       GFP_KERNEL);
+					if (!sci_clk)
+						return -ENOMEM;
+					sci_clk->dev_id = args.args[0];
+					sci_clk->clk_id = clk_id++;
+					sci_clk->provider = provider;
+					list_add_tail(&sci_clk->node, &clks);
+
+					num_clks++;
+				}
+			}
+
+			index++;
+		} while (args.np);
+	}
+
+	list_sort(NULL, &clks, _cmp_sci_clk_list);
+
+	provider->clocks = devm_kmalloc_array(dev, num_clks, sizeof(sci_clk),
+					      GFP_KERNEL);
+	if (!provider->clocks)
+		return -ENOMEM;
+
+	num_clks = 0;
+	prev = NULL;
+
+	list_for_each_entry(sci_clk, &clks, node) {
+		if (prev && prev->dev_id == sci_clk->dev_id &&
+		    prev->clk_id == sci_clk->clk_id)
+			continue;
+
+		provider->clocks[num_clks++] = sci_clk;
+		prev = sci_clk;
+	}
+
+	provider->num_clocks = num_clks;
+
+	return 0;
+}
+
+/**
+ * ti_sci_clk_probe - Probe function for the TI SCI clock driver
+ * @pdev: platform device pointer to be probed
+ *
+ * Probes the TI SCI clock device. Allocates a new clock provider
+ * and registers this to the common clock framework. Also applies
+ * any required flags to the identified clocks via clock lists
+ * supplied from DT. Returns 0 for success, negative error value
+ * for failure.
+ */
+static int ti_sci_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct sci_clk_provider *provider;
+	const struct ti_sci_handle *handle;
+	int ret;
+
+	handle = devm_ti_sci_get_handle(dev);
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->sci = handle;
+	provider->ops = &handle->ops.clk_ops;
+	provider->dev = dev;
+
+	if (of_property_read_bool(np, "ti,scan-clocks-from-dt")) {
+		ret = ti_sci_scan_clocks_from_dt(provider);
+		if (ret) {
+			dev_err(dev, "scan clocks from DT failed: %d\n", ret);
+			return ret;
+		}
+	} else {
+		ret = ti_sci_scan_clocks_from_fw(provider);
+		if (ret) {
+			dev_err(dev, "scan clocks from FW failed: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = ti_sci_init_clocks(provider);
 	if (ret) {
-		pr_err("ti-sci-init-clocks failed.\n");
+		dev_err(dev, "init-clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	return of_clk_add_hw_provider(np, sci_clk_get, provider);
+	return of_clk_add_hw_provider(dev->of_node, sci_clk_get, provider);
 }
 
 /**
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

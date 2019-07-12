From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 10/11] of/platform: Add functional dependency link from DT
 regulator bindings
Date: Fri, 12 Jul 2019 16:52:43 -0700
Message-ID: <20190712235245.202558-11-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Similar to creating functional dependency links from clock and
interconnect DT bindings, also create functional dependency links from
regulator DT bindings.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 83 ++++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 6523d07ef2d7..9f3b7e1801bc 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,46 +525,50 @@ bool of_link_is_valid(struct device_node *con, struct device_node *sup)
 	return true;
 }
 
-static int of_link_binding(struct device *dev, struct device_node *con_np,
-			   const char *binding, const char *cell)
+static int of_link_to_phandle(struct device *dev, struct device_node *sup_np)
 {
-	struct of_phandle_args sup_args;
-	struct device_node *sup_np;
 	struct platform_device *sup_dev;
-	unsigned int i = 0, links = 0;
 	u32 dl_flags = DL_FLAG_AUTOPROBE_CONSUMER;
+	int ret = 0;
 
-	while (!of_parse_phandle_with_args(con_np, binding, cell, i,
-					   &sup_args)) {
-		sup_np = sup_args.np;
-		/*
-		 * Since we are trying to create device links, we need to find
-		 * the actual device node that owns this supplier phandle.
-		 * Often times it's the same node, but sometimes it can be one
-		 * of the parents. So walk up the parent till you find a
-		 * device.
-		 */
-		while (sup_np && !of_find_property(sup_np, "compatible", NULL))
-			sup_np = of_get_next_parent(sup_np);
-		if (!sup_np)
-			continue;
+	/*
+	 * Since we are trying to create device links, we need to find
+	 * the actual device node that owns this supplier phandle.
+	 * Often times it's the same node, but sometimes it can be one
+	 * of the parents. So walk up the parent till you find a
+	 * device.
+	 */
+	while (sup_np && !of_find_property(sup_np, "compatible", NULL))
+		sup_np = of_get_next_parent(sup_np);
+	if (!sup_np)
+		return 0;
 
-		if (!of_link_is_valid(dev->of_node, sup_np)) {
-			of_node_put(sup_np);
-			continue;
-		}
-		i++;
-		sup_dev = of_find_device_by_node(sup_np);
+	if (!of_link_is_valid(dev->of_node, sup_np)) {
 		of_node_put(sup_np);
-		if (!sup_dev)
-			continue;
-		if (device_link_add(dev, &sup_dev->dev, dl_flags))
-			links++;
-		put_device(&sup_dev->dev);
+		return 0;
 	}
-	if (links < i)
+	sup_dev = of_find_device_by_node(sup_np);
+	of_node_put(sup_np);
+	if (!sup_dev)
 		return -ENODEV;
-	return 0;
+	if (!device_link_add(dev, &sup_dev->dev, dl_flags))
+		ret = -ENODEV;
+	put_device(&sup_dev->dev);
+	return ret;
+}
+
+static int of_link_binding(struct device *dev, struct device_node *con_np,
+			   const char *binding, const char *cell)
+{
+	struct of_phandle_args sup_args;
+	unsigned int i = 0;
+	bool done = true;
+
+	while (!of_parse_phandle_with_args(con_np, binding, cell, i++,
+					   &sup_args))
+		if (of_link_to_phandle(dev, sup_args.np))
+			done = false;
+	return done ? 0 : -ENODEV;
 }
 
 static bool of_devlink;
@@ -579,18 +583,33 @@ static const char * const link_bindings[] = {
 	"interconnects", "#interconnect-cells",
 };
 
+#define REG_SUFFIX	"-supply"
 static int __of_link_to_suppliers(struct device *dev,
 				  struct device_node *con_np)
 {
 	unsigned int i = 0;
 	bool done = true;
 	struct device_node *child;
+	struct property *p;
+	unsigned int len, reg_len;
 
 	for (i = 0; i < ARRAY_SIZE(link_bindings) / 2; i++)
 		if (of_link_binding(dev, con_np, link_bindings[i * 2],
 					link_bindings[i * 2 + 1]))
 			done = false;
 
+	reg_len = strlen(REG_SUFFIX);
+	for_each_property_of_node(con_np, p) {
+		len = strlen(p->name);
+		if (len <= reg_len)
+			continue;
+		if (strcmp(p->name + len - reg_len, REG_SUFFIX))
+			continue;
+		if (of_link_to_phandle(dev,
+				of_parse_phandle(con_np, p->name, 0)))
+			done = false;
+	}
+
 	for_each_child_of_node(con_np, child)
 		if (__of_link_to_suppliers(dev, child))
 			done = false;
-- 
2.22.0.510.g264f2c817a-goog

From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 08/11] of/platform: Make sure supplier DT node is device
 when creating device links
Date: Fri, 12 Jul 2019 16:52:41 -0700
Message-ID: <20190712235245.202558-9-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

While most phandle references in common bindings point to the supplier
device node, there are also common bindings where the phandle can
pointing to a child node of the supplier device node.

Therefore, when trying to find the supplier device that corresponds to a
supplier phandle, we need to make sure we are using the supplier's
device node. Otherwise, we'll never find the supplier device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 98414ba53b1f..cf8625abe30c 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -529,19 +529,33 @@ static int of_link_binding(struct device *dev,
 			   const char *binding, const char *cell)
 {
 	struct of_phandle_args sup_args;
+	struct device_node *sup_np;
 	struct platform_device *sup_dev;
 	unsigned int i = 0, links = 0;
 	u32 dl_flags = DL_FLAG_AUTOPROBE_CONSUMER;
 
 	while (!of_parse_phandle_with_args(dev->of_node, binding, cell, i,
 					   &sup_args)) {
-		if (!of_link_is_valid(dev->of_node, sup_args.np)) {
-			of_node_put(sup_args.np);
+		sup_np = sup_args.np;
+		/*
+		 * Since we are trying to create device links, we need to find
+		 * the actual device node that owns this supplier phandle.
+		 * Often times it's the same node, but sometimes it can be one
+		 * of the parents. So walk up the parent till you find a
+		 * device.
+		 */
+		while (sup_np && !of_find_property(sup_np, "compatible", NULL))
+			sup_np = of_get_next_parent(sup_np);
+		if (!sup_np)
+			continue;
+
+		if (!of_link_is_valid(dev->of_node, sup_np)) {
+			of_node_put(sup_np);
 			continue;
 		}
 		i++;
-		sup_dev = of_find_device_by_node(sup_args.np);
-		of_node_put(sup_args.np);
+		sup_dev = of_find_device_by_node(sup_np);
+		of_node_put(sup_np);
 		if (!sup_dev)
 			continue;
 		if (device_link_add(dev, &sup_dev->dev, dl_flags))
-- 
2.22.0.510.g264f2c817a-goog

From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 09/11] of/platform: Create device links for all
 child-supplier depencencies
Date: Fri, 12 Jul 2019 16:52:42 -0700
Message-ID: <20190712235245.202558-10-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

A parent device can have child devices that it adds when it probes. But
this probing of the parent device can happen way after kernel init is done
-- for example, when the parent device's driver is loaded as a module.

In such cases, if the child devices depend on a supplier in the system, we
need to make sure the supplier gets the sync_state() callback only after
these child devices are added and probed.

To achieve this, when creating device links for a device by looking at its
DT node, don't just look at DT references at the top node level. Look at DT
references in all the descendant nodes too and create device links from the
ancestor device to all these supplier devices.

This way, when the parent device probes and adds child devices, the child
devices can then create their own device links to the suppliers and further
delay the supplier's sync_state() callback to after the child devices are
probed.

Example:
In this illustration, -> denotes DT references and indentation
represents child status.

Device node A
	Device node B -> D
	Device node C -> B, D

Device node D

Assume all these devices have their drivers loaded as modules.

Without this patch, this is the sequence of events:
1. D is added.
2. A is added.
3. Device D probes.
4. Device D gets its sync_state() callback.
5. Device B and C might malfunction because their resources got
   altered/turned off before they can make active requests for them.

With this patch, this is the sequence of events:
1. D is added.
2. A is added and creates device links to D.
3. Device link from A to B is not added because A is a parent of B.
4. Device D probes.
5. Device D does not get it's sync_state() callback because consumer A
   hasn't probed yet.
5. Device A probes.
5. a. Devices B and C are added.
5. b. Device links from B and C to D are added.
5. c. Device A's probe completes.
6. Device D does not get it's sync_state() callback because consumer A
   has probed but consumers B and C haven't probed yet.
7. Device B and C probe.
8. Device D gets it's sync_state() callback because all its consumers
   have probed.
9. None of the devices malfunction.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index cf8625abe30c..6523d07ef2d7 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -525,7 +525,7 @@ bool of_link_is_valid(struct device_node *con, struct device_node *sup)
 	return true;
 }
 
-static int of_link_binding(struct device *dev,
+static int of_link_binding(struct device *dev, struct device_node *con_np,
 			   const char *binding, const char *cell)
 {
 	struct of_phandle_args sup_args;
@@ -534,7 +534,7 @@ static int of_link_binding(struct device *dev,
 	unsigned int i = 0, links = 0;
 	u32 dl_flags = DL_FLAG_AUTOPROBE_CONSUMER;
 
-	while (!of_parse_phandle_with_args(dev->of_node, binding, cell, i,
+	while (!of_parse_phandle_with_args(con_np, binding, cell, i,
 					   &sup_args)) {
 		sup_np = sup_args.np;
 		/*
@@ -579,26 +579,37 @@ static const char * const link_bindings[] = {
 	"interconnects", "#interconnect-cells",
 };
 
-static int of_link_to_suppliers(struct device *dev)
+static int __of_link_to_suppliers(struct device *dev,
+				  struct device_node *con_np)
 {
 	unsigned int i = 0;
 	bool done = true;
-
-	if (!of_devlink)
-		return 0;
-	if (unlikely(!dev->of_node))
-		return 0;
+	struct device_node *child;
 
 	for (i = 0; i < ARRAY_SIZE(link_bindings) / 2; i++)
-		if (of_link_binding(dev, link_bindings[i * 2],
+		if (of_link_binding(dev, con_np, link_bindings[i * 2],
 					link_bindings[i * 2 + 1]))
 			done = false;
 
+	for_each_child_of_node(con_np, child)
+		if (__of_link_to_suppliers(dev, child))
+			done = false;
+
 	if (!done)
 		return -ENODEV;
 	return 0;
 }
 
+static int of_link_to_suppliers(struct device *dev)
+{
+	if (!of_devlink)
+		return 0;
+	if (unlikely(!dev->of_node))
+		return 0;
+
+	return __of_link_to_suppliers(dev, dev->of_node);
+}
+
 #ifndef CONFIG_PPC
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,rmtfs-mem" },
-- 
2.22.0.510.g264f2c817a-goog

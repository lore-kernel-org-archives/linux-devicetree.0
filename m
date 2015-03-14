From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch 3/5] dt: unittest: add const where needed
Date: Sat, 14 Mar 2015 00:00:36 -0700
Message-ID: <5503DC94.1060405@gmail.com>
References: <5503C65F.4030000@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5503C65F.4030000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Fix warnings pointed out by checkpatch.

No bugs fixed, but the test code should be a good example of how to use
the devicetree API.

Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 drivers/of/unittest.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -666,7 +666,7 @@ static void __init of_selftest_parse_int
 	of_node_put(np);
 }
 
-static struct of_device_id match_node_table[] = {
+static const struct of_device_id match_node_table[] = {
 	{ .data = "A", .name = "name0", }, /* Name alone is lowest priority */
 	{ .data = "B", .type = "type1", }, /* followed by type alone */
 
@@ -740,7 +740,7 @@ static void __init of_selftest_platform_
 	int irq, rc;
 	struct device_node *np, *child, *grandchild;
 	struct platform_device *pdev;
-	struct of_device_id match[] = {
+	const struct of_device_id match[] = {
 		{ .compatible = "test-device", },
 		{}
 	};
@@ -941,7 +941,7 @@ static int selftest_remove(struct platfo
 	return 0;
 }
 
-static struct of_device_id selftest_match[] = {
+static const struct of_device_id selftest_match[] = {
 	{ .compatible = "selftest", },
 	{},
 };
@@ -1533,7 +1533,7 @@ static int selftest_i2c_bus_remove(struc
 	return 0;
 }
 
-static struct of_device_id selftest_i2c_bus_match[] = {
+static const struct of_device_id selftest_i2c_bus_match[] = {
 	{ .compatible = "selftest-i2c-bus", },
 	{},
 };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

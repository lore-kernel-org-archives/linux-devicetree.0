From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: [PATCH v2] of/unittest: Show broken behaviour in the platform bus
Date: Mon,  4 Jan 2016 13:13:21 +0100
Message-ID: <1451909614-5519-1-git-send-email-wsa@the-dreams.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add a single resource to the test bus device to exercise the platform
bus code a little more. This isn't strictly a devicetree test, but it is
a corner case that the devicetree runs into. Until we've got platform
device unittests, it can live here. It doesn't need to be an explicit
text because the kernel will oops when it is wrong.

Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[wsa: added the comment provided by Grant, rebased, and tested]
Signed-off-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 drivers/of/unittest.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

I found this patch in one of my branches and think it is still worth applying.
In v1, Rob wanted a comment added which Grant provided but never folded into
the patch. I have done so now :) Note that the fix to this problem was already
picked up by Rob.

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e16ea5717b7f76..bbff09dee1cf45 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -757,6 +757,11 @@ static void __init of_unittest_match_node(void)
 	}
 }
 
+static struct resource test_bus_res = {
+	.start = 0xfffffff8,
+	.end = 0xfffffff9,
+	.flags = IORESOURCE_MEM,
+};
 static const struct platform_device_info test_bus_info = {
 	.name = "unittest-bus",
 };
@@ -800,6 +805,15 @@ static void __init of_unittest_platform_populate(void)
 		return;
 	test_bus->dev.of_node = np;
 
+	/*
+	 * Add a dummy resource to the test bus node after it is
+	 * registered to catch problems with un-inserted resources. The
+	 * DT code doesn't insert the resources, and it has caused the
+	 * kernel to oops in the past. This makes sure the same bug
+	 * doesn't crop up again.
+	 */
+	platform_device_add_resources(test_bus, &test_bus_res, 1);
+
 	of_platform_populate(np, match, NULL, &test_bus->dev);
 	for_each_child_of_node(np, child) {
 		for_each_child_of_node(child, grandchild)
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

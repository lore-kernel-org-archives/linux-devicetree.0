From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of/unittest: Show broken behaviour in the platform bus
Date: Sun,  7 Jun 2015 15:20:10 +0100
Message-ID: <1433686811-12303-2-git-send-email-grant.likely@linaro.org>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433686811-12303-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a single resource to the test bus device to exercise the platform
bus code a little more. This isn't strictly a devicetree test, but it is
a corner case that the devicetree runs into. Until we've got platform
device unittests, it can live here. It doesn't need to be an explicit
text because the kernel will oops when it is wrong.

Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/unittest.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 18016341d5a9..0a27b38c3041 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -753,6 +753,11 @@ static void __init of_unittest_match_node(void)
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
@@ -795,6 +800,7 @@ static void __init of_unittest_platform_populate(void)
 	if (rc)
 		return;
 	test_bus->dev.of_node = np;
+	platform_device_add_resources(test_bus, &test_bus_res, 1);
 
 	of_platform_populate(np, match, NULL, &test_bus->dev);
 	for_each_child_of_node(np, child) {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

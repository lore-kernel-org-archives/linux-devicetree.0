From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/unittest: Swap arguments of of_unittest_apply_overlay()
Date: Thu, 19 Jan 2017 11:06:16 +0100
Message-ID: <20170119100616.4679-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Function signature

  of_unittest_apply_overlay(int unittest_nr, int overlay_nr, ...

and call sites, like in of_unittest_apply_overlay_check():

  ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, ...

do not match. Fix this in one place (function signature).
The only affected test case is 15, which supplies non-existing
overlay number 16, but two bugs matched here. Fix the test case.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/of/unittest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 53c83d66eb7e..66bfa8d674ce 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1181,7 +1181,7 @@ static void of_unittest_destroy_tracked_overlays(void)
 	} while (defers > 0);
 }
 
-static int of_unittest_apply_overlay(int unittest_nr, int overlay_nr,
+static int of_unittest_apply_overlay(int overlay_nr, int unittest_nr,
 		int *overlay_id)
 {
 	struct device_node *np = NULL;
@@ -1840,7 +1840,7 @@ static void of_unittest_overlay_i2c_15(void)
 	int ret;
 
 	/* device should enable */
-	ret = of_unittest_apply_overlay_check(16, 15, 0, 1, I2C_OVERLAY);
+	ret = of_unittest_apply_overlay_check(15, 15, 0, 1, I2C_OVERLAY);
 	if (ret != 0)
 		return;
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

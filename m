From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: unittest, fix possible use of unitialized variable
Date: Thu, 27 Apr 2017 21:31:13 -0700
Message-ID: <1493353873-24246-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Fix problem reported in the linux-next build.  last_sibling may be
unitialized in of_unittest() if the device tree is empty.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/unittest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 12597ff8cfb0..8f14a43f48e5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2119,7 +2119,7 @@ static int __init overlay_data_add(int onum)
  */
 static __init void of_unittest_overlay_high_level(void)
 {
-	struct device_node *last_sibling;
+	struct device_node *last_sibling = NULL;
 	struct device_node *np;
 	struct device_node *of_symbols;
 	struct device_node *overlay_base_symbols;
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH 1/2] of: fix uninitialized variable warning for overlay test
Date: Fri, 28 Apr 2017 11:44:11 +0200
Message-ID: <20170428094429.2396195-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

gcc warns that an empty device tree would cause undefined behavior:

drivers/of/unittest.c: In function 'of_unittest':
drivers/of/unittest.c:2199:25: warning: 'last_sibling' may be used uninitialized in this function [-Wmaybe-uninitialized]

This adds an initialization of the variable to zero, which we handle
correctly.

Fixes: 81d0848fc8d2 ("of: Add unit tests for applying overlays")
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 drivers/of/unittest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 12597ff8cfb0..6b8f3e6aa43c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2192,7 +2192,7 @@ static __init void of_unittest_overlay_high_level(void)
 
 	mutex_lock(&of_mutex);
 
-	for (np = of_root->child; np; np = np->sibling)
+	for (last_sibling = np = of_root->child; np; np = np->sibling)
 		last_sibling = np;
 
 	if (last_sibling)
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

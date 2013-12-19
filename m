From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dtc: remove extra parentheses to pass clang check
Date: Wed, 18 Dec 2013 19:24:29 -0500
Message-ID: <1387412669-28670-1-git-send-email-vapier@gentoo.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Yunlian Jiang <yunlian-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yunlian Jiang <yunlian-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

When building with clang, we get warnings like:
checks.c:623:32: error: equality comparison with extraneous parentheses
                        [-Werror,-Wparentheses-equality]
	if ((node->parent->addr_cells == -1))

URL: http://crbug.com/230457
Signed-off-by: Yunlian Jiang <yunlian-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
 checks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/checks.c b/checks.c
index ee96a25..e66d55c 100644
--- a/checks.c
+++ b/checks.c
@@ -624,11 +624,11 @@ static void check_avoid_default_addr_size(struct check *c, struct node *dt,
 	if (!reg && !ranges)
 		return;
 
-	if ((node->parent->addr_cells == -1))
+	if (node->parent->addr_cells == -1)
 		FAIL(c, "Relying on default #address-cells value for %s",
 		     node->fullpath);
 
-	if ((node->parent->size_cells == -1))
+	if (node->parent->size_cells == -1)
 		FAIL(c, "Relying on default #size-cells value for %s",
 		     node->fullpath);
 }
-- 
1.8.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

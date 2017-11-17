From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCHv2] of: Document exactly what of_find_node_by_name() puts
Date: Fri, 17 Nov 2017 08:53:21 -0800
Message-ID: <20171117165321.18591-1-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It isn't clear if this function of_node_put()s the 'from'
argument, or the node it searches. Clearly indicate which
variable is touched. Fold in some more fixes from Randy too
because we're in the area.

Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---

Changes from v1:
 * Fold in Randy's fixes

 drivers/of/base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 63897531cd75..4368a878df88 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -863,10 +863,10 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);
 
 /**
  *	of_find_node_by_name - Find a node by its "name" property
- *	@from:	The node to start searching from or NULL, the node
+ *	@from:	The node to start searching from or NULL; the node
  *		you pass will not be searched, only the next one
- *		will; typically, you pass what the previous call
- *		returned. of_node_put() will be called on it
+ *		will. Typically, you pass what the previous call
+ *		returned. of_node_put() will be called on @from.
  *	@name:	The name string to match against
  *
  *	Returns a node pointer with refcount incremented, use
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

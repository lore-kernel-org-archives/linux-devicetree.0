From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Subject: [PATCH 3/4] of/unittest: add missing of_node_put
Date: Thu, 22 Oct 2015 11:02:50 +0200
Message-ID: <1445504571-19838-4-git-send-email-Julia.Lawall@lip6.fr>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
(
   return child;
|
+  of_node_put(child);
?  return ...;
)
   ...
 }
// </smpl>

Combine the puts into code at the end of the function, for conciseness.

Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>

---
 drivers/of/unittest.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 9f71770..e16ea57 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -205,16 +205,20 @@ static int __init of_unittest_check_node_linkage(struct device_node *np)
 		if (child->parent != np) {
 			pr_err("Child node %s links to wrong parent %s\n",
 				 child->name, np->name);
-			return -EINVAL;
+			rc = -EINVAL;
+			goto put_child;
 		}
 
 		rc = of_unittest_check_node_linkage(child);
 		if (rc < 0)
-			return rc;
+			goto put_child;
 		count += rc;
 	}
 
 	return count + 1;
+put_child:
+	of_node_put(child);
+	return rc;
 }
 
 static void __init of_unittest_check_tree_linkage(void)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

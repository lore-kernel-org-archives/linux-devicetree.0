From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH v2] of: resolver: Add missing of_node_get and of_node_put
Date: Wed, 3 Feb 2016 23:39:01 +0530
Message-ID: <20160203180901.GA27874@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: pantelis.antoniou@konsulko.com, robh+dt@kernel.org, frowand.list@gmail.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

In __of_find_node_by_full_name, add an of_node_get when detecting the
desired element, to ensure that it ends up with a reference count that is 
one greater than on entering the function.

Also in __of_find_node_by_full_name, add an of_node_put on breaking
out of the for_each_child_of_node loop, to ensure that the reference
count of the returned value is not double incremented. This change
was made using Coccinelle.

The semantic patch used for this is as follows:

// <smpl>
@@
expression e;
local idexpression n;
@@

 for_each_child_of_node(..., n) {
   ... when != of_node_put(n)
       when != e = n
(
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl

Finally, add an of_node_put in for_each_child_of_node in the function
__of_adjust_phandle_ref after the value returned by
__of_find_node_by_full_name is no longer useful.

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
Changes in v2:
        -Added an of_node_get and an extra of_node_put in the
         functions __of_find_node_by_full_name and __of_adjust_phandle_ref
         respectively.

 drivers/of/resolver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 640eb4c..d313d49 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -36,12 +36,14 @@ static struct device_node *__of_find_node_by_full_name(struct device_node *node,
 
 	/* check */
 	if (of_node_cmp(node->full_name, full_name) == 0)
-		return node;
+		return of_node_get(node);
 
 	for_each_child_of_node(node, child) {
 		found = __of_find_node_by_full_name(child, full_name);
-		if (found != NULL)
+		if (found != NULL) {
+			of_node_put(child);
 			return found;
+		}
 	}
 
 	return NULL;
@@ -174,6 +176,7 @@ static int __of_adjust_phandle_ref(struct device_node *node,
 			if (of_prop_cmp(sprop->name, propstr) == 0)
 				break;
 		}
+		of_node_put(refnode);
 
 		if (!sprop) {
 			pr_err("%s: Could not find property '%s'\n",
-- 
1.9.1

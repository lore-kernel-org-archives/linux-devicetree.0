From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 1/4] of/overlay: add missing of_node_put
Date: Thu, 22 Oct 2015 11:02:48 +0200
Message-ID: <1445504571-19838-2-git-send-email-Julia.Lawall@lip6.fr>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: kernel-janitors@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/of/overlay.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 24e025f..54e5af9 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -149,6 +149,7 @@ static int of_overlay_apply_one(struct of_overlay *ov,
 			pr_err("%s: Failed to apply single node @%s/%s\n",
 					__func__, target->full_name,
 					child->name);
+			of_node_put(child);
 			return ret;
 		}
 	}
@@ -417,8 +418,10 @@ static int overlay_subtree_check(struct device_node *tree,
 		return 1;
 
 	for_each_child_of_node(tree, child) {
-		if (overlay_subtree_check(child, dn))
+		if (overlay_subtree_check(child, dn)) {
+			of_node_put(child);
 			return 1;
+		}
 	}
 
 	return 0;

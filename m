From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 2/4] of/platform: add missing of_node_put
Date: Thu, 22 Oct 2015 11:02:49 +0200
Message-ID: <1445504571-19838-3-git-send-email-Julia.Lawall@lip6.fr>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

for_each_child_of_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression root,e;
@@

 for_each_child_of_node(root,n) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  break;
)
   ...
 }
... when != n
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/of/platform.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 7b33e03..64daf05 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -409,8 +409,10 @@ int of_platform_bus_probe(struct device_node *root,
 		if (!of_match_node(matches, child))
 			continue;
 		rc = of_platform_bus_create(child, matches, NULL, parent, false);
-		if (rc)
+		if (rc) {
+			of_node_put(child);
 			break;
+		}
 	}
 
 	of_node_put(root);
@@ -451,8 +453,10 @@ int of_platform_populate(struct device_node *root,
 
 	for_each_child_of_node(root, child) {
 		rc = of_platform_bus_create(child, matches, lookup, parent, true);
-		if (rc)
+		if (rc) {
+			of_node_put(child);
 			break;
+		}
 	}
 	of_node_set_flag(root, OF_POPULATED_BUS);
 

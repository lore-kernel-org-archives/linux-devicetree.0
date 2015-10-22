From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 4/4] of/irq: add missing of_node_put
Date: Thu, 22 Oct 2015 11:02:51 +0200
Message-ID: <1445504571-19838-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445504571-19838-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

for_each_matching_node performs an of_node_get on each iteration, so
a break out of the loop requires an of_node_put.

A simplified version of the semantic patch that fixes this problem is as
follows (http://coccinelle.lip6.fr):

// <smpl>
@@
local idexpression n;
expression e;
identifier l;
@@

 for_each_matching_node(n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  goto l;
)
   ...
 }
...
l: ... when != n
// </smpl>

Besides the issue found by the semantic patch, this code also stores the
device_node value in a list, which requires an of_node_get, and then cleans
up the list on exit from the function, which requires an of_node_put.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/of/irq.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 171798d..902b89b 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -501,10 +501,12 @@ void __init of_irq_init(const struct of_device_id *matches)
 		 * pointer, interrupt-parent device_node etc.
 		 */
 		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
-		if (WARN_ON(!desc))
+		if (WARN_ON(!desc)) {
+			of_node_put(np);
 			goto err;
+		}
 
-		desc->dev = np;
+		desc->dev = of_node_get(np);
 		desc->interrupt_parent = of_irq_find_parent(np);
 		if (desc->interrupt_parent == np)
 			desc->interrupt_parent = NULL;
@@ -575,6 +577,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 err:
 	list_for_each_entry_safe(desc, temp_desc, &intc_desc_list, list) {
 		list_del(&desc->list);
+		of_node_put(desc->dev);
 		kfree(desc);
 	}
 }

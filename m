From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2] of: fix reference counting in of_graph_get_endpoint_by_regs
Date: Wed,  6 Jul 2016 12:11:36 +0200
Message-ID: <1467799896-18573-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The called of_graph_get_next_endpoint() already decrements the refcount
of the prev node, so it is wrong to do it again in the calling function.

Use the for_each_endpoint_of_node() helper to interate through the
endpoint OF nodes, which already does the right thing and simplifies
the code a bit.

Fixes: 8ccd0d0ca041
(of: add helper for getting endpoint node of specific identifiers)
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Reported-by: David Jander <david-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v2: Switch over to use for_each_endpoint_of_node() helper as requested
    by Rob Herring.
---
 drivers/of/base.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ebf84e3b56d5..c60d47c8c863 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2306,11 +2306,9 @@ struct device_node *of_graph_get_endpoint_by_regs(
 	const struct device_node *parent, int port_reg, int reg)
 {
 	struct of_endpoint endpoint;
-	struct device_node *node, *prev_node = NULL;
+	struct device_node *node = NULL;
 
-	while (1) {
-		node = of_graph_get_next_endpoint(parent, prev_node);
-		of_node_put(prev_node);
+	for_each_endpoint_of_node(parent, node) {
 		if (!node)
 			break;
 
@@ -2318,8 +2316,6 @@ struct device_node *of_graph_get_endpoint_by_regs(
 		if (((port_reg == -1) || (endpoint.port == port_reg)) &&
 			((reg == -1) || (endpoint.id == reg)))
 			return node;
-
-		prev_node = node;
 	}
 
 	return NULL;
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

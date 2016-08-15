From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3] of: fix reference counting in of_graph_get_endpoint_by_regs
Date: Mon, 15 Aug 2016 14:58:43 +0200
Message-ID: <1471265923-6424-1-git-send-email-l.stach@pengutronix.de>
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
Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v2: Switch over to use for_each_endpoint_of_node() helper as requested
    by Rob Herring.
v3: Drop redundant checking for NULL node.
---
 drivers/of/base.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7792266db259..430058b346b9 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2343,20 +2343,13 @@ struct device_node *of_graph_get_endpoint_by_regs(
 	const struct device_node *parent, int port_reg, int reg)
 {
 	struct of_endpoint endpoint;
-	struct device_node *node, *prev_node = NULL;
-
-	while (1) {
-		node = of_graph_get_next_endpoint(parent, prev_node);
-		of_node_put(prev_node);
-		if (!node)
-			break;
+	struct device_node *node = NULL;
 
+	for_each_endpoint_of_node(parent, node) {
 		of_graph_parse_endpoint(node, &endpoint);
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

From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] of: property: Document that of_graph_get_endpoint_by_regs needs of_node_put
Date: Fri, 15 Mar 2019 10:22:47 +0100
Message-ID: <20190315092247.7286-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

The node returned by of_graph_get_endpoint_by_regs has a reference taken,
and we need to put that reference back when done with the node.

However, the documentation for that node doesn't mention it, so let's make
sure it does.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 08430031bd28..29bfc5d3b783 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -659,7 +659,7 @@ EXPORT_SYMBOL(of_graph_get_next_endpoint);
  *
  * Return: An 'endpoint' node pointer which is identified by reg and at the same
  * is the child of a port node identified by port_reg. reg and port_reg are
- * ignored when they are -1.
+ * ignored when they are -1. Use of_node_put() on the pointer when done.
  */
 struct device_node *of_graph_get_endpoint_by_regs(
 	const struct device_node *parent, int port_reg, int reg)
-- 
2.20.1

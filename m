From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 4/7] of: Reduce indentation in of_graph_get_next_endpoint
Date: Thu, 27 Feb 2014 18:35:37 +0100
Message-ID: <1393522540-22887-5-git-send-email-p.zabel@pengutronix.de>
References: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

A 'return endpoint;' at the end of the (!prev) case allows to
reduce the indentation level of the (prev) case.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/of/base.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e650cf..8ecca7a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2026,32 +2026,34 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 			pr_err("%s(): no endpoint nodes specified for %s\n",
 			       __func__, parent->full_name);
 		of_node_put(node);
-	} else {
-		port = of_get_parent(prev);
-		if (WARN_ONCE(!port, "%s(): endpoint has no parent node\n",
-			      __func__))
-			return NULL;
 
-		/* Avoid dropping prev node refcount to 0. */
-		of_node_get(prev);
-		endpoint = of_get_next_child(port, prev);
-		if (endpoint) {
-			of_node_put(port);
-			return endpoint;
-		}
+		return endpoint;
+	}
 
-		/* No more endpoints under this port, try the next one. */
-		do {
-			port = of_get_next_child(parent, port);
-			if (!port)
-				return NULL;
-		} while (of_node_cmp(port->name, "port"));
+	port = of_get_parent(prev);
+	if (WARN_ONCE(!port, "%s(): endpoint has no parent node\n",
+		      __func__))
+		return NULL;
 
-		/* Pick up the first endpoint in this port. */
-		endpoint = of_get_next_child(port, NULL);
+	/* Avoid dropping prev node refcount to 0. */
+	of_node_get(prev);
+	endpoint = of_get_next_child(port, prev);
+	if (endpoint) {
 		of_node_put(port);
+		return endpoint;
 	}
 
+	/* No more endpoints under this port, try the next one. */
+	do {
+		port = of_get_next_child(parent, port);
+		if (!port)
+			return NULL;
+	} while (of_node_cmp(port->name, "port"));
+
+	/* Pick up the first endpoint in this port. */
+	endpoint = of_get_next_child(port, NULL);
+	of_node_put(port);
+
 	return endpoint;
 }
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
-- 
1.8.5.3

From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/6] of: introduce of_graph_get_remote_node
Date: Thu,  9 Feb 2017 13:05:53 -0600
Message-ID: <20170209190558.4784-2-robh@kernel.org>
References: <20170209190558.4784-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170209190558.4784-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

The OF graph API leaves too much of the graph walking to clients when
in many cases the driver doesn't care about accessing the port or
endpoint nodes. The drivers typically just want the device connected via
a particular graph connection. of_graph_get_remote_node provides this
functionality.

Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2:
- Fix of_node_put on endpoint node
- Added DocBook comments for function
- Made port/endpoint unsigned to disallow -1

 drivers/of/base.c        | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h |  8 ++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d4bea3c797d6..525eb804f6ea 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2469,3 +2469,40 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
 	return of_get_next_parent(np);
 }
 EXPORT_SYMBOL(of_graph_get_remote_port);
+
+/**
+ * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
+ * @node: pointer to parent device_node containing graph port/endpoint
+ * @port: identifier (value of reg property) of the parent port node
+ * @endpoint: identifier (value of reg property) of the endpoint node
+ *
+ * Return: Remote device node associated with remote endpoint node linked
+ *	   to @node. Use of_node_put() on it when done.
+ */
+struct device_node *of_graph_get_remote_node(const struct device_node *node,
+					     u32 port, u32 endpoint)
+{
+	struct device_node *endpoint_node, *remote;
+
+	endpoint_node = of_graph_get_endpoint_by_regs(node, port, endpoint);
+	if (!endpoint_node) {
+		pr_debug("no valid endpoint (%d, %d) for node %s\n",
+			 port, endpoint, node->full_name);
+		return NULL;
+	}
+
+	remote = of_graph_get_remote_port_parent(endpoint_node);
+	of_node_put(endpoint_node);
+	if (!remote) {
+		pr_debug("no valid remote node\n");
+		return NULL;
+	}
+
+	if (!of_device_is_available(remote)) {
+		pr_debug("not available for remote node\n");
+		return NULL;
+	}
+
+	return remote;
+}
+EXPORT_SYMBOL(of_graph_get_remote_node);
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index bb3a5a2cd570..abdb02eaef06 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -51,6 +51,8 @@ struct device_node *of_graph_get_endpoint_by_regs(
 struct device_node *of_graph_get_remote_port_parent(
 					const struct device_node *node);
 struct device_node *of_graph_get_remote_port(const struct device_node *node);
+struct device_node *of_graph_get_remote_node(const struct device_node *node,
+					     u32 port, u32 endpoint);
 #else

 static inline int of_graph_parse_endpoint(const struct device_node *node,
@@ -89,6 +91,12 @@ static inline struct device_node *of_graph_get_remote_port(
 {
 	return NULL;
 }
+static inline struct device_node *of_graph_get_remote_node(
+					const struct device_node *node,
+					u32 port, u32 endpoint)
+{
+	return NULL;
+}

 #endif /* CONFIG_OF */

--
2.10.1

From: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/8] of: add helper for getting endpoint node of specific
 identifiers
Date: Thu, 26 Mar 2015 20:15:34 +0900
Message-ID: <1427368540-28010-3-git-send-email-human.hwang@samsung.com>
References: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427368540-28010-1-git-send-email-human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org
Cc: sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dh09.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When there are multiple ports or multiple endpoints in a port, they have to be
distinguished by the value of reg property. It is common. The drivers can get
the specific endpoint in the specific port via this function. Now the drivers
have to implement this code in themselves or have to force the order of dt nodes
to get the right node.

Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes for v2:
 - None

Changes for v3:
 - None

 drivers/of/base.c        | 33 +++++++++++++++++++++++++++++++++
 include/linux/of_graph.h |  8 ++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index adb8764..ffc2235 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2165,6 +2165,39 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
 
 /**
+ * of_graph_get_endpoint_by_regs() - get endpoint node of specific identifiers
+ * @parent: pointer to the parent device node
+ * @port_reg: identifier (value of reg property) of the parent port node
+ * @reg: identifier (value of reg property) of the endpoint node
+ *
+ * Return: An 'endpoint' node pointer which is identified by reg and at the same
+ * is the child of a port node identified by port_reg. reg and port_reg are
+ * ignored when they are -1.
+ */
+struct device_node *of_graph_get_endpoint_by_regs(
+	const struct device_node *parent, int port_reg, int reg)
+{
+	struct of_endpoint endpoint;
+	struct device_node *node, *prev_node = NULL;
+
+	while (1) {
+		node = of_graph_get_next_endpoint(parent, prev_node);
+		of_node_put(prev_node);
+		if (!node)
+			break;
+
+		of_graph_parse_endpoint(node, &endpoint);
+		if (((port_reg == -1) || (endpoint.port == port_reg)) &&
+			((reg == -1) || (endpoint.id == reg)))
+			return node;
+
+		prev_node = node;
+	}
+
+	return NULL;
+}
+
+/**
  * of_graph_get_remote_port_parent() - get remote port's parent node
  * @node: pointer to a local endpoint device_node
  *
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index befef42..e859eb7 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -31,6 +31,8 @@ int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
+struct device_node *of_graph_get_endpoint_by_regs(
+		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_port_parent(
 					const struct device_node *node);
 struct device_node *of_graph_get_remote_port(const struct device_node *node);
@@ -49,6 +51,12 @@ static inline struct device_node *of_graph_get_next_endpoint(
 	return NULL;
 }
 
+struct device_node *of_graph_get_endpoint_by_regs(
+		const struct device_node *parent, int port_reg, int reg)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_remote_port_parent(
 					const struct device_node *node)
 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

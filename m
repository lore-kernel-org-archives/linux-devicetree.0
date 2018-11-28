Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:26975
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbeK1Nen (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 08:34:43 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2][resend] OF: add for_each_port_of_node()
Date: Wed, 28 Nov 2018 02:34:42 +0000
Message-ID: <87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2FF8B416E1064140A063C7445679CE43@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

We have for_each_endpoint_of_node(), but don't have port version of it.
It is useful if we have it. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/of_graph.h | 20 ++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 3db01ee..2ec4c95 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -585,6 +585,43 @@ struct device_node *of_graph_get_port_by_id(struct dev=
ice_node *parent, u32 id)
 EXPORT_SYMBOL(of_graph_get_port_by_id);
=20
 /**
+ * of_graph_get_next_port() - get next port node
+ * @parent: pointer to the parent device node
+ * @prev: previous port node, or NULL to get first
+ *
+ * Return: An 'port' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port(const struct device_node *paren=
t,
+					   struct device_node *prev)
+{
+	struct device_node *port;
+
+	if (!parent)
+		return NULL;
+
+	if (!prev) {
+		struct device_node *node;
+
+		node =3D of_get_child_by_name(parent, "ports");
+		if (node)
+			parent =3D node;
+		port =3D NULL;
+	} else {
+		port =3D prev;
+	}
+
+	do {
+		port =3D of_get_next_child(parent, port);
+		if (!port)
+			return NULL;
+	} while (of_node_cmp(port->name, "port"));
+
+	return port;
+}
+EXPORT_SYMBOL(of_graph_get_next_port);
+
+/**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
  * @prev: previous endpoint node, or NULL to get first
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 7fbbf80..d219cc7 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -27,6 +27,17 @@ struct of_endpoint {
 };
=20
 /**
+ * for_each_port_of_node - iterate over every port in a device node
+ * @parent: parent device node containing ports
+ * @child: loop variable pointing to the current port node
+ *
+ * When breaking out of the loop, of_node_put(child) has to be called manu=
ally.
+ */
+#define for_each_port_of_node(parent, child) \
+	for (child =3D of_graph_get_next_port(parent, NULL); child !=3D NULL; \
+	     child =3D of_graph_get_next_port(parent, child))
+
+/**
  * for_each_endpoint_of_node - iterate over every endpoint in a device nod=
e
  * @parent: parent device node containing ports and endpoints
  * @child: loop variable pointing to the current endpoint node
@@ -44,6 +55,8 @@ int of_graph_parse_endpoint(const struct device_node *nod=
e,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
 struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 =
id);
+struct device_node *of_graph_get_next_port(const struct device_node *paren=
t,
+					       struct device_node *previous);
 struct device_node *of_graph_get_next_endpoint(const struct device_node *p=
arent,
 					struct device_node *previous);
 struct device_node *of_graph_get_endpoint_by_regs(
@@ -75,6 +88,13 @@ static inline struct device_node *of_graph_get_port_by_i=
d(
 	return NULL;
 }
=20
+static inline struct device_node *of_graph_get_next_port(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_next_endpoint(
 					const struct device_node *parent,
 					struct device_node *previous)
--=20
2.7.4

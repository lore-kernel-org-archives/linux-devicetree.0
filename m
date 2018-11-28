Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:27114
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726731AbeK1Ne1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 08:34:27 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2][resend] OF: add of_graph_get_port()
Date: Wed, 28 Nov 2018 02:34:27 +0000
Message-ID: <87pnuq0whu.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE60616AB5C79743BF63753CB9AF1431@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

We have of_graph_get_port_parent(), of_graph_get_port_by_id(),
but don't have of_graph_get_port().
Thus we are using of_get_parent() to getting port from endpoint,
but it is not understandable. Let's add of_graph_get_port().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 8 ++++----
 include/linux/of_graph.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index f46828e..3db01ee 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -531,7 +531,7 @@ EXPORT_SYMBOL_GPL(of_prop_next_string);
 int of_graph_parse_endpoint(const struct device_node *node,
 			    struct of_endpoint *endpoint)
 {
-	struct device_node *port_node =3D of_get_parent(node);
+	struct device_node *port_node =3D of_graph_get_port(node);
=20
 	WARN_ONCE(!port_node, "%s(): endpoint %pOF has no parent node\n",
 		  __func__, node);
@@ -621,7 +621,7 @@ struct device_node *of_graph_get_next_endpoint(const st=
ruct device_node *parent,
 			return NULL;
 		}
 	} else {
-		port =3D of_get_parent(prev);
+		port =3D of_graph_get_port(prev);
 		if (WARN_ONCE(!port, "%s(): endpoint %pOF has no parent node\n",
 			      __func__, prev))
 			return NULL;
@@ -874,7 +874,7 @@ of_fwnode_property_read_string_array(const struct fwnod=
e_handle *fwnode,
 static struct fwnode_handle *
 of_fwnode_get_parent(const struct fwnode_handle *fwnode)
 {
-	return of_fwnode_handle(of_get_parent(to_of_node(fwnode)));
+	return of_fwnode_handle(of_graph_get_port(to_of_node(fwnode)));
 }
=20
 static struct fwnode_handle *
@@ -965,7 +965,7 @@ static int of_fwnode_graph_parse_endpoint(const struct =
fwnode_handle *fwnode,
 					  struct fwnode_endpoint *endpoint)
 {
 	const struct device_node *node =3D to_of_node(fwnode);
-	struct device_node *port_node =3D of_get_parent(node);
+	struct device_node *port_node =3D of_graph_get_port(node);
=20
 	endpoint->local_fwnode =3D fwnode;
=20
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 01038a6..7fbbf80 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -37,6 +37,8 @@ struct of_endpoint {
 	for (child =3D of_graph_get_next_endpoint(parent, NULL); child !=3D NULL;=
 \
 	     child =3D of_graph_get_next_endpoint(parent, child))
=20
+#define of_graph_get_port(endpoint) of_get_parent(endpoint)
+
 #ifdef CONFIG_OF
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
--=20
2.7.4

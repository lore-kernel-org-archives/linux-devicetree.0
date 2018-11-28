Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:26112
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726847AbeK1PqY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 10:46:24 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2][resend] OF: add for_each_port_of_node()
Date: Wed, 28 Nov 2018 04:46:04 +0000
Message-ID: <87in0h24yx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
        <87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
        <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
In-Reply-To: <CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <863757585B5B954AB6EE1BCC827AF299@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


Hi Rob

Thank you for reviewing

> I'd like to see the user for this first.
>
> Generally, I don't think iterating over port or endpoint nodes is the
> right way to walk the graph. A given port address has a defined
> function and you should be requesting the specific ports.

I attached patch which is using for_each_port_of_node().
I want to know "specified" port location.

-------------
>From 1abf55f28cc12c207bce646e579f19ded117d5c6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 15 Nov 2018 11:18:31 +0900
Subject: [PATCH] ASoC: simple-card-utils: fixup asoc_simple_card_get_dai_id=
()
 counting

asoc_simple_card_get_dai_id() returns DAI ID, but it is based on
DT node's "endpoint" count.
Almost all cases 1 port has 1 endpoint, thus, it was no problem.
But in reality, port : endpoint =3D 1 : N, thus, counting endpoint
is BUG, it should count "port".
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simp=
le-card-utils.c
index c69ce1e..119f831 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -270,7 +270,8 @@ EXPORT_SYMBOL_GPL(asoc_simple_card_parse_dai);
 static int asoc_simple_card_get_dai_id(struct device_node *ep)
 {
 	struct device_node *node;
-	struct device_node *endpoint;
+	struct device_node *p;
+	struct device_node *port;
 	int i, id;
 	int ret;
=20
@@ -279,20 +280,22 @@ static int asoc_simple_card_get_dai_id(struct device_=
node *ep)
 		return ret;
=20
 	node =3D of_graph_get_port_parent(ep);
+	port =3D of_graph_get_port(ep);
=20
 	/*
-	 * Non HDMI sound case, counting port/endpoint on its DT
+	 * Non HDMI sound case, counting port on its DT
 	 * is enough. Let's count it.
 	 */
 	i =3D 0;
 	id =3D -1;
-	for_each_endpoint_of_node(node, endpoint) {
-		if (endpoint =3D=3D ep)
+	for_each_port_of_node(node, p) {
+		if (port =3D=3D p)
 			id =3D i;
 		i++;
 	}
=20
 	of_node_put(node);
+	of_node_put(port);
=20
 	if (id < 0)
 		return -ENODEV;
--=20
2.7.4

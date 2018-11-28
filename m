Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:17504
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726731AbeK1Nd6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 08:33:58 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2][resend] OF: add functions for port
Date: Wed, 28 Nov 2018 02:33:56 +0000
Message-ID: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03B903B6FC35154A914B6A2F2096C595@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


Hi Rob, Frank

2weeks passed, I resend these patches again.

Kuninori Morimoto (2):
  OF: add of_graph_get_port()
  OF: add for_each_port_of_node()

 drivers/of/property.c    | 45 +++++++++++++++++++++++++++++++++++++++++---=
-
 include/linux/of_graph.h | 22 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 4 deletions(-)

--=20
2.7.4

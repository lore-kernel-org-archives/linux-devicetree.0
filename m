Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:61216
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727662AbeK1UkS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Nov 2018 15:40:18 -0500
From: Joakim Zhang <qiangqing.zhang@nxp.com>
Subject: [PATCH V3 0/3] ARM: dts: add flexcan support
Date: Wed, 28 Nov 2018 09:39:13 +0000
Message-ID: <20181128093658.27990-1-qiangqing.zhang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

This patch series intends to add flexcan support for IMX6 platforms.

Aisheng Dong (3):
  ARM: dts: imx6sx-sdb: add flexcan support
  ARM: dts: imx6sx-sabreauto: add flexcan support
  ARM: dts: imx6qdl-sabreauto: add flexcan support

 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 47 +++++++++++++++++++
 arch/arm/boot/dts/imx6sx-sabreauto.dts   | 57 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6sx-sdb-reva.dts    | 12 +++++
 arch/arm/boot/dts/imx6sx-sdb.dts         |  5 +++
 arch/arm/boot/dts/imx6sx-sdb.dtsi        | 42 +++++++++++++++++
 5 files changed, 163 insertions(+)

--=20
2.17.1

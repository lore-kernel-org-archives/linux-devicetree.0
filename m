Return-Path: <SRS0=qIkx=RS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65]:36220 "EHLO
        vs81.iboxed.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726204AbfCOVWY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Mar 2019 17:22:24 -0400
From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH 1/3] ARM: dts: i.MX50: Add i2c, mmc and spi aliases
Date: Fri, 15 Mar 2019 21:14:21 +0000
Message-Id: <20190315211423.11308-1-akurz@blala.de>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Alexander Kurz <akurz@blala.de>
List-ID: <devicetree@vger.kernel.org>

Using aliases, the devices will be enumerated properly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/imx50.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx50.dtsi b/arch/arm/boot/dts/imx50.dtsi
index ee1e3e8bf4ec..82e7acd7fc2a 100644
--- a/arch/arm/boot/dts/imx50.dtsi
+++ b/arch/arm/boot/dts/imx50.dtsi
@@ -26,11 +26,20 @@
 		gpio3 = &gpio4;
 		gpio4 = &gpio5;
 		gpio5 = &gpio6;
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		mmc0 = &esdhc1;
+		mmc1 = &esdhc2;
+		mmc2 = &esdhc3;
+		mmc3 = &esdhc4;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
 		serial3 = &uart4;
 		serial4 = &uart5;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
+		spi2 = &cspi;
 	};
 
 	cpus {
-- 
2.11.0

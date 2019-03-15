Return-Path: <SRS0=qIkx=RS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65]:36220 "EHLO
        vs81.iboxed.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726204AbfCOVWV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Mar 2019 17:22:21 -0400
From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH 3/3] ARM: dts: i.MX35: Add i2c and mmc aliases
Date: Fri, 15 Mar 2019 21:14:23 +0000
Message-Id: <20190315211423.11308-3-akurz@blala.de>
In-Reply-To: <20190315211423.11308-1-akurz@blala.de>
References: <20190315211423.11308-1-akurz@blala.de>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Alexander Kurz <akurz@blala.de>
List-ID: <devicetree@vger.kernel.org>

Using aliases, the devices will be enumerated properly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/imx35.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx35.dtsi b/arch/arm/boot/dts/imx35.dtsi
index 59cadeee23ed..9cbdc1a15cda 100644
--- a/arch/arm/boot/dts/imx35.dtsi
+++ b/arch/arm/boot/dts/imx35.dtsi
@@ -21,6 +21,12 @@
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		mmc0 = &esdhc1;
+		mmc1 = &esdhc2;
+		mmc2 = &esdhc3;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
-- 
2.11.0

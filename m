Return-Path: <SRS0=qIkx=RS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65]:36220 "EHLO
        vs81.iboxed.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726204AbfCOVW1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Mar 2019 17:22:27 -0400
From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH 2/3] ARM: dts: i.MX6SL: Add i2c and mmc aliases
Date: Fri, 15 Mar 2019 21:14:22 +0000
Message-Id: <20190315211423.11308-2-akurz@blala.de>
In-Reply-To: <20190315211423.11308-1-akurz@blala.de>
References: <20190315211423.11308-1-akurz@blala.de>
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Alexander Kurz <akurz@blala.de>
List-ID: <devicetree@vger.kernel.org>

Using aliases, the devices will be enumerated properly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/imx6sl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 4b4813f176cd..6caba5d0f248 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -23,6 +23,13 @@
 		gpio2 = &gpio3;
 		gpio3 = &gpio4;
 		gpio4 = &gpio5;
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		mmc3 = &usdhc4;
 		serial0 = &uart1;
 		serial1 = &uart2;
 		serial2 = &uart3;
-- 
2.11.0

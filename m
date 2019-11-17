Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5013C432C3
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8C41206D6
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfKQM13 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:27:29 -0500
Received: from inva021.nxp.com ([92.121.34.21]:60240 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbfKQM13 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 07:27:29 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CB42B2000BD;
        Sun, 17 Nov 2019 13:27:27 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E7B2420000A;
        Sun, 17 Nov 2019 13:27:22 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id DE9EB402A7;
        Sun, 17 Nov 2019 20:27:16 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: [PATCH RESEND v5 01/11] dt-bindings: firmware: imx-scu: new binding to parse clocks from device tree
Date:   Sun, 17 Nov 2019 20:25:09 +0800
Message-Id: <1573993519-14308-2-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There's a few limitations on the original one cell clock binding
(#clock-cells = <1>) that we have to define some SW clock IDs for device
tree to reference. This may cause troubles if we want to use common
clock IDs for multi platforms support when the clock of those platforms
are mostly the same.
e.g. Current clock IDs name are defined with SS prefix.

However the device may reside in different SS across CPUs, that means the
SS prefix may not valid anymore for a new SoC. Furthermore, the device
availability of those clocks may also vary a bit.

For such situation, we want to eliminate the using of SW Clock IDs and
change to use a more close to HW one instead.
For SCU clocks usage, only two params required: Resource id + Clock Type.
Both parameters are platform independent. So we could use two cells binding
to pass those parameters,

Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org
Acked-by: Shawn Guo <shawnguo@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v4->v5:
 * no changes
v3->v4:
 * add some comments for various clock types
v2->v3:
 * Changed to two cells binding and register all clocks in driver
   instead of parse from device tree.
v1->v2:
 * changed to one cell binding inspired by arm,scpi.txt
   Documentation/devicetree/bindings/arm/arm,scpi.txt
   Resource ID is encoded in 'reg' property.
   Clock type is encoded in generic clock-indices property.
   Then we don't have to search all the DT nodes to fetch
   those two value to construct clocks which is relatively
   low efficiency.
 * Add required power-domain property as well.
---
 .../bindings/arm/freescale/fsl,scu.txt        | 12 ++++++----
 include/dt-bindings/firmware/imx/rsrc.h       | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index c149fadc6f47..be0a8fe134c7 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -89,7 +89,10 @@ Required properties:
 			  "fsl,imx8qm-clock"
 			  "fsl,imx8qxp-clock"
 			followed by "fsl,scu-clk"
-- #clock-cells:		Should be 1. Contains the Clock ID value.
+- #clock-cells:		Should be either
+			2: Contains the Resource and Clock ID value.
+			or
+			1: Contains the Clock ID value. (DEPRECATED)
 - clocks:		List of clock specifiers, must contain an entry for
 			each required entry in clock-names
 - clock-names:		Should include entries "xtal_32KHz", "xtal_24MHz"
@@ -186,7 +189,7 @@ firmware {
 
 		clk: clk {
 			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
-			#clock-cells = <1>;
+			#clock-cells = <2>;
 		};
 
 		iomuxc {
@@ -231,8 +234,7 @@ serial@5a060000 {
 	...
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpuart0>;
-	clocks = <&clk IMX8QXP_UART0_CLK>,
-		 <&clk IMX8QXP_UART0_IPG_CLK>;
-	clock-names = "per", "ipg";
+	clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
+	clock-names = "ipg";
 	power-domains = <&pd IMX_SC_R_UART_0>;
 };
diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
index 4e61f6485097..24c153dfaa72 100644
--- a/include/dt-bindings/firmware/imx/rsrc.h
+++ b/include/dt-bindings/firmware/imx/rsrc.h
@@ -547,4 +547,27 @@
 #define IMX_SC_R_ATTESTATION		545
 #define IMX_SC_R_LAST			546
 
+/*
+ * Defines for SC PM CLK
+ */
+
+/* Normal device resource clock */
+#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
+#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
+#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
+#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
+#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
+
+/* Special clock types which do not belong to above normal clock types */
+#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
+#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
+#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
+#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
+#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
+
+/* Special clock types for CPU/PLL/BYPASS only */
+#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
+#define IMX_SC_PM_CLK_PLL		4	/* PLL */
+#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
+
 #endif /* __DT_BINDINGS_RSCRC_IMX_H */
-- 
2.23.0


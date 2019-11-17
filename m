Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D49FC43215
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C7C22075E
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 12:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfKQM1c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:27:32 -0500
Received: from inva020.nxp.com ([92.121.34.13]:49252 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbfKQM1b (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 17 Nov 2019 07:27:31 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E325E1A06F2;
        Sun, 17 Nov 2019 13:27:28 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 052071A06D4;
        Sun, 17 Nov 2019 13:27:24 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F1E3A402A9;
        Sun, 17 Nov 2019 20:27:17 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: [PATCH RESEND v5 02/11] dt-bindings: clock: imx-lpcg: add support to parse clocks from device tree
Date:   Sun, 17 Nov 2019 20:25:10 +0800
Message-Id: <1573993519-14308-3-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
in different subsystems across CPUs and also vary a bit on the availability.

Same as SCU clock, we want to move the clock definition into device tree
which can fully decouple the dependency of Clock ID definition from device
tree and make us be able to write a fully generic lpcg clock driver.

And we can also use the existence of clock nodes in device tree to address
the device and clock availability differences across different SoCs.

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
 * change bit-offset property to clock-indices
 * use constant macro to define clock indinces
 * drop hw-autogate property which is still not used by drivers
v2->v3:
 * no changes
v1->v2:
 * Update example
 * Add power domain property
---
 .../bindings/clock/imx8qxp-lpcg.txt           | 36 +++++++++++++++----
 include/dt-bindings/clock/imx8-lpcg.h         | 14 ++++++++
 2 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
index 965cfa42e025..cad8fc4284aa 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
@@ -11,6 +11,21 @@ enabled by these control bits, it might still not be running based
 on the base resource.
 
 Required properties:
+- compatible:		Should be one of:
+			  "fsl,imx8qxp-lpcg"
+			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
+- reg:			Address and length of the register set.
+- #clock-cells:		Should be 1. One LPCG supports multiple clocks.
+- clocks:		Input parent clocks phandle array for each clock.
+- clock-indices:	An integer array indicating the bit offset for each clock.
+			Refer to <include/dt-bindings/clock/imx8-lpcg.h> for the
+			supported LPCG clock indices.
+- clock-output-names:	Shall be the corresponding names of the outputs.
+			NOTE this property must be specified in the same order
+			as the clock-indices property.
+- power-domains:	Should contain the power domain used by this clock.
+
+Legacy binding (DEPRECATED):
 - compatible:	Should be one of:
 		  "fsl,imx8qxp-lpcg-adma",
 		  "fsl,imx8qxp-lpcg-conn",
@@ -33,10 +48,19 @@ Examples:
 
 #include <dt-bindings/clock/imx8qxp-clock.h>
 
-conn_lpcg: clock-controller@5b200000 {
-	compatible = "fsl,imx8qxp-lpcg-conn";
-	reg = <0x5b200000 0xb0000>;
+sdhc0_lpcg: clock-controller@5b200000 {
+	compatible = "fsl,imx8qxp-lpcg";
+	reg = <0x5b200000 0x10000>;
 	#clock-cells = <1>;
+	clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
+		 <&conn_ipg_clk>, <&conn_axi_clk>;
+	clock-indices = <IMX_LPCG_CLK_0>,
+			<IMX_LPCG_CLK_4>,
+			<IMX_LPCG_CLK_5>;
+	clock-output-names = "sdhc0_lpcg_per_clk",
+			     "sdhc0_lpcg_ipg_clk",
+			     "sdhc0_lpcg_ahb_clk";
+	power-domains = <&pd IMX_SC_R_SDHC_0>;
 };
 
 usdhc1: mmc@5b010000 {
@@ -44,8 +68,8 @@ usdhc1: mmc@5b010000 {
 	interrupt-parent = <&gic>;
 	interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
 	reg = <0x5b010000 0x10000>;
-	clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
-		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
-		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
+	clocks = <&sdhc0_lpcg IMX_LPCG_CLK_4>,
+		 <&sdhc0_lpcg IMX_LPCG_CLK_0>,
+		 <&sdhc0_lpcg IMX_LPCG_CLK_5>;
 	clock-names = "ipg", "per", "ahb";
 };
diff --git a/include/dt-bindings/clock/imx8-lpcg.h b/include/dt-bindings/clock/imx8-lpcg.h
new file mode 100644
index 000000000000..df90aad26265
--- /dev/null
+++ b/include/dt-bindings/clock/imx8-lpcg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2019 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#define IMX_LPCG_CLK_0	0
+#define IMX_LPCG_CLK_1	4
+#define IMX_LPCG_CLK_2	8
+#define IMX_LPCG_CLK_3	12
+#define IMX_LPCG_CLK_4	16
+#define IMX_LPCG_CLK_5	20
+#define IMX_LPCG_CLK_6	24
+#define IMX_LPCG_CLK_7	28
-- 
2.23.0


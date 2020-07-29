Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E012C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 580FD21744
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgG2IEn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:04:43 -0400
Received: from inva021.nxp.com ([92.121.34.21]:52478 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgG2IEn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Jul 2020 04:04:43 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7A18E20014B;
        Wed, 29 Jul 2020 10:04:41 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 30191200126;
        Wed, 29 Jul 2020 10:04:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CD6B1402F3;
        Wed, 29 Jul 2020 10:04:31 +0200 (CEST)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 01/11] dt-bindings: firmware: imx-scu: new binding to parse clocks from device tree
Date:   Wed, 29 Jul 2020 16:00:08 +0800
Message-Id: <1596009618-25516-2-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
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
v6->v7:
 * dropped SC PM clk definitions which already upstreamed by another patch
v4->v6:
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
 .../devicetree/bindings/arm/freescale/fsl,scu.txt    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 715047444391..d341285d9a58 100644
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
@@ -208,7 +211,7 @@ firmware {
 
 		clk: clk {
 			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
-			#clock-cells = <1>;
+			#clock-cells = <2>;
 		};
 
 		iomuxc {
@@ -263,8 +266,7 @@ serial@5a060000 {
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
-- 
2.23.0


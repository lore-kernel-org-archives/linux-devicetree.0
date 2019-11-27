Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F44C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:21:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8302820835
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 18:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfK0SVb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 13:21:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:47123 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfK0SVa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 13:21:30 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1ia1wP-0001vy-8L; Wed, 27 Nov 2019 19:21:29 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH 1/2] arm64: dts: imx8mq: add missing SAI nodes
Date:   Wed, 27 Nov 2019 19:21:26 +0100
Message-Id: <20191127182127.1204-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently only SAI2 is present in the DT. Add all the other SAI
instances present on the SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 55a3d1c4bdf0..42024ac3bc3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -281,6 +281,62 @@
 			#size-cells = <1>;
 			ranges = <0x30000000 0x30000000 0x400000>;
 
+			sai1: sai@30010000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mq-sai";
+				reg = <0x30010000 0x10000>;
+				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI1_IPG>,
+				         <&clk IMX8MQ_CLK_SAI1_ROOT>,
+				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 8 24 0>, <&sdma1 9 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai6: sai@30030000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mq-sai";
+				reg = <0x30030000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
+				         <&clk IMX8MQ_CLK_SAI6_ROOT>,
+				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai5: sai@30040000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mq-sai";
+				reg = <0x30040000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI5_IPG>,
+				         <&clk IMX8MQ_CLK_SAI5_ROOT>,
+				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 2 24 0>, <&sdma2 3 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
+			sai4: sai@30050000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mq-sai";
+				reg = <0x30050000 0x10000>;
+				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI4_IPG>,
+				         <&clk IMX8MQ_CLK_SAI4_ROOT>,
+				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 0 24 0>, <&sdma2 1 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
@@ -751,6 +807,20 @@
 				status = "disabled";
 			};
 
+			sai3: sai@308c0000 {
+				#sound-dai-cells = <0>;
+				compatible = "fsl,imx8mq-sai";
+				reg = <0x308c0000 0x10000>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
+				         <&clk IMX8MQ_CLK_SAI3_ROOT>,
+				         <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			crypto: crypto@30900000 {
 				compatible = "fsl,sec-v4.0";
 				#address-cells = <1>;
-- 
2.20.1


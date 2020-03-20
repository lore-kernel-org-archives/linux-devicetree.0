Return-Path: <SRS0=WWXW=5F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D22C43332
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3097020754
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Mar 2020 13:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgCTNNJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Mar 2020 09:13:09 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33031 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgCTNNJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Mar 2020 09:13:09 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jFHSR-0001XK-Mq; Fri, 20 Mar 2020 14:13:03 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
Date:   Fri, 20 Mar 2020 14:12:55 +0100
Message-Id: <20200320131256.23294-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320131256.23294-1-p.zabel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
decoder cores and a reset/control block.

Hook up the bus clock to the VPU power domain to enable handshakes, and
configure the core clocks to 600 MHz and the bus clock to 800 MHz by
default.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v6.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a1e83922c71..98e464ecb68a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -666,6 +666,7 @@
 					pgc_vpu: power-domain@6 {
 						#power-domain-cells = <0>;
 						reg = <IMX8M_POWER_DOMAIN_VPU>;
+						clocks = <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
 					};
 
 					pgc_disp: power-domain@7 {
@@ -1130,6 +1131,32 @@
 			status = "disabled";
 		};
 
+		vpu: video-codec@38300000 {
+			compatible = "nxp,imx8mq-vpu";
+			reg = <0x38300000 0x10000>,
+			      <0x38310000 0x10000>,
+			      <0x38320000 0x10000>;
+			reg-names = "g1", "g2", "ctrl";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1", "g2";
+			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+			clock-names = "g1", "g2", "bus";
+			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
+					  <&clk IMX8MQ_CLK_VPU_G2>,
+					  <&clk IMX8MQ_CLK_VPU_BUS>,
+					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_SYS1_PLL_800M>,
+						 <&clk IMX8MQ_VPU_PLL>;
+			assigned-clock-rates = <600000000>, <600000000>,
+					       <800000000>, <0>;
+			power-domains = <&pgc_vpu>;
+		};
+
 		pcie0: pcie@33800000 {
 			compatible = "fsl,imx8mq-pcie";
 			reg = <0x33800000 0x400000>,
-- 
2.20.1


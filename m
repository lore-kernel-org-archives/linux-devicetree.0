Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E74CC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D49220771
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a8c1sfvv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgHMB3l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57532 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHMB3j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:39 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D51BD1254;
        Thu, 13 Aug 2020 03:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282174;
        bh=QdJFLCHW5z2JsRZf06aTR0tpLstR64R1LL4ZN49zT+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a8c1sfvvkWsx2oE3Em+HqJ7PoqxoHzcqhojSCZ8Kl3lT1svLi7mUb+xNaNUfVh6nw
         eM/7+WIj/VSTaR9HuhyPgt5rLiAOFSi2FE0+DR6SH8UW9RpjaFloiPcQU5ollWbFil
         LKy2qDHKzb4E9fmqa6KpTACJC5NPGt71RGe0n8W4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 5/8] ARM: dts: imx: Fix LCDIF compatible strings
Date:   Thu, 13 Aug 2020 04:29:07 +0300
Message-Id: <20200813012910.13576-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The LCDIF in the i.MX6 SoCs has additional features compared to the
i.MX28. Replace the fsl,imx28-lcdif fallback compatible string with
fsl,imx6sx-lcdif to reflect that.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/imx6sll.dtsi | 2 +-
 arch/arm/boot/dts/imx6sx.dtsi  | 4 ++--
 arch/arm/boot/dts/imx6ul.dtsi  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 911d8cf77f2c..deeb647ffc3f 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -769,7 +769,7 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index edd3abb9a9f1..c51072bb43ba 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -644,7 +644,7 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 94e3df47d1ad..67da3a2d48ec 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -1241,7 +1241,7 @@ csi2: csi@221c000 {
 				};
 
 				lcdif1: lcdif@2220000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02220000 0x4000>;
 					interrupts = <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
@@ -1253,7 +1253,7 @@ lcdif1: lcdif@2220000 {
 				};
 
 				lcdif2: lcdif@2224000 {
-					compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
+					compatible = "fsl,imx6sx-lcdif";
 					reg = <0x02224000 0x4000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>;
 					clocks = <&clks IMX6SX_CLK_LCDIF2_PIX>,
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 5379a03391bd..b16cce1680a9 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -978,7 +978,7 @@ csi: csi@21c4000 {
 			};
 
 			lcdif: lcdif@21c8000 {
-				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6ul-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x021c8000 0x4000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
-- 
Regards,

Laurent Pinchart


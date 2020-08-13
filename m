Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31658C433E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CDE420675
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cJb/nD7V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgHMB3n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgHMB3n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:43 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 841661872;
        Thu, 13 Aug 2020 03:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282176;
        bh=WCYq+um9ir1mx1ChPeJdr5YnNRG9Q/YllI/SmChkUQU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cJb/nD7VEGYcU2B+8NR6z2ymtMdYa7wxZ4IzorZmEnT4XDGGlEBn0bjnUR72k8O1z
         duFggTukibr438WmDjUCLs/Ohwy1qny1EJqstT06VKZed4lqP4ottDYccdbK/xVgQo
         rT1mpVMWy5hZN2BCfqXL1gSk5DQ10M4sNJQiqqjE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 7/8] ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
Date:   Thu, 13 Aug 2020 04:29:09 +0300
Message-Id: <20200813012910.13576-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The LCDIF disp_axi clock is not mandatory in the DT binding and not
required by the driver. Remove it when it points to a dummy clock.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/imx6sl.dtsi  | 5 ++---
 arch/arm/boot/dts/imx6sll.dtsi | 5 ++---
 arch/arm/boot/dts/imx6ul.dtsi  | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index deeb647ffc3f..a4d74216c9f4 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -773,9 +773,8 @@ lcdif: lcdif@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
-					 <&clks IMX6SL_CLK_LCDIF_AXI>,
-					 <&clks IMX6SL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6SL_CLK_LCDIF_AXI>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 				power-domains = <&pd_disp>;
 			};
diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index c51072bb43ba..55775318559b 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -648,9 +648,8 @@ lcdif: lcd-controller@20f8000 {
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-					 <&clks IMX6SLL_CLK_LCDIF_APB>,
-					 <&clks IMX6SLL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6SLL_CLK_LCDIF_APB>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index b16cce1680a9..35df39cc85a4 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -982,9 +982,8 @@ lcdif: lcdif@21c8000 {
 				reg = <0x021c8000 0x4000>;
 				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
-					 <&clks IMX6UL_CLK_LCDIF_APB>,
-					 <&clks IMX6UL_CLK_DUMMY>;
-				clock-names = "pix", "axi", "disp_axi";
+					 <&clks IMX6UL_CLK_LCDIF_APB>;
+				clock-names = "pix", "axi";
 				status = "disabled";
 			};
 
-- 
Regards,

Laurent Pinchart


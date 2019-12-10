Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD38BC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 22:54:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93ED12073B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 22:54:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfLJWym (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 17:54:42 -0500
Received: from muru.com ([72.249.23.125]:44994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727349AbfLJWyl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 17:54:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 301E183A6;
        Tue, 10 Dec 2019 22:55:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 3/6] ARM: dts: Configure interconnect target module for omap4 des
Date:   Tue, 10 Dec 2019 14:54:30 -0800
Message-Id: <20191210225433.2720-4-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225433.2720-1-tony@atomide.com>
References: <20191210225433.2720-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 30 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap4.dtsi    |  9 ---------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2185,6 +2185,36 @@ target-module@a4000 {			/* 0x480a4000, ap 59 34.0 */
 				 <0x00001000 0x000a5000 0x00001000>;
 		};
 
+		des_target: target-module@a5000 {	/* 0x480a5000 */
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			ti,hwmods = "des";
+			reg = <0xa5030 0x4>,
+			      <0xa5034 0x4>,
+			      <0xa5038 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): l4per_pwrdm, l4_secure_clkdm */
+			clocks = <&l4_secure_clkctrl OMAP4_DES3DES_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xa5000 0x00001000>;
+
+			des: des@0 {
+				compatible = "ti,omap4-des";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 117>, <&sdma 116>;
+				dma-names = "tx", "rx";
+			};
+		};
+
 		target-module@a8000 {			/* 0x480a8000, ap 61 3e.0 */
 			compatible = "ti,sysc";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -326,15 +326,6 @@ aes2: aes@0 {
 			};
 		};
 
-		des: des@480a5000 {
-			compatible = "ti,omap4-des";
-			ti,hwmods = "des";
-			reg = <0x480a5000 0xa0>;
-			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&sdma 117>, <&sdma 116>;
-			dma-names = "tx", "rx";
-		};
-
 		sham_target: target-module@4b100000 {
 			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			ti,hwmods = "sham";
-- 
2.24.0

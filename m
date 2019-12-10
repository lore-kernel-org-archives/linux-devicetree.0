Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3487C00454
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 23:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82C7C2073D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 23:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfLJXRd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 18:17:33 -0500
Received: from muru.com ([72.249.23.125]:45054 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXRc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:32 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 59BE5820B;
        Tue, 10 Dec 2019 23:18:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 06/14] ARM: dts: Configure interconnect target module for dra7 aes
Date:   Tue, 10 Dec 2019 15:17:14 -0800
Message-Id: <20191210231722.44215-7-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210231722.44215-1-tony@atomide.com>
References: <20191210231722.44215-1-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi | 70 +++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -652,26 +652,68 @@ hdmi: encoder@58060000 {
 			};
 		};
 
-		aes1: aes@4b500000 {
-			compatible = "ti,omap4-aes";
+		aes1_target: target-module@4b500000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "aes1";
-			reg = <0x4b500000 0xa0>;
-			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&edma_xbar 111 0>, <&edma_xbar 110 0>;
-			dma-names = "tx", "rx";
-			clocks = <&l3_iclk_div>;
+			reg = <0x4b500080 0x4>,
+			      <0x4b500084 0x4>,
+			      <0x4b500088 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l4sec_clkdm */
+			clocks = <&l4sec_clkctrl DRA7_L4SEC_AES1_CLKCTRL 0>;
 			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4b500000 0x1000>;
+
+			aes1: aes@0 {
+				compatible = "ti,omap4-aes";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma_xbar 111 0>, <&edma_xbar 110 0>;
+				dma-names = "tx", "rx";
+				clocks = <&l3_iclk_div>;
+				clock-names = "fck";
+			};
 		};
 
-		aes2: aes@4b700000 {
-			compatible = "ti,omap4-aes";
+		aes2_target: target-module@4b700000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "aes2";
-			reg = <0x4b700000 0xa0>;
-			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&edma_xbar 114 0>, <&edma_xbar 113 0>;
-			dma-names = "tx", "rx";
-			clocks = <&l3_iclk_div>;
+			reg = <0x4b700080 0x4>,
+			      <0x4b700084 0x4>,
+			      <0x4b700088 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l4sec_clkdm */
+			clocks = <&l4sec_clkctrl DRA7_L4SEC_AES2_CLKCTRL 0>;
 			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x4b700000 0x1000>;
+
+			aes2: aes@0 {
+				compatible = "ti,omap4-aes";
+				reg = <0 0xa0>;
+				interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&edma_xbar 114 0>, <&edma_xbar 113 0>;
+				dma-names = "tx", "rx";
+				clocks = <&l3_iclk_div>;
+				clock-names = "fck";
+			};
 		};
 
 		des: des@480a5000 {
-- 
2.24.0

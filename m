Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE91C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 23:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02AAB2073D
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 23:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfLJXR2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 18:17:28 -0500
Received: from muru.com ([72.249.23.125]:45032 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbfLJXR2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 18:17:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DE3278387;
        Tue, 10 Dec 2019 23:18:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 02/14] ARM: dts: Configure interconnect target module for am4 sham
Date:   Tue, 10 Dec 2019 15:17:10 -0800
Message-Id: <20191210231722.44215-3-tony@atomide.com>
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

Similar to am3, I could not find any documentation for the sysc
register on this one, but it seems to work just fine based on
"ti,sysc-omap3-sham" compatible style configuration.

Cc: Keerthy <j-keerthy@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -256,13 +256,33 @@ mmc3: mmc@0 {
 			};
 		};
 
-		sham: sham@53100000 {
-			compatible = "ti,omap5-sham";
+		sham_target: target-module@53100000 {
+			compatible = "ti,sysc-omap3-sham", "ti,sysc";
 			ti,hwmods = "sham";
-			reg = <0x53100000 0x300>;
-			dmas = <&edma 36 0>;
-			dma-names = "rx";
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x53100100 0x4>,
+			      <0x53100110 0x4>,
+			      <0x53100114 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_SOFTRESET |
+					 SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			/* Domains (P, C): per_pwrdm, l3_clkdm */
+			clocks = <&l3_clkctrl AM4_L3_SHAM_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x53100000 0x1000>;
+
+			sham: sham@0 {
+				compatible = "ti,omap5-sham";
+				reg = <0 0x300>;
+				dmas = <&edma 36 0>;
+				dma-names = "rx";
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		aes: aes@53501000 {
-- 
2.24.0

Return-Path: <SRS0=kRJY=HH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:37158 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752558AbeDRRgc (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 18 Apr 2018 13:36:32 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: Fix cm2 and prm sizes for omap4
Date: Wed, 18 Apr 2018 10:36:29 -0700
Message-Id: <20180418173629.28055-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

The size of these modules is 0x2000, not 0x3000. The extra 0x1000
after 0x2000 is for the interconnect target agent which is a separate
device.

Fixes: 7415b0b4c645 ("ARM: dts: omap4: add minimal l4 bus layout with
control module support")
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -163,10 +163,10 @@
 
 			cm2: cm2@8000 {
 				compatible = "ti,omap4-cm2", "simple-bus";
-				reg = <0x8000 0x3000>;
+				reg = <0x8000 0x2000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
-				ranges = <0 0x8000 0x3000>;
+				ranges = <0 0x8000 0x2000>;
 
 				cm2_clocks: clocks {
 					#address-cells = <1>;
@@ -250,11 +250,11 @@
 
 				prm: prm@6000 {
 					compatible = "ti,omap4-prm";
-					reg = <0x6000 0x3000>;
+					reg = <0x6000 0x2000>;
 					interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 					#address-cells = <1>;
 					#size-cells = <1>;
-					ranges = <0 0x6000 0x3000>;
+					ranges = <0 0x6000 0x2000>;
 
 					prm_clocks: clocks {
 						#address-cells = <1>;
-- 
2.17.0

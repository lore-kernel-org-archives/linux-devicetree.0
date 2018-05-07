Return-Path: <SRS0=jssF=H2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:36766 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752029AbeEGNkJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 May 2018 09:40:09 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] ARM: dts: sh73a0: Add missing interrupt-affinity to PMU node
Date: Mon,  7 May 2018 15:40:04 +0200
Message-Id: <1525700405-7993-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1525700405-7993-1-git-send-email-geert+renesas@glider.be>
References: <1525700405-7993-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The PMU node references two interrupts, but lacks the interrupt-affinity
property, which is required in that case:

    hw perfevents: no interrupt-affinity property for /pmu, guessing.

Add the missing property to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index 2bcd6a276734c527..c8d45425c3393880 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -22,7 +22,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
@@ -31,7 +31,7 @@
 			power-domains = <&pd_a2sl>;
 			next-level-cache = <&L2>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
@@ -96,6 +96,7 @@
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
 	cmt1: timer@e6138000 {
-- 
2.7.4


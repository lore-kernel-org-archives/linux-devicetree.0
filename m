Return-Path: <SRS0=jssF=H2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:37880 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752132AbeEGNkJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 7 May 2018 09:40:09 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: emev2: Add missing interrupt-affinity to PMU node
Date: Mon,  7 May 2018 15:40:05 +0200
Message-Id: <1525700405-7993-3-git-send-email-geert+renesas@glider.be>
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
 arch/arm/boot/dts/emev2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index 42ea246e71cb4e20..fec1241b858ff96f 100644
--- a/arch/arm/boot/dts/emev2.dtsi
+++ b/arch/arm/boot/dts/emev2.dtsi
@@ -31,13 +31,13 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			clock-frequency = <533000000>;
 		};
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <1>;
@@ -57,6 +57,7 @@
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
 	clocks@e0110000 {
-- 
2.7.4


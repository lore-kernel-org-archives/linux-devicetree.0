Return-Path: <SRS0=Px8Z=LZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:59236 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbeIKThJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Sep 2018 15:37:09 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: Remove unneeded status from thermal nodes
Date: Tue, 11 Sep 2018 16:37:30 +0200
Message-Id: <20180911143730.9230-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The thermal device is supposed to be always enabled.  As the default
value of the status property is "okay", there is no need to make this
explicit in SoC-specific .dtsi files where no override is involved.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 1 -
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 -
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 -
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 046fc937da1441dc..012cbb64246ec144 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -358,7 +358,6 @@
 			power-domains = <&sysc 32>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 0c6d8859cae397c9..c74ef669a354d68e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -455,7 +455,6 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 93a76109882c9fe7..303504f3a5be4158 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -434,7 +434,6 @@
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 77fb909cc83985c5..22dca901182e577c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -350,7 +350,6 @@
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 522>;
 			#thermal-sensor-cells = <1>;
-			status = "okay";
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
-- 
2.17.1

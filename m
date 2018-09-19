Return-Path: <SRS0=MagM=MB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from inva021.nxp.com ([92.121.34.21]:36930 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbeISNTX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Sep 2018 09:19:23 -0400
From: andy.tang@nxp.com
Subject: [PATCH 2/3] powerpc: t102x: upgrade the legacy clock node
Date: Wed, 19 Sep 2018 15:39:05 +0800
Message-Id: <20180919073906.34187-2-andy.tang@nxp.com>
In-Reply-To: <20180919073906.34187-1-andy.tang@nxp.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, oss@buserror.net
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Yuantian Tang <andy.tang@nxp.com>

There are issues in current lagacy clock node.
The compatible string is not correct and the clocks property
refers to the wrong node too.
Instead of fixing them, upgrade it to use new clock binding
which has been already ready to use.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
 arch/powerpc/boot/dts/fsl/qoriq-clockgen.dtsi |   23 +++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi   |   20 ++------------------
 arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi    |    4 ++--
 3 files changed, 27 insertions(+), 20 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-clockgen.dtsi

diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-clockgen.dtsi
new file mode 100644
index 0000000..49c6f86
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Include file for NXP PowerPC family SoC.
+ *
+ * Copyright 2017 NXP
+ *
+ * Tang Yuantian <andy.tang@nxp.com>
+ *
+ */
+
+sysclk: sysclk {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <100000000>;
+	clock-output-names = "sysclk";
+};
+
+clockgen: global-utilities@e1000 {
+	compatible = "fsl,qoriq-clockgen";
+	reg = <0xe1000 0x1000>;
+	#clock-cells = <2>;
+	clocks = <&sysclk>;
+};
diff --git a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
index 4908af5..c77d3e9 100644
--- a/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1023si-post.dtsi
@@ -342,25 +342,9 @@
 		fsl,liodn-bits = <12>;
 	};
 
-/include/ "qoriq-clockgen2.dtsi"
+/include/ "qoriq-clockgen.dtsi"
 	global-utilities@e1000 {
-		compatible = "fsl,t1023-clockgen", "fsl,qoriq-clockgen-2.0";
-		mux0: mux0@0 {
-			#clock-cells = <0>;
-			reg = <0x0 4>;
-			compatible = "fsl,core-mux-clock";
-			clocks = <&pll0 0>, <&pll0 1>;
-			clock-names = "pll0_0", "pll0_1";
-			clock-output-names = "cmux0";
-		};
-		mux1: mux1@20 {
-			#clock-cells = <0>;
-			reg = <0x20 4>;
-			compatible = "fsl,core-mux-clock";
-			clocks = <&pll0 0>, <&pll0 1>;
-			clock-names = "pll0_0", "pll0_1";
-			clock-output-names = "cmux1";
-		};
+		compatible = "fsl,t1023-clockgen";
 	};
 
 	rcpm: global-utilities@e2000 {
diff --git a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi b/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
index 9d08a36..d87ea13 100644
--- a/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t102xsi-pre.dtsi
@@ -74,7 +74,7 @@
 		cpu0: PowerPC,e5500@0 {
 			device_type = "cpu";
 			reg = <0>;
-			clocks = <&mux0>;
+			clocks = <&clockgen 1 0>;
 			next-level-cache = <&L2_1>;
 			#cooling-cells = <2>;
 			L2_1: l2-cache {
@@ -84,7 +84,7 @@
 		cpu1: PowerPC,e5500@1 {
 			device_type = "cpu";
 			reg = <1>;
-			clocks = <&mux1>;
+			clocks = <&clockgen 1 1>;
 			next-level-cache = <&L2_2>;
 			#cooling-cells = <2>;
 			L2_2: l2-cache {
-- 
1.7.1

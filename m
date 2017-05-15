From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 1/7] ARM: dts: imx: Reintroduce 'anatop-enable-bit' where appropriate
Date: Mon, 15 May 2017 07:52:59 -0700
Message-ID: <20170515145305.4465-2-andrew.smirnov@gmail.com>
References: <20170515145305.4465-1-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515145305.4465-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, yurovsky@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that support for 'anatop-enable-bit' has been added to ANADIG
driver, reintroduce 'anatop-enable-bit' for all applicable LDOs.

Cc: yurovsky@gmail.com
Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 3 +++
 arch/arm/boot/dts/imx6sl.dtsi  | 3 +++
 arch/arm/boot/dts/imx6sx.dtsi  | 3 +++
 arch/arm/boot/dts/imx6ul.dtsi  | 1 +
 arch/arm/boot/dts/imx7s.dtsi   | 1 +
 5 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e426faa..0576ef6 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -644,6 +644,7 @@
 					anatop-min-bit-val = <4>;
 					anatop-min-voltage = <800000>;
 					anatop-max-voltage = <1375000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-3p0 {
@@ -658,6 +659,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2625000>;
 					anatop-max-voltage = <3400000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-2p5 {
@@ -672,6 +674,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2100000>;
 					anatop-max-voltage = <2875000>;
+					anatop-enable-bit = <0>;
 				};
 
 				reg_arm: regulator-vddcore {
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index cc9572e..3243af4 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -530,6 +530,7 @@
 					anatop-min-bit-val = <4>;
 					anatop-min-voltage = <800000>;
 					anatop-max-voltage = <1375000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-3p0 {
@@ -544,6 +545,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2625000>;
 					anatop-max-voltage = <3400000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-2p5 {
@@ -558,6 +560,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2100000>;
 					anatop-max-voltage = <2850000>;
+					anatop-enable-bit = <0>;
 				};
 
 				reg_arm: regulator-vddcore {
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 3f1416b..f16b9df 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -587,6 +587,7 @@
 					anatop-min-bit-val = <4>;
 					anatop-min-voltage = <800000>;
 					anatop-max-voltage = <1375000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-3p0 {
@@ -601,6 +602,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2625000>;
 					anatop-max-voltage = <3400000>;
+					anatop-enable-bit = <0>;
 				};
 
 				regulator-2p5 {
@@ -615,6 +617,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2100000>;
 					anatop-max-voltage = <2875000>;
+					anatop-enable-bit = <0>;
 				};
 
 				reg_arm: regulator-vddcore {
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index b9d7d2d..6da2b77 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -542,6 +542,7 @@
 					anatop-min-bit-val = <0>;
 					anatop-min-voltage = <2625000>;
 					anatop-max-voltage = <3400000>;
+					anatop-enable-bit = <0>;
 				};
 
 				reg_arm: regulator-vddcore {
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c4f12fd..8fee299 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -516,6 +516,7 @@
 					anatop-min-bit-val = <8>;
 					anatop-min-voltage = <800000>;
 					anatop-max-voltage = <1200000>;
+					anatop-enable-bit = <0>;
 				};
 			};
 
-- 
2.9.3

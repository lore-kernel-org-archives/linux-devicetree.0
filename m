From: Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 4/7] ARM: DTS: Amlogic: Enable reset controller for Meson8b
Date: Wed,  2 Dec 2015 18:22:30 +0100
Message-ID: <1449076953-5058-5-git-send-email-carlo@caione.org>
References: <1449076953-5058-1-git-send-email-carlo@caione.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1449076953-5058-1-git-send-email-carlo@caione.org>
Sender: linux-clk-owner@vger.kernel.org
To: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-meson@googlegroups.com, drake@endlessm.com, jerry.cao@amlogic.com, victor.wan@amlogic.com, pawel.moll@arm.com, arnd@arndb.de
Cc: Carlo Caione <carlo@endlessm.com>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

Extend the CPU nodes to use the reset controller.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index b1990dc..51b32ed 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -60,6 +60,7 @@
 			compatible = "arm,cortex-a5";
 			next-level-cache = <&L2>;
 			reg = <0x200>;
+			resets = <&clkc RST_CORE0>;
 		};
 
 		cpu@201 {
@@ -67,6 +68,7 @@
 			compatible = "arm,cortex-a5";
 			next-level-cache = <&L2>;
 			reg = <0x201>;
+			resets = <&clkc RST_CORE1>;
 		};
 
 		cpu@202 {
@@ -74,6 +76,7 @@
 			compatible = "arm,cortex-a5";
 			next-level-cache = <&L2>;
 			reg = <0x202>;
+			resets = <&clkc RST_CORE2>;
 		};
 
 		cpu@203 {
@@ -81,6 +84,7 @@
 			compatible = "arm,cortex-a5";
 			next-level-cache = <&L2>;
 			reg = <0x203>;
+			resets = <&clkc RST_CORE3>;
 		};
 	};
 
@@ -147,6 +151,7 @@
 		};
 
 		clkc: clock-controller@c1104000 {
+			#reset-cells = <1>;
 			#clock-cells = <1>;
 			compatible = "amlogic,meson8b-clkc";
 			reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
-- 
2.5.0


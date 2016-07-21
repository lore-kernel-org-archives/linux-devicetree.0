From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH 10/18] ARM: mvebu: a39x: enable watchdog for all Armada-39x SoCs
Date: Thu, 21 Jul 2016 14:44:07 +0200
Message-ID: <1469105055-25181-12-git-send-email-jaz@semihalf.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, jason@lakedaemon.net, andrew@lunn.ch, sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, jaz@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
Reviewed-by: Lior Amsalem <alior@marvell.com>
---
 arch/arm/boot/dts/armada-39x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
index 03dc0ec..5e01438 100644
--- a/arch/arm/boot/dts/armada-39x.dtsi
+++ b/arch/arm/boot/dts/armada-39x.dtsi
@@ -322,6 +322,14 @@
 				clock-names = "nbclk", "fixed";
 			};
 
+			watchdog@20300 {
+				compatible = "marvell,armada-380-wdt";
+				reg = <0x20300 0x34>, <0x20704 0x4>,
+				      <0x18260 0x4>;
+				clocks = <&coreclk 2>, <&refclk>;
+				clock-names = "nbclk", "fixed";
+			};
+
 			cpurst@20800 {
 				compatible = "marvell,armada-370-cpu-reset";
 				reg = <0x20800 0x10>;
@@ -534,5 +542,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <1000000000>;
 		};
+
+		/* 25 MHz reference crystal */
+		refclk: oscillator {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <25000000>;
+		};
 	};
 };
-- 
1.8.3.1

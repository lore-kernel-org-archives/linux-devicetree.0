From: Stefan Mavrodiev <stefan@olimex.com>
Subject: [PATCH 5/5] arm: dts: axpxx: add charge led node
Date: Thu, 31 Jan 2019 10:23:07 +0200
Message-ID: <20190131082308.22522-5-stefan@olimex.com>
References: <20190131082308.22522-1-stefan@olimex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131082308.22522-1-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:X-POWERS MULTIFUNCTION PMIC
        DEVICE DRIVERS" <linux-kernel@vger.kernel.org>
Cc: Stefan Mavrodiev <stefan@olimex.com>
List-Id: devicetree@vger.kernel.org

Add dt node for axp20x-led driver controlling CHGLED.
Default status is disabled, since it may be not used.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 arch/arm/boot/dts/axp209.dtsi | 5 +++++
 arch/arm/boot/dts/axp22x.dtsi | 5 +++++
 arch/arm/boot/dts/axp81x.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
index 0d9ff12bdf28..f972b6f3ecd0 100644
--- a/arch/arm/boot/dts/axp209.dtsi
+++ b/arch/arm/boot/dts/axp209.dtsi
@@ -69,6 +69,11 @@
 		#gpio-cells = <2>;
 	};
 
+	axp_led: led {
+		compatible = "x-powers,axp20x-led";
+		status = "disabled";
+	};
+
 	battery_power_supply: battery-power-supply {
 		compatible = "x-powers,axp209-battery-power-supply";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/axp22x.dtsi b/arch/arm/boot/dts/axp22x.dtsi
index 65a07a67aca9..92a0b64252b1 100644
--- a/arch/arm/boot/dts/axp22x.dtsi
+++ b/arch/arm/boot/dts/axp22x.dtsi
@@ -62,6 +62,11 @@
 		#io-channel-cells = <1>;
 	};
 
+	axp_led: led {
+		compatible = "x-powers,axp20x-led";
+		status = "disabled";
+	};
+
 	battery_power_supply: battery-power-supply {
 		compatible = "x-powers,axp221-battery-power-supply";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/axp81x.dtsi b/arch/arm/boot/dts/axp81x.dtsi
index bd83962d3627..22e243cc40d5 100644
--- a/arch/arm/boot/dts/axp81x.dtsi
+++ b/arch/arm/boot/dts/axp81x.dtsi
@@ -74,6 +74,11 @@
 		};
 	};
 
+	axp_led: led {
+		compatible = "x-powers,axp20x-led";
+		status = "disabled";
+	};
+
 	battery_power_supply: battery-power-supply {
 		compatible = "x-powers,axp813-battery-power-supply";
 		status = "disabled";
-- 
2.17.1

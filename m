From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: h6: Add clock to CPU cores
Date: Thu, 14 Feb 2019 08:09:09 -0500
Message-ID: <20190214130910.9201-4-tiny.windzz@gmail.com>
References: <20190214130910.9201-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214130910.9201-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

The ARM CPU cores are fed by the CPU clock from the CCU. Add a
reference to the clock for each CPU core, along with the clock
transition latency.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index d93a7add67e7..57a1390ecdc2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -26,6 +26,8 @@
 			device_type = "cpu";
 			reg = <0>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>; 
+			clock-latency-ns = <244144>; /* 8 32k periods */
 		};
 
 		cpu1: cpu@1 {
@@ -33,6 +35,8 @@
 			device_type = "cpu";
 			reg = <1>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>; 
+			clock-latency-ns = <244144>; /* 8 32k periods */
 		};
 
 		cpu2: cpu@2 {
@@ -40,6 +44,8 @@
 			device_type = "cpu";
 			reg = <2>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>; 
+			clock-latency-ns = <244144>; /* 8 32k periods */
 		};
 
 		cpu3: cpu@3 {
@@ -47,6 +53,8 @@
 			device_type = "cpu";
 			reg = <3>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>; 
+			clock-latency-ns = <244144>; /* 8 32k periods */
 		};
 	};
 
-- 
2.17.0

From: Feng Kan <fkan@apm.com>
Subject: [PATCH] arm64: dts: Add Designware GPIO dts binding to APM X-Gene platform
Date: Wed, 25 Jun 2014 16:56:16 -0700
Message-ID: <1403740576-7165-1-git-send-email-fkan@apm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: patches@apm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Add Designware GPIO dts binding to APM X-Gene platform

Signed-off-by: Feng Kan <fkan@apm.com>
---
 arch/arm64/boot/dts/apm-storm.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index c5f0a47..63e58d3 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -363,5 +363,20 @@
 			#clock-cells = <1>;
 			clocks = <&rtcclk 0>;
 		};
+
+		dwgpio: dwgpio@1c024000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0x1c024000 0x0 0x1000>;
+			reg-io-width = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+		};
 	};
 };
-- 
1.9.1


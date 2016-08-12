From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: imx7d: add clock-frequency to CPU nodes
Date: Thu, 11 Aug 2016 17:11:07 -0700
Message-ID: <20160812001107.17016-2-stefan@agner.ch>
References: <20160812001107.17016-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160812001107.17016-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add clock-frequency property to CPU nodes. Avoids warnings like
"/cpus/cpu@0 missing clock-frequency property".

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7d.dtsi | 2 ++
 arch/arm/boot/dts/imx7s.dtsi | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index d0b199c..f6dee41 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -51,12 +51,14 @@
 				996000	1075000
 				792000	975000
 			>;
+			clock-frequency = <996000000>;
 		};
 
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
+			clock-frequency = <996000000>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 5132e2f..81da211 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -85,6 +85,7 @@
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
+			clock-frequency = <792000000>;
 			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clks IMX7D_CLK_ARM>;
 		};
-- 
2.9.0

From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 5/7] ARM: dts: imx6ul: add ARM architected timer
Date: Tue,  2 Jan 2018 17:42:21 +0100
Message-ID: <20180102164223.15230-5-stefan@agner.ch>
References: <20180102164223.15230-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180102164223.15230-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add per-core ARM architected timer. Unfortunately bootloaders (U-Boot)
currently do not make the necessary initialization. Also specifing the
clock manually using the clock-frequency property seems not to help.
Therefor leave the timer disabled by default for now.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6ul.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 993fbdbdd506..4d76923e8f44 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -110,6 +110,16 @@
 		      <0x00a06000 0x2000>;
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-parent = <&intc>;
+		status = "disabled";
+	};
+
 	ckil: clock-cli {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.15.1

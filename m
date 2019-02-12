From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am65-mcu: Add ADC nodes
Date: Tue, 12 Feb 2019 17:52:37 +0530
Message-ID: <20190212122237.10976-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

TI AM654 SoC has two ADC instances in the MCU domain. Add DT nodes for
the same.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
Tero,

Could you also pick up DT bindings here: https://patchwork.kernel.org/patch/10751429/
All the Acks are in place.

 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 30 +++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 12 ++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 593f718e8fb5..6f7d2b316ded 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -57,4 +57,34 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
+
+	tscadc0: tscadc@40200000 {
+		compatible = "ti,am654-tscadc", "ti,am3359-tscadc";
+		reg = <0x0 0x40200000 0x0 0x1000>;
+		interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 0 2>;
+		assigned-clocks = <&k3_clks 0 2>;
+		assigned-clock-rates = <60000000>;
+		clock-names = "adc_tsc_fck";
+
+		adc {
+			#io-channel-cells = <1>;
+			compatible = "ti,am654-adc", "ti,am3359-adc";
+		};
+	};
+
+	tscadc1: tscadc@40210000 {
+		compatible = "ti,am654-tscadc", "ti,am3359-tscadc";
+		reg = <0x0 0x40210000 0x0 0x1000>;
+		interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&k3_clks 1 2>;
+		assigned-clocks = <&k3_clks 1 2>;
+		assigned-clock-rates = <60000000>;
+		clock-names = "adc_tsc_fck";
+
+		adc {
+			#io-channel-cells = <1>;
+			compatible = "ti,am654-adc", "ti,am3359-adc";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index e41fc3a5987b..fb6df5c8f85b 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -163,3 +163,15 @@
 		#size-cells= <1>;
 	};
 };
+
+&tscadc0 {
+	adc {
+		ti,adc-channels = <0 1 2 3 4 5 6 7>;
+	};
+};
+
+&tscadc1 {
+	adc {
+		ti,adc-channels = <0 1 2 3 4 5 6 7>;
+	};
+};
-- 
2.20.1

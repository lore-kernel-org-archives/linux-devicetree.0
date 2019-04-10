From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v3 5/5] arm64: dts: ti: k3-am654: Update the power domain cells
Date: Wed, 10 Apr 2019 11:07:28 +0530
Message-ID: <20190410053728.17374-6-lokeshvutla@ti.com>
References: <20190410053728.17374-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190410053728.17374-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Update the power-domain cells to 2 and mark all devices as
exclusive for now.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 32 +++++++++++-----------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi    | 10 +++----
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi |  6 ++--
 arch/arm64/boot/dts/ti/k3-am65.dtsi        |  1 +
 4 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 752455269fab..e29fa5cacf14 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -68,7 +68,7 @@
 		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
 		current-speed = <115200>;
-		power-domains = <&k3_pds 146>;
+		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_uart1: serial@2810000 {
@@ -78,7 +78,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		power-domains = <&k3_pds 147>;
+		power-domains = <&k3_pds 147 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_uart2: serial@2820000 {
@@ -88,7 +88,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		power-domains = <&k3_pds 148>;
+		power-domains = <&k3_pds 148 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_pmx0: pinmux@11c000 {
@@ -115,7 +115,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 110 1>;
-		power-domains = <&k3_pds 110>;
+		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_i2c1: i2c@2010000 {
@@ -126,7 +126,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 111 1>;
-		power-domains = <&k3_pds 111>;
+		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_i2c2: i2c@2020000 {
@@ -137,7 +137,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 112 1>;
-		power-domains = <&k3_pds 112>;
+		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	main_i2c3: i2c@2030000 {
@@ -148,14 +148,14 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 113 1>;
-		power-domains = <&k3_pds 113>;
+		power-domains = <&k3_pds 113 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	ecap0: pwm@3100000 {
 		compatible = "ti,am654-ecap", "ti,am3352-ecap";
 		#pwm-cells = <3>;
 		reg = <0x0 0x03100000 0x0 0x60>;
-		power-domains = <&k3_pds 39>;
+		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 39 0>;
 		clock-names = "fck";
 	};
@@ -165,7 +165,7 @@
 		reg = <0x0 0x2100000 0x0 0x400>;
 		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 137 1>;
-		power-domains = <&k3_pds 137>;
+		power-domains = <&k3_pds 137 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -175,7 +175,7 @@
 		reg = <0x0 0x2110000 0x0 0x400>;
 		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 138 1>;
-		power-domains = <&k3_pds 138>;
+		power-domains = <&k3_pds 138 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		assigned-clocks = <&k3_clks 137 1>;
@@ -187,7 +187,7 @@
 		reg = <0x0 0x2120000 0x0 0x400>;
 		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 139 1>;
-		power-domains = <&k3_pds 139>;
+		power-domains = <&k3_pds 139 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -197,7 +197,7 @@
 		reg = <0x0 0x2130000 0x0 0x400>;
 		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 140 1>;
-		power-domains = <&k3_pds 140>;
+		power-domains = <&k3_pds 140 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -207,7 +207,7 @@
 		reg = <0x0 0x2140000 0x0 0x400>;
 		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 141 1>;
-		power-domains = <&k3_pds 141>;
+		power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -215,7 +215,7 @@
 	sdhci0: sdhci@4f80000 {
 		compatible = "ti,am654-sdhci-5.1";
 		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
-		power-domains = <&k3_pds 47>;
+		power-domains = <&k3_pds 47 TI_SCI_PD_EXCLUSIVE>;
 		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
 		clock-names = "clk_ahb", "clk_xin";
 		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
@@ -242,7 +242,7 @@
 		ranges = <0x0 0x0 0x4000000 0x20000>;
 		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		dma-coherent;
-		power-domains = <&k3_pds 151>;
+		power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
 		assigned-clocks = <&k3_clks 151 2>, <&k3_clks 151 7>;
 		assigned-clock-parents = <&k3_clks 151 4>,	/* set REF_CLK to 20MHz i.e. PER0_PLL/48 */
 					 <&k3_clks 151 9>;	/* set PIPE3_TXB_CLK to CLK_12M_RC/256 (for HS only) */
@@ -281,7 +281,7 @@
 		ranges = <0x0 0x0 0x4020000 0x20000>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		dma-coherent;
-		power-domains = <&k3_pds 152>;
+		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
 		assigned-clocks = <&k3_clks 152 2>;
 		assigned-clock-parents = <&k3_clks 152 4>;	/* set REF_CLK to 20MHz i.e. PER0_PLL/48 */
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 6f7d2b316ded..46200b230257 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -14,7 +14,7 @@
 			interrupts = <GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <96000000>;
 			current-speed = <115200>;
-			power-domains = <&k3_pds 149>;
+			power-domains = <&k3_pds 149 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	mcu_i2c0: i2c@40b00000 {
@@ -25,7 +25,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 114 1>;
-		power-domains = <&k3_pds 114>;
+		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	mcu_spi0: spi@40300000 {
@@ -33,7 +33,7 @@
 		reg = <0x0 0x40300000 0x0 0x400>;
 		interrupts = <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 142 1>;
-		power-domains = <&k3_pds 142>;
+		power-domains = <&k3_pds 142 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -43,7 +43,7 @@
 		reg = <0x0 0x40310000 0x0 0x400>;
 		interrupts = <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 143 1>;
-		power-domains = <&k3_pds 143>;
+		power-domains = <&k3_pds 143 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -53,7 +53,7 @@
 		reg = <0x0 0x40320000 0x0 0x400>;
 		interrupts = <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 144 1>;
-		power-domains = <&k3_pds 144>;
+		power-domains = <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 7cbdc0912ab7..ccbc91e85c90 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
@@ -20,7 +20,7 @@
 
 		k3_pds: power-controller {
 			compatible = "ti,sci-pm-domain";
-			#power-domain-cells = <1>;
+			#power-domain-cells = <2>;
 		};
 
 		k3_clks: clocks {
@@ -50,7 +50,7 @@
 		interrupts = <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
 		current-speed = <115200>;
-		power-domains = <&k3_pds 150>;
+		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
 	};
 
 	wkup_i2c0: i2c@42120000 {
@@ -61,6 +61,6 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 115 1>;
-		power-domains = <&k3_pds 115>;
+		power-domains = <&k3_pds 115 TI_SCI_PD_EXCLUSIVE>;
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am65.dtsi b/arch/arm64/boot/dts/ti/k3-am65.dtsi
index 50f4be2047a9..3aeb69e6638c 100644
--- a/arch/arm64/boot/dts/ti/k3-am65.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/k3.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
 
 / {
 	model = "Texas Instruments K3 AM654 SoC";
-- 
2.21.0

From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am654: Update the power domain cells
Date: Mon, 18 Feb 2019 10:45:17 +0530
Message-ID: <20190218051517.9218-5-lokeshvutla@ti.com>
References: <20190218051517.9218-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218051517.9218-1-lokeshvutla@ti.com>
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
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi   | 26 +++++++++++-----------
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi    | 10 ++++-----
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi |  6 ++---
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 272cf8fc8d30..0156cf0e7205 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -48,7 +48,7 @@
 		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
 		current-speed = <115200>;
-		power-domains = <&k3_pds 146>;
+		power-domains = <&k3_pds 146 1>;
 	};
 
 	main_uart1: serial@2810000 {
@@ -58,7 +58,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		power-domains = <&k3_pds 147>;
+		power-domains = <&k3_pds 147 1>;
 	};
 
 	main_uart2: serial@2820000 {
@@ -68,7 +68,7 @@
 		reg-io-width = <4>;
 		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 		clock-frequency = <48000000>;
-		power-domains = <&k3_pds 148>;
+		power-domains = <&k3_pds 148 1>;
 	};
 
 	main_pmx0: pinmux@11c000 {
@@ -95,7 +95,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 110 1>;
-		power-domains = <&k3_pds 110>;
+		power-domains = <&k3_pds 110 1>;
 	};
 
 	main_i2c1: i2c@2010000 {
@@ -106,7 +106,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 111 1>;
-		power-domains = <&k3_pds 111>;
+		power-domains = <&k3_pds 111 1>;
 	};
 
 	main_i2c2: i2c@2020000 {
@@ -117,7 +117,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 112 1>;
-		power-domains = <&k3_pds 112>;
+		power-domains = <&k3_pds 112 1>;
 	};
 
 	main_i2c3: i2c@2030000 {
@@ -128,14 +128,14 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 113 1>;
-		power-domains = <&k3_pds 113>;
+		power-domains = <&k3_pds 113 1>;
 	};
 
 	ecap0: pwm@3100000 {
 		compatible = "ti,am654-ecap", "ti,am3352-ecap";
 		#pwm-cells = <3>;
 		reg = <0x0 0x03100000 0x0 0x60>;
-		power-domains = <&k3_pds 39>;
+		power-domains = <&k3_pds 39 1>;
 		clocks = <&k3_clks 39 0>;
 		clock-names = "fck";
 	};
@@ -145,7 +145,7 @@
 		reg = <0x0 0x2100000 0x0 0x400>;
 		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 137 1>;
-		power-domains = <&k3_pds 137>;
+		power-domains = <&k3_pds 137 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -155,7 +155,7 @@
 		reg = <0x0 0x2110000 0x0 0x400>;
 		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 138 1>;
-		power-domains = <&k3_pds 138>;
+		power-domains = <&k3_pds 138 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		assigned-clocks = <&k3_clks 137 1>;
@@ -167,7 +167,7 @@
 		reg = <0x0 0x2120000 0x0 0x400>;
 		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 139 1>;
-		power-domains = <&k3_pds 139>;
+		power-domains = <&k3_pds 139 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -177,7 +177,7 @@
 		reg = <0x0 0x2130000 0x0 0x400>;
 		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 140 1>;
-		power-domains = <&k3_pds 140>;
+		power-domains = <&k3_pds 140 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -187,7 +187,7 @@
 		reg = <0x0 0x2140000 0x0 0x400>;
 		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 141 1>;
-		power-domains = <&k3_pds 141>;
+		power-domains = <&k3_pds 141 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 593f718e8fb5..f2f54d80cf39 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -14,7 +14,7 @@
 			interrupts = <GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <96000000>;
 			current-speed = <115200>;
-			power-domains = <&k3_pds 149>;
+			power-domains = <&k3_pds 149 1>;
 	};
 
 	mcu_i2c0: i2c@40b00000 {
@@ -25,7 +25,7 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 114 1>;
-		power-domains = <&k3_pds 114>;
+		power-domains = <&k3_pds 114 1>;
 	};
 
 	mcu_spi0: spi@40300000 {
@@ -33,7 +33,7 @@
 		reg = <0x0 0x40300000 0x0 0x400>;
 		interrupts = <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 142 1>;
-		power-domains = <&k3_pds 142>;
+		power-domains = <&k3_pds 142 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -43,7 +43,7 @@
 		reg = <0x0 0x40310000 0x0 0x400>;
 		interrupts = <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 143 1>;
-		power-domains = <&k3_pds 143>;
+		power-domains = <&k3_pds 143 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
@@ -53,7 +53,7 @@
 		reg = <0x0 0x40320000 0x0 0x400>;
 		interrupts = <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 144 1>;
-		power-domains = <&k3_pds 144>;
+		power-domains = <&k3_pds 144 1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
index 7cbdc0912ab7..68fd833c130a 100644
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
+		power-domains = <&k3_pds 150 1>;
 	};
 
 	wkup_i2c0: i2c@42120000 {
@@ -61,6 +61,6 @@
 		#size-cells = <0>;
 		clock-names = "fck";
 		clocks = <&k3_clks 115 1>;
-		power-domains = <&k3_pds 115>;
+		power-domains = <&k3_pds 115 1>;
 	};
 };
-- 
2.19.2

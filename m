From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 08/15] ARM: dts: rockchip: order nodes by register address
Date: Sun, 27 Jul 2014 01:18:24 +0200
Message-ID: <1406416711-28006-9-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, olof@lixom.net, devicetree@vger.kernel.org, b.galvani@gmail.com, max.schwarz@online.de
Cc: Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

To create some sort of ordering of nodes, they are suggested to be ordered by
their register address.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk3066a.dtsi | 48 +++++++++++------------
 arch/arm/boot/dts/rk3xxx.dtsi  | 86 +++++++++++++++++++++---------------------
 2 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 3198394..21b87de 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -40,30 +40,6 @@
 		};
 	};
 
-	timer@20038000 {
-		compatible = "snps,dw-apb-timer-osc";
-		reg = <0x20038000 0x100>;
-		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_TIMER0>, <&cru PCLK_TIMER0>;
-		clock-names = "timer", "pclk";
-	};
-
-	timer@2003a000 {
-		compatible = "snps,dw-apb-timer-osc";
-		reg = <0x2003a000 0x100>;
-		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_TIMER1>, <&cru PCLK_TIMER1>;
-		clock-names = "timer", "pclk";
-	};
-
-	timer@2000e000 {
-		compatible = "snps,dw-apb-timer-osc";
-		reg = <0x2000e000 0x100>;
-		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru SCLK_TIMER2>, <&cru PCLK_TIMER2>;
-		clock-names = "timer", "pclk";
-	};
-
 	sram: sram@10080000 {
 		compatible = "mmio-sram";
 		reg = <0x10080000 0x10000>;
@@ -86,6 +62,30 @@
 		#reset-cells = <1>;
 	};
 
+	timer@2000e000 {
+		compatible = "snps,dw-apb-timer-osc";
+		reg = <0x2000e000 0x100>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER2>, <&cru PCLK_TIMER2>;
+		clock-names = "timer", "pclk";
+	};
+
+	timer@20038000 {
+		compatible = "snps,dw-apb-timer-osc";
+		reg = <0x20038000 0x100>;
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER0>, <&cru PCLK_TIMER0>;
+		clock-names = "timer", "pclk";
+	};
+
+	timer@2003a000 {
+		compatible = "snps,dw-apb-timer-osc";
+		reg = <0x2003a000 0x100>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_TIMER1>, <&cru PCLK_TIMER1>;
+		clock-names = "timer", "pclk";
+	};
+
 	pinctrl: pinctrl {
 		compatible = "rockchip,rk3066a-pinctrl";
 		rockchip,grf = <&grf>;
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 10e7586..ad204da 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -27,29 +27,6 @@
 		clock-output-names = "xin24m";
 	};
 
-	scu@1013c000 {
-		compatible = "arm,cortex-a9-scu";
-		reg = <0x1013c000 0x100>;
-	};
-
-	pmu: pmu@20004000 {
-		compatible = "rockchip,rk3066-pmu", "syscon";
-		reg = <0x20004000 0x100>;
-	};
-
-	grf: grf@20008000 {
-		compatible = "syscon";
-		reg = <0x20008000 0x200>;
-	};
-
-	gic: interrupt-controller@1013d000 {
-		compatible = "arm,cortex-a9-gic";
-		interrupt-controller;
-		#interrupt-cells = <3>;
-		reg = <0x1013d000 0x1000>,
-		      <0x1013c100 0x0100>;
-	};
-
 	L2: l2-cache-controller@10138000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x10138000 0x1000>;
@@ -57,6 +34,11 @@
 		cache-level = <2>;
 	};
 
+	scu@1013c000 {
+		compatible = "arm,cortex-a9-scu";
+		reg = <0x1013c000 0x100>;
+	};
+
 	global_timer: global-timer@1013c200 {
 		compatible = "arm,cortex-a9-global-timer";
 		reg = <0x1013c200 0x20>;
@@ -71,6 +53,14 @@
 		clocks = <&cru CORE_PERI>;
 	};
 
+	gic: interrupt-controller@1013d000 {
+		compatible = "arm,cortex-a9-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x1013d000 0x1000>,
+		      <0x1013c100 0x0100>;
+	};
+
 	uart0: serial@10124000 {
 		compatible = "snps,dw-apb-uart";
 		reg = <0x10124000 0x400>;
@@ -91,26 +81,6 @@
 		status = "disabled";
 	};
 
-	uart2: serial@20064000 {
-		compatible = "snps,dw-apb-uart";
-		reg = <0x20064000 0x400>;
-		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-		reg-shift = <2>;
-		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART2>;
-		status = "disabled";
-	};
-
-	uart3: serial@20068000 {
-		compatible = "snps,dw-apb-uart";
-		reg = <0x20068000 0x400>;
-		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
-		reg-shift = <2>;
-		reg-io-width = <1>;
-		clocks = <&cru SCLK_UART3>;
-		status = "disabled";
-	};
-
 	mmc0: dwmmc@10214000 {
 		compatible = "rockchip,rk2928-dw-mshc";
 		reg = <0x10214000 0x1000>;
@@ -136,4 +106,34 @@
 
 		status = "disabled";
 	};
+
+	pmu: pmu@20004000 {
+		compatible = "rockchip,rk3066-pmu", "syscon";
+		reg = <0x20004000 0x100>;
+	};
+
+	grf: grf@20008000 {
+		compatible = "syscon";
+		reg = <0x20008000 0x200>;
+	};
+
+	uart2: serial@20064000 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0x20064000 0x400>;
+		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <1>;
+		clocks = <&cru SCLK_UART2>;
+		status = "disabled";
+	};
+
+	uart3: serial@20068000 {
+		compatible = "snps,dw-apb-uart";
+		reg = <0x20068000 0x400>;
+		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+		reg-shift = <2>;
+		reg-io-width = <1>;
+		clocks = <&cru SCLK_UART3>;
+		status = "disabled";
+	};
 };
-- 
2.0.1

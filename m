From: <dinguyen@altera.com>
Subject: [PATCH 1/2] ARM: dts: Change dw-apb-timer-osc and dw-apb-timer-sp to
 just dw-apb-timer
Date: Wed, 24 Jul 2013 22:43:16 -0500
Message-ID: <1374723797-22169-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dinh.linux@gmail.com
Cc: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@denx.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@altera.com>

"dw-apb-timer-osc" and "dw-apb-timer-sp" are the same implementation of the
DW APB timer, just fed by different clocks.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
CC: Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>
Cc: Olof Johansson <olof@lixom.net>
CC: Jamie Iles <jamie@jamieiles.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Pavel Machek <pavel@denx.de>
Cc: devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/rtc/dw-apb.txt |   21 +++----------------
 arch/arm/boot/dts/rk3066a.dtsi                   |    6 +++---
 arch/arm/boot/dts/socfpga.dtsi                   |   24 +++++++++++-----------
 arch/arm/boot/dts/socfpga_cyclone5.dts           |    8 ++++----
 arch/arm/boot/dts/socfpga_vt.dts                 |    8 ++++----
 5 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
index eb2327b..0a1020e 100644
--- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
+++ b/Documentation/devicetree/bindings/rtc/dw-apb.txt
@@ -1,7 +1,7 @@
 * Designware APB timer
 
 Required properties:
-- compatible: "snps,dw-apb-timer-sp" or "snps,dw-apb-timer-osc"
+- compatible: "snps,dw-apb-timer"
 - reg: physical base address of the controller and length of memory mapped
   region.
 - interrupts: IRQ line for the timer.
@@ -20,23 +20,8 @@ systems may use one.
 
 
 Example:
-
-		timer1: timer@ffc09000 {
-				compatible = "snps,dw-apb-timer-sp";
-				interrupts = <0 168 4>;
-				clock-frequency = <200000000>;
-				reg = <0xffc09000 0x1000>;
-			};
-
-		timer2: timer@ffd00000 {
-				compatible = "snps,dw-apb-timer-osc";
-				interrupts = <0 169 4>;
-				clock-frequency = <200000000>;
-				reg = <0xffd00000 0x1000>;
-			};
-
-		timer3: timer@ffe00000 {
-				compatible = "snps,dw-apb-timer-osc";
+		timer1: timer@ffe00000 {
+				compatible = "snps,dw-apb-timer";
 				interrupts = <0 170 4>;
 				reg = <0xffe00000 0x1000>;
 				clocks = <&timer_clk>, <&timer_pclk>;
diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 56bfac9..2dff468 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -71,7 +71,7 @@
 		};
 
 		timer@20038000 {
-			compatible = "snps,dw-apb-timer-osc";
+			compatible = "snps,dw-apb-timer";
 			reg = <0x20038000 0x100>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_gates1 0>, <&clk_gates7 7>;
@@ -79,7 +79,7 @@
 		};
 
 		timer@2003a000 {
-			compatible = "snps,dw-apb-timer-osc";
+			compatible = "snps,dw-apb-timer";
 			reg = <0x2003a000 0x100>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_gates1 1>, <&clk_gates7 8>;
@@ -87,7 +87,7 @@
 		};
 
 		timer@2000e000 {
-			compatible = "snps,dw-apb-timer-osc";
+			compatible = "snps,dw-apb-timer";
 			reg = <0x2000e000 0x100>;
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk_gates1 2>, <&clk_gates7 9>;
diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 93ee655..4e8291b 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -26,10 +26,6 @@
 		ethernet1 = &gmac1;
 		serial0 = &uart0;
 		serial1 = &uart1;
-		timer0 = &timer0;
-		timer1 = &timer1;
-		timer2 = &timer2;
-		timer3 = &timer3;
 	};
 
 	cpus {
@@ -486,28 +482,32 @@
 			interrupts = <1 13 0xf04>;
 		};
 
-		timer0: timer0@ffc08000 {
-			compatible = "snps,dw-apb-timer-sp";
+		timer0: timer@ffc08000 {
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 167 4>;
 			reg = <0xffc08000 0x1000>;
+			clocks = <&osc>;
 		};
 
-		timer1: timer1@ffc09000 {
-			compatible = "snps,dw-apb-timer-sp";
+		timer1: timer@ffc09000 {
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 168 4>;
 			reg = <0xffc09000 0x1000>;
+			clocks = <&osc>;
 		};
 
-		timer2: timer2@ffd00000 {
-			compatible = "snps,dw-apb-timer-osc";
+		timer2: timer@ffd00000 {
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 169 4>;
 			reg = <0xffd00000 0x1000>;
+			clocks = <&l4_sp_clk>;
 		};
 
-		timer3: timer3@ffd01000 {
-			compatible = "snps,dw-apb-timer-osc";
+		timer3: timer@ffd01000 {
+			compatible = "snps,dw-apb-timer";
 			interrupts = <0 170 4>;
 			reg = <0xffd01000 0x1000>;
+			clocks = <&l4_sp_clk>;
 		};
 
 		uart0: serial0@ffc02000 {
diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dts b/arch/arm/boot/dts/socfpga_cyclone5.dts
index 102c4d8..54b8483 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5.dts
@@ -67,19 +67,19 @@
 			};
 		};
 
-		timer0@ffc08000 {
+		timer@ffc08000 {
 			clock-frequency = <100000000>;
 		};
 
-		timer1@ffc09000 {
+		timer@ffc09000 {
 			clock-frequency = <100000000>;
 		};
 
-		timer2@ffd00000 {
+		timer@ffd00000 {
 			clock-frequency = <25000000>;
 		};
 
-		timer3@ffd01000 {
+		timer@ffd01000 {
 			clock-frequency = <25000000>;
 		};
 
diff --git a/arch/arm/boot/dts/socfpga_vt.dts b/arch/arm/boot/dts/socfpga_vt.dts
index d93deb0..6a1d8b7 100644
--- a/arch/arm/boot/dts/socfpga_vt.dts
+++ b/arch/arm/boot/dts/socfpga_vt.dts
@@ -58,19 +58,19 @@
 			};
 		};
 
-		timer0@ffc08000 {
+		timer@ffc08000 {
 			clock-frequency = <7000000>;
 		};
 
-		timer1@ffc09000 {
+		timer@ffc09000 {
 			clock-frequency = <7000000>;
 		};
 
-		timer2@ffd00000 {
+		timer@ffd00000 {
 			clock-frequency = <7000000>;
 		};
 
-		timer3@ffd01000 {
+		timer@ffd01000 {
 			clock-frequency = <7000000>;
 		};
 
-- 
1.7.9.5

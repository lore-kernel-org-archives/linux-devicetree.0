From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 5/8] ARM: dts: keystone-clocks: Add missing unit name to clock
 nodes that have regs
Date: Fri, 15 Dec 2017 07:20:59 -0600
Message-ID: <20171215132102.435-6-nm@ti.com>
References: <20171215132102.435-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171215132102.435-1-nm@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the control register as the base for the clock nodes which are
missing them. This squashes some 78 warnings of the effect when built
with W=1.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
 arch/arm/boot/dts/keystone-clocks.dtsi | 52 +++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi b/arch/arm/boot/dts/keystone-clocks.dtsi
index 2391e3e4d234..0d735e0288db 100644
--- a/arch/arm/boot/dts/keystone-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-clocks.dtsi
@@ -48,7 +48,7 @@ clocks {
 		clock-output-names = "gemtraceclk";
 	};
 
-	chipstmxptclk: chipstmxptclk {
+	chipstmxptclk: chipstmxptclk@2310164 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,pll-divider-clock";
 		clocks = <&mainmuxclk>;
@@ -157,7 +157,7 @@ clocks {
 		clock-output-names = "chipclk1rstiso112";
 	};
 
-	clkmodrst0: clkmodrst0 {
+	clkmodrst0: clkmodrst0@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk16>;
@@ -168,7 +168,7 @@ clocks {
 	};
 
 
-	clkusb: clkusb {
+	clkusb: clkusb@2350008 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk16>;
@@ -178,7 +178,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkaemifspi: clkaemifspi {
+	clkaemifspi: clkaemifspi@235000c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk16>;
@@ -189,7 +189,7 @@ clocks {
 	};
 
 
-	clkdebugsstrc: clkdebugsstrc {
+	clkdebugsstrc: clkdebugsstrc@2350014 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -199,7 +199,7 @@ clocks {
 		domain-id = <1>;
 	};
 
-	clktetbtrc: clktetbtrc {
+	clktetbtrc: clktetbtrc@2350018 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -209,7 +209,7 @@ clocks {
 		domain-id = <1>;
 	};
 
-	clkpa: clkpa {
+	clkpa: clkpa@235001c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&paclk13>;
@@ -219,7 +219,7 @@ clocks {
 		domain-id = <2>;
 	};
 
-	clkcpgmac: clkcpgmac {
+	clkcpgmac: clkcpgmac@2350020 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkpa>;
@@ -229,7 +229,7 @@ clocks {
 		domain-id = <2>;
 	};
 
-	clksa: clksa {
+	clksa: clksa@2350024 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkpa>;
@@ -239,7 +239,7 @@ clocks {
 		domain-id = <2>;
 	};
 
-	clkpcie: clkpcie {
+	clkpcie: clkpcie@2350028 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -249,7 +249,7 @@ clocks {
 		domain-id = <3>;
 	};
 
-	clksr: clksr {
+	clksr: clksr@2350034 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1rstiso112>;
@@ -259,7 +259,7 @@ clocks {
 		domain-id = <6>;
 	};
 
-	clkgem0: clkgem0 {
+	clkgem0: clkgem0@235003c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -269,7 +269,7 @@ clocks {
 		domain-id = <8>;
 	};
 
-	clkddr30: clkddr30 {
+	clkddr30: clkddr30@235005c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -279,7 +279,7 @@ clocks {
 		domain-id = <16>;
 	};
 
-	clkwdtimer0: clkwdtimer0 {
+	clkwdtimer0: clkwdtimer0@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -289,7 +289,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkwdtimer1: clkwdtimer1 {
+	clkwdtimer1: clkwdtimer1@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -299,7 +299,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkwdtimer2: clkwdtimer2 {
+	clkwdtimer2: clkwdtimer2@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -309,7 +309,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkwdtimer3: clkwdtimer3 {
+	clkwdtimer3: clkwdtimer3@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -319,7 +319,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clktimer15: clktimer15 {
+	clktimer15: clktimer15@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -329,7 +329,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkuart0: clkuart0 {
+	clkuart0: clkuart0@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -339,7 +339,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkuart1: clkuart1 {
+	clkuart1: clkuart1@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -349,7 +349,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkaemif: clkaemif {
+	clkaemif: clkaemif@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkaemifspi>;
@@ -359,7 +359,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkusim: clkusim {
+	clkusim: clkusim@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -369,7 +369,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clki2c: clki2c {
+	clki2c: clki2c@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -379,7 +379,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkspi: clkspi {
+	clkspi: clkspi@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkaemifspi>;
@@ -389,7 +389,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkgpio: clkgpio {
+	clkgpio: clkgpio@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
@@ -399,7 +399,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkkeymgr: clkkeymgr {
+	clkkeymgr: clkkeymgr@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&clkmodrst0>;
-- 
2.14.1

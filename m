From: <patrice.chotard@st.com>
Subject: [PATCH 3/7] ARM: dts: STi: Move clocks without reg outside soc
Date: Wed, 10 Jan 2018 09:21:03 +0100
Message-ID: <1515572469-19276-4-git-send-email-patrice.chotard@st.com>
References: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: patrice.chotard@st.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Move clocks without reg property outside soc node,
this allows to fix the following warnings when compiling
dtb with W=1 option :

arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clk-sysin missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property

arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clk-sysin missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property
arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property

arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clk-sysin missing or empty reg/ranges property
arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property
arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 106 +++++++++++++++++-----------------
 arch/arm/boot/dts/stih410-clock.dtsi | 103 ++++++++++++++++-----------------
 arch/arm/boot/dts/stih418-clock.dtsi | 107 ++++++++++++++++++-----------------
 3 files changed, 157 insertions(+), 159 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index b882dcf..6df63b2 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -7,33 +7,65 @@
  */
 #include <dt-bindings/clock/stih407-clks.h>
 / {
+	/*
+	 * Fixed 30MHz oscillator inputs to SoC
+	 */
+	clk_sysin: clk-sysin {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <30000000>;
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	arm_periph_clk: clk-m-a9-periphs {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+
+		clocks = <&clk_m_a9>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+
+		clocks = <&clk_s_c0_flexgen 13>;
+
+		clock-output-names = "clk-m-a9-ext2f-div2";
+
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * Bootloader initialized system infrastructure clock for
+	 * serial devices.
+	 */
+	clk_ext2f_a9: clockgen-c0 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <200000000>;
+		clock-output-names = "clk-s-icn-reg-0";
+	};
+
+	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
 
 		/*
-		 * Fixed 30MHz oscillator inputs to SoC
-		 */
-		clk_sysin: clk-sysin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <30000000>;
-		};
-
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		arm_periph_clk: clk-m-a9-periphs {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-
-			clocks = <&clk_m_a9>;
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
 		 * A9 PLL.
 		 */
 		clockgen-a9@92b0000 {
@@ -64,32 +96,6 @@
 				 <&clk_m_a9_ext2f_div2>;
 		};
 
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-
-			clocks = <&clk_s_c0_flexgen 13>;
-
-			clock-output-names = "clk-m-a9-ext2f-div2";
-
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
-		 * Bootloader initialized system infrastructure clock for
-		 * serial devices.
-		 */
-		clk_ext2f_a9: clockgen-c0 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-			clock-output-names = "clk-s-icn-reg-0";
-		};
-
 		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
@@ -254,12 +260,6 @@
 					     "clk-s-d2-fs0-ch3";
 		};
 
-		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
 		clockgen-d2@9106000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9106000 0x1000>;
diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index 4df1b21..ee30dba 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -7,6 +7,56 @@
  */
 #include <dt-bindings/clock/stih410-clks.h>
 / {
+	/*
+	 * Fixed 30MHz oscillator inputs to SoC
+	 */
+	clk_sysin: clk-sysin {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <30000000>;
+		clock-output-names = "CLK_SYSIN";
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	arm_periph_clk: clk-m-a9-periphs {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&clk_m_a9>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&clk_s_c0_flexgen 13>;
+		clock-output-names = "clk-m-a9-ext2f-div2";
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * Bootloader initialized system infrastructure clock for
+	 * serial devices.
+	 */
+	clk_ext2f_a9: clockgen-c0 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <200000000>;
+		clock-output-names = "clk-s-icn-reg-0";
+	};
+
+	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -15,27 +65,6 @@
 		compatible = "st,stih410-clk", "simple-bus";
 
 		/*
-		 * Fixed 30MHz oscillator inputs to SoC
-		 */
-		clk_sysin: clk-sysin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <30000000>;
-			clock-output-names = "CLK_SYSIN";
-		};
-
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		arm_periph_clk: clk-m-a9-periphs {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&clk_m_a9>;
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
 		 * A9 PLL.
 		 */
 		clockgen-a9@92b0000 {
@@ -66,32 +95,6 @@
 				 <&clk_m_a9_ext2f_div2>;
 		};
 
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-
-			clocks = <&clk_s_c0_flexgen 13>;
-
-			clock-output-names = "clk-m-a9-ext2f-div2";
-
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
-		 * Bootloader initialized system infrastructure clock for
-		 * serial devices.
-		 */
-		clk_ext2f_a9: clockgen-c0 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-			clock-output-names = "clk-s-icn-reg-0";
-		};
-
 		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
@@ -266,12 +269,6 @@
 					     "clk-s-d2-fs0-ch3";
 		};
 
-		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
 		clockgen-d2@9106000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9106000 0x1000>;
diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index e68bf28..fe5f0fd 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -7,6 +7,60 @@
  */
 #include <dt-bindings/clock/stih418-clks.h>
 / {
+	/*
+	 * Fixed 30MHz oscillator inputs to SoC
+	 */
+	clk_sysin: clk-sysin {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <30000000>;
+		clock-output-names = "CLK_SYSIN";
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	arm_periph_clk: clk-m-a9-periphs {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&clk_m_a9>;
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * ARM Peripheral clock for timers
+	 */
+	clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+
+		clocks = <&clk_s_c0_flexgen 13>;
+
+		clock-output-names = "clk-m-a9-ext2f-div2";
+
+		clock-div = <2>;
+		clock-mult = <1>;
+	};
+
+	/*
+	 * Bootloader initialized system infrastructure clock for
+	 * serial devices.
+	 */
+	clk_ext2f_a9: clockgen-c0 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+
+		clock-frequency = <200000000>;
+		clock-output-names = "clk-s-icn-reg-0";
+	};
+
+	clk_tmdsout_hdmi: clk-tmdsout-hdmi {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+	};
+
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -15,27 +69,6 @@
 		compatible = "st,stih418-clk", "simple-bus";
 
 		/*
-		 * Fixed 30MHz oscillator inputs to SoC
-		 */
-		clk_sysin: clk-sysin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <30000000>;
-			clock-output-names = "CLK_SYSIN";
-		};
-
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		arm_periph_clk: clk-m-a9-periphs {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-			clocks = <&clk_m_a9>;
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
 		 * A9 PLL.
 		 */
 		clockgen-a9@92b0000 {
@@ -66,32 +99,6 @@
 				 <&clk_m_a9_ext2f_div2>;
 		};
 
-		/*
-		 * ARM Peripheral clock for timers
-		 */
-		clk_m_a9_ext2f_div2: clk-m-a9-ext2f-div2s {
-			#clock-cells = <0>;
-			compatible = "fixed-factor-clock";
-
-			clocks = <&clk_s_c0_flexgen 13>;
-
-			clock-output-names = "clk-m-a9-ext2f-div2";
-
-			clock-div = <2>;
-			clock-mult = <1>;
-		};
-
-		/*
-		 * Bootloader initialized system infrastructure clock for
-		 * serial devices.
-		 */
-		clk_ext2f_a9: clockgen-c0 {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <200000000>;
-			clock-output-names = "clk-s-icn-reg-0";
-		};
-
 		clockgen-a@90ff000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x90ff000 0x1000>;
@@ -259,12 +266,6 @@
 					     "clk-s-d2-fs0-ch3";
 		};
 
-		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
 		clockgen-d2@9106000 {
 			compatible = "st,clkgen-c32";
 			reg = <0x9106000 0x1000>;
-- 
1.9.1

From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] ARM: dts: socfpga: add timer resets for SoCFPGA platform
Date: Mon, 17 Sep 2018 10:10:29 -0500
Message-ID: <1537197029-27693-1-git-send-email-dinguyen@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the resets property for all the timers on the Cyclone5/Arria5/Arria10
platforms.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga.dtsi         | 8 ++++++++
 arch/arm/boot/dts/socfpga_arria10.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index b38f8c2..fa33cd1 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -841,6 +841,8 @@
 			reg = <0xffc08000 0x1000>;
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
+			resets = <&rst SPTIMER0_RESET>;
+			reset-names = "timer";
 		};
 
 		timer1: timer1@ffc09000 {
@@ -849,6 +851,8 @@
 			reg = <0xffc09000 0x1000>;
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
+			resets = <&rst SPTIMER1_RESET>;
+			reset-names = "timer";
 		};
 
 		timer2: timer2@ffd00000 {
@@ -857,6 +861,8 @@
 			reg = <0xffd00000 0x1000>;
 			clocks = <&osc1>;
 			clock-names = "timer";
+			resets = <&rst OSC1TIMER0_RESET>;
+			reset-names = "timer";
 		};
 
 		timer3: timer3@ffd01000 {
@@ -865,6 +871,8 @@
 			reg = <0xffd01000 0x1000>;
 			clocks = <&osc1>;
 			clock-names = "timer";
+			resets = <&rst OSC1TIMER1_RESET>;
+			reset-names = "timer";
 		};
 
 		uart0: serial0@ffc02000 {
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index a4dcb68..c84c5b8 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -770,6 +770,8 @@
 			reg = <0xffc02700 0x100>;
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
+			resets = <&rst SPTIMER0_RESET>;
+			reset-names = "timer";
 		};
 
 		timer1: timer1@ffc02800 {
@@ -778,6 +780,8 @@
 			reg = <0xffc02800 0x100>;
 			clocks = <&l4_sp_clk>;
 			clock-names = "timer";
+			resets = <&rst SPTIMER1_RESET>;
+			reset-names = "timer";
 		};
 
 		timer2: timer2@ffd00000 {
@@ -786,6 +790,8 @@
 			reg = <0xffd00000 0x100>;
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
+			resets = <&rst L4SYSTIMER0_RESET>;
+			reset-names = "timer";
 		};
 
 		timer3: timer3@ffd00100 {
@@ -794,6 +800,8 @@
 			reg = <0xffd01000 0x100>;
 			clocks = <&l4_sys_free_clk>;
 			clock-names = "timer";
+			resets = <&rst L4SYSTIMER1_RESET>;
+			reset-names = "timer";
 		};
 
 		uart0: serial0@ffc02000 {
-- 
2.7.4

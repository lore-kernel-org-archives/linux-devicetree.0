From: Chao Xie <chao.xie@marvell.com>
Subject: [PATCH 3/4] arm: mmp: make SOCes with DT use new timer driver
Date: Mon, 2 Feb 2015 16:31:38 +0800
Message-ID: <1422865899-8152-4-git-send-email-chao.xie@marvell.com>
References: <1422865899-8152-1-git-send-email-chao.xie@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422865899-8152-1-git-send-email-chao.xie@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, chao.xie@marvell.com, haojian.zhuang@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chao Xie <chao.xie@marvell.com>

Change the dtsi and DT support for mmp SOCes to make them
use the new timer driver.

Signed-off-by: Chao Xie <chao.xie@marvell.com>
---
 arch/arm/boot/dts/mmp2.dtsi   | 19 ++++++++++++++++---
 arch/arm/boot/dts/pxa168.dtsi | 20 +++++++++++++++++---
 arch/arm/boot/dts/pxa910.dtsi | 26 ++++++++++++++++----------
 arch/arm/mach-mmp/Kconfig     |  2 ++
 arch/arm/mach-mmp/mmp-dt.c    |  4 +++-
 arch/arm/mach-mmp/mmp2-dt.c   |  4 +++-
 6 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 766bbb8..e63e3a3 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -127,9 +127,22 @@
 			ranges;
 
 			timer0: timer@d4014000 {
-				compatible = "mrvl,mmp-timer";
-				reg = <0xd4014000 0x100>;
-				interrupts = <13>;
+				compatible = "marvell,mmp-timer";
+				reg = <0xd4014000 0xc8>;
+				clocks = <&soc_clocks MMP2_CLK_VCTCXO>, <&soc_clocks MMP2_CLK_TIMER>;
+				status = "okay";
+
+				counter0 {
+					compatible = "marvell,timer-counter-clkevt";
+					interrupts = <13>;
+					marvell,timer-counter-id = <0>;
+					marvell,timer-counter-cpu = <0>;
+                                };
+
+                                counter1 {
+					compatible = "marvell,timer-counter-clksrc";
+					marvell,timer-counter-id = <1>;
+                                };
 			};
 
 			uart1: uart@d4030000 {
diff --git a/arch/arm/boot/dts/pxa168.dtsi b/arch/arm/boot/dts/pxa168.dtsi
index b899e25..5a2f385 100644
--- a/arch/arm/boot/dts/pxa168.dtsi
+++ b/arch/arm/boot/dts/pxa168.dtsi
@@ -51,9 +51,23 @@
 			ranges;
 
 			timer0: timer@d4014000 {
-				compatible = "mrvl,mmp-timer";
-				reg = <0xd4014000 0x100>;
-				interrupts = <13>;
+				compatible = "marvell,mmp-timer";
+				reg = <0xd4014000 0xc8>;
+				clocks = <&soc_clocks PXA168_CLK_PLL1_24>, <&soc_clocks PXA168_CLK_TIMER>;
+				status = "okay";
+
+				counter0 {
+					compatible = "marvell,timer-counter-clkevt";
+					interrupts = <13>;
+					marvell,timer-counter-id = <0>;
+					marvell,timer-counter-cpu = <0>;
+                                };
+
+                                counter1 {
+					compatible = "marvell,timer-counter-clksrc";
+					marvell,timer-counter-id = <1>;
+                                };
+
 			};
 
 			uart1: uart@d4017000 {
diff --git a/arch/arm/boot/dts/pxa910.dtsi b/arch/arm/boot/dts/pxa910.dtsi
index 0868f67..beb25fc 100644
--- a/arch/arm/boot/dts/pxa910.dtsi
+++ b/arch/arm/boot/dts/pxa910.dtsi
@@ -56,16 +56,22 @@
 			ranges;
 
 			timer0: timer@d4014000 {
-				compatible = "mrvl,mmp-timer";
-				reg = <0xd4014000 0x100>;
-				interrupts = <13>;
-			};
-
-			timer1: timer@d4016000 {
-				compatible = "mrvl,mmp-timer";
-				reg = <0xd4016000 0x100>;
-				interrupts = <29>;
-				status = "disabled";
+				compatible = "marvell,mmp-timer";
+				reg = <0xd4014000 0xc8>;
+				clocks = <&soc_clocks PXA910_CLK_PLL1_24>, <&soc_clocks PXA910_CLK_TIMER0>;
+				status = "okay";
+
+				counter0 {
+					compatible = "marvell,timer-counter-clkevt";
+					interrupts = <13>;
+					marvell,timer-counter-id = <0>;
+					marvell,timer-counter-cpu = <0>;
+                                };
+
+                                counter1 {
+					compatible = "marvell,timer-counter-clksrc";
+					marvell,timer-counter-id = <1>;
+                                };
 			};
 
 			uart1: uart@d4017000 {
diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index fdbfadf..4bbe202 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -87,6 +87,7 @@ config MACH_GPLUGD
 config MACH_MMP_DT
 	bool "Support MMP (ARMv5) platforms from device tree"
 	select USE_OF
+	select CLKSRC_OF
 	select PINCTRL
 	select PINCTRL_SINGLE
 	select COMMON_CLK
@@ -101,6 +102,7 @@ config MACH_MMP2_DT
 	bool "Support MMP2 (ARMv7) platforms from device tree"
 	depends on !CPU_MOHAWK
 	select USE_OF
+	select CLKSRC_OF
 	select PINCTRL
 	select PINCTRL_SINGLE
 	select COMMON_CLK
diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
index b2296c9..2e91871 100644
--- a/arch/arm/mach-mmp/mmp-dt.c
+++ b/arch/arm/mach-mmp/mmp-dt.c
@@ -12,6 +12,7 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
@@ -35,8 +36,9 @@ static void __init mmp_init_time(void)
 #ifdef CONFIG_CACHE_TAUROS2
 	tauros2_init(0);
 #endif
-	mmp_dt_init_timer();
 	of_clk_init(NULL);
+	/* Initialize timers. */
+	clocksource_of_init();
 }
 
 DT_MACHINE_START(PXA168_DT, "Marvell PXA168 (Device Tree Support)")
diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
index 998c0f5..a42d32e 100644
--- a/arch/arm/mach-mmp/mmp2-dt.c
+++ b/arch/arm/mach-mmp/mmp2-dt.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/clk-provider.h>
+#include <linux/clocksource.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 #include <asm/hardware/cache-tauros2.h>
@@ -26,8 +27,9 @@ static void __init mmp_init_time(void)
 #ifdef CONFIG_CACHE_TAUROS2
 	tauros2_init(0);
 #endif
-	mmp_dt_init_timer();
 	of_clk_init(NULL);
+	/* Initialize timers. */
+	clocksource_of_init();
 }
 
 static const char *mmp2_dt_board_compat[] __initdata = {
-- 
1.8.3.2

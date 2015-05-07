From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/4] ARM64: juno: add sp810 support and fix sp804 clock frequency
Date: Thu,  7 May 2015 15:45:02 +0100
Message-ID: <1431009905-29265-2-git-send-email-sudeep.holla@arm.com>
References: <1431009905-29265-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431009905-29265-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

The clock generator in IOFPGA generates the two source clocks: 32kHz and
1MHz for the SP810 System Controller.

The SP810 System Controller selects 32kHz or 1MHz as the sources for
TIM_CLK[3:0], the SP804 timer clocks. The powerup default is 32kHz but
the maximum of "refclk" and "timclk" is chosen by the SP810 driver.

This patch adds support for SP810 system controller and also fixes the
SP804 timer clock frequency.

However the SP804 driver needs to be enabled on ARM64 to test this,
which requires SP804 driver to be moved out of arch/arm.

Fixes: 71f867ec130e ("arm64: Add Juno board device tree.")
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index c138b95a8356..351c95bda89e 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -21,6 +21,20 @@
 			clock-output-names = "juno_mb:clk25mhz";
 		};
 
+		v2m_refclk1mhz: refclk1mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1000000>;
+			clock-output-names = "juno_mb:refclk1mhz";
+		};
+
+		v2m_refclk32khz: refclk32khz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "juno_mb:refclk32khz";
+		};
+
 		motherboard {
 			compatible = "arm,vexpress,v2p-p1", "simple-bus";
 			#address-cells = <2>;  /* SMB chipselect number and offset */
@@ -66,6 +80,15 @@
 				#size-cells = <1>;
 				ranges = <0 3 0 0x200000>;
 
+				v2m_sysctl: sysctl@020000 {
+					compatible = "arm,sp810", "arm,primecell";
+					reg = <0x020000 0x1000>;
+					clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&mb_clk24mhz>;
+					clock-names = "refclk", "timclk", "apb_pclk";
+					#clock-cells = <1>;
+					clock-output-names = "timerclken0", "timerclken1", "timerclken2", "timerclken3";
+				};
+
 				mmci@050000 {
 					compatible = "arm,pl180", "arm,primecell";
 					reg = <0x050000 0x1000>;
@@ -106,16 +129,16 @@
 					compatible = "arm,sp804", "arm,primecell";
 					reg = <0x110000 0x10000>;
 					interrupts = <9>;
-					clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
-					clock-names = "timclken1", "apb_pclk";
+					clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&mb_clk24mhz>;
+					clock-names = "timclken1", "timclken2", "apb_pclk";
 				};
 
 				v2m_timer23: timer@120000 {
 					compatible = "arm,sp804", "arm,primecell";
 					reg = <0x120000 0x10000>;
 					interrupts = <9>;
-					clocks = <&mb_clk24mhz>, <&soc_smc50mhz>;
-					clock-names = "timclken1", "apb_pclk";
+					clocks = <&v2m_sysctl 2>, <&v2m_sysctl 3>, <&mb_clk24mhz>;
+					clock-names = "timclken1", "timclken2", "apb_pclk";
 				};
 
 				rtc@170000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

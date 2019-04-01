From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v3 1/1] ARM: dts: sun8i: a83t: Add missing CPU
 clock references
Date: Mon,  1 Apr 2019 15:36:10 +0200
Message-ID: <20190401133610.17916-2-megous@megous.com>
References: <20190401133610.17916-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBTNHRDSQKGQEOED4UII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190401133610.17916-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

A83T DTSI has cpu clocks defined only on the first CPU in each cluster.
We can bring down any CPU in the cluster, so we need to define clock
for each CPU, so that the system knows what clock to use if the first
CPU is down.

Also move the clocks property below the compatible on cpus where it is
already defined. Property "clock-names" is not needed.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 7a40b7d77ec0..b241058dc6b0 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -61,10 +61,9 @@
 		#size-cells = <0>;
 
 		cpu0: cpu@0 {
-			clocks = <&ccu CLK_C0CPUX>;
-			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C0CPUX>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -75,6 +74,7 @@
 		cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C0CPUX>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -85,6 +85,7 @@
 		cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C0CPUX>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -95,6 +96,7 @@
 		cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C0CPUX>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -103,10 +105,9 @@
 		};
 
 		cpu100: cpu@100 {
-			clocks = <&ccu CLK_C1CPUX>;
-			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C1CPUX>;
 			operating-points-v2 = <&cpu1_opp_table>;
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -117,6 +118,7 @@
 		cpu@101 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C1CPUX>;
 			operating-points-v2 = <&cpu1_opp_table>;
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -127,6 +129,7 @@
 		cpu@102 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C1CPUX>;
 			operating-points-v2 = <&cpu1_opp_table>;
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
@@ -137,6 +140,7 @@
 		cpu@103 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			clocks = <&ccu CLK_C1CPUX>;
 			operating-points-v2 = <&cpu1_opp_table>;
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
-- 
2.21.0

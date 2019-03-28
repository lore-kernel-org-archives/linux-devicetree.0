From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: sun8i: a83t: Add missing CPU
 clock references
Date: Thu, 28 Mar 2019 12:31:59 +0100
Message-ID: <20190328113159.9668-3-megous@megous.com>
References: <20190328113159.9668-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBOPB6LSAKGQEIMYKMAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190328113159.9668-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
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

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 7a40b7d77ec0..1b0b025b9250 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -73,6 +73,8 @@
 		};
 
 		cpu@1 {
+			clocks = <&ccu CLK_C0CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
@@ -83,6 +85,8 @@
 		};
 
 		cpu@2 {
+			clocks = <&ccu CLK_C0CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
@@ -93,6 +97,8 @@
 		};
 
 		cpu@3 {
+			clocks = <&ccu CLK_C0CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
@@ -115,6 +121,8 @@
 		};
 
 		cpu@101 {
+			clocks = <&ccu CLK_C1CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu1_opp_table>;
@@ -125,6 +133,8 @@
 		};
 
 		cpu@102 {
+			clocks = <&ccu CLK_C1CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu1_opp_table>;
@@ -135,6 +145,8 @@
 		};
 
 		cpu@103 {
+			clocks = <&ccu CLK_C1CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			operating-points-v2 = <&cpu1_opp_table>;
-- 
2.21.0

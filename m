From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx7d: move CPU operating points to imx7d.dtsi
Date: Thu, 11 Aug 2016 17:11:06 -0700
Message-ID: <20160812001107.17016-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Only i.MX 7Dual SoC supports CPU frequencies of up to 1GHz. The i.MX
7Solo can run with up to 800MHz and does so without making use of DVFS
usually. While the device tree clearly specified a too fast operating
point for i.MX 7Solo, the kernel did not used it in practise so far
because the CPUfreq driver does not get loaded on i.MX 7Solo devices
(since the fsl,imx7s compatible string is not in the list of devices
making use of the cpufreq-dt driver...).

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
Hi Shawn,

This is based on my earlier patchset:
ARM: dts: imx7d: move ARM platform peripherals inside soc

This are kind of fixes too, so if possible I would like to see them
in v4.8, what do you think?

--
Stefan

 arch/arm/boot/dts/imx7d.dtsi | 8 ++++++++
 arch/arm/boot/dts/imx7s.dtsi | 5 -----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 3d77d95..d0b199c 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -45,6 +45,14 @@
 
 / {
 	cpus {
+		cpu0: cpu@0 {
+			operating-points = <
+				/* KHz	uV */
+				996000	1075000
+				792000	975000
+			>;
+		};
+
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c63591c..5132e2f 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -85,11 +85,6 @@
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
-			operating-points = <
-				/* KHz	uV */
-				996000	1075000
-				792000	975000
-			>;
 			clock-latency = <61036>; /* two CLK32 periods */
 			clocks = <&clks IMX7D_CLK_ARM>;
 		};
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

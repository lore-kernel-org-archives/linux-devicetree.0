From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v4] ARM: dts: r8a7794: Add SMP support
Date: Tue, 28 Nov 2017 14:39:01 +0100
Message-ID: <1511876341-8639-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

Add the device tree node for the Advanced Power Management Unit (APMU).
Use the "enable-method" prop to  point out that the APMU should be used
for the SMP support.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Dependency 3fd45a136ff61bb5 ("ARM: shmobile: rcar-gen2: Make sure
CNTVOFF is initialized on CA7/15") is part of v4.15-rc1.

v4:
  - Rebased against renesas-devel-20171127-v4.15-rc1,

v3:
  - No changes,

v2:
  - No changes.
---
 arch/arm/boot/dts/r8a7794.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index ef7fb1d2c3a31a6e..2437598ca2f5b034 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -37,6 +37,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "renesas,apmu";
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -66,6 +67,12 @@
 		};
 	};
 
+	apmu@e6151000 {
+		compatible = "renesas,r8a7794-apmu", "renesas,apmu";
+		reg = <0 0xe6151000 0 0x188>;
+		cpus = <&cpu0 &cpu1>;
+	};
+
 	gic: interrupt-controller@f1001000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

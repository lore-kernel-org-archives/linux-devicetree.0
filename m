From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 10/23] ARM: dts: ape6evm: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:10:01 +0200
Message-ID: <1463728214-13838-11-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /regulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/r8a73a4-ape6evm.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/r8a73a4-ape6evm.dts b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
index 93ace33e3e361af0..740e5d23f7c70843 100644
--- a/arch/arm/boot/dts/r8a73a4-ape6evm.dts
+++ b/arch/arm/boot/dts/r8a73a4-ape6evm.dts
@@ -36,7 +36,7 @@
 		reg = <2 0x00000000 0 0x40000000>;
 	};
 
-	vcc_mmc0: regulator@0 {
+	vcc_mmc0: regulator-mmc0 {
 		compatible = "regulator-fixed";
 		regulator-name = "MMC0 Vcc";
 		regulator-min-microvolt = <2800000>;
@@ -44,7 +44,7 @@
 		regulator-always-on;
 	};
 
-	vcc_sdhi0: regulator@1 {
+	vcc_sdhi0: regulator-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -56,7 +56,7 @@
 	};
 
 	/* Common 1.8V and 3.3V rails, used by several devices on APE6EVM */
-	ape6evm_fixed_1v8: regulator@2 {
+	ape6evm_fixed_1v8: regulator-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "1V8";
 		regulator-min-microvolt = <1800000>;
@@ -64,7 +64,7 @@
 		regulator-always-on;
 	};
 
-	ape6evm_fixed_3v3: regulator@3 {
+	ape6evm_fixed_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3V3";
 		regulator-min-microvolt = <3300000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

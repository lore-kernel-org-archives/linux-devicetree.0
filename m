From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 12/12] ARM: dts: STi: Remove unused clk_ext2f_a9 clock
Date: Mon, 12 Feb 2018 15:43:10 +0100
Message-ID: <1518446590-16800-13-git-send-email-patrice.chotard@st.com>
References: <1518446590-16800-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518446590-16800-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patrice.chotard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

This clock node is unused, remove it.
This allows to fix the following warnings when compiling
dtb with W=1 option :

arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property

arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property

arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
Node /clocks/clockgen-c0 missing or empty reg/ranges property

Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
---

v2: _ remove clk_ext2f_a9 node


 arch/arm/boot/dts/stih407-clock.dtsi | 11 -----------
 arch/arm/boot/dts/stih410-clock.dtsi | 11 -----------
 arch/arm/boot/dts/stih418-clock.dtsi | 11 -----------
 3 files changed, 33 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index f4e21e2234c9..d63d5e83e1ce 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -81,17 +81,6 @@
 			clock-mult = <1>;
 		};
 
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
diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index 9481f8769e8a..c061b67e09d2 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -83,17 +83,6 @@
 			clock-mult = <1>;
 		};
 
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
diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index 9e3790198f51..14cdeb5d1599 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -83,17 +83,6 @@
 			clock-mult = <1>;
 		};
 
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
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

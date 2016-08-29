From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v3 03/14] ARM: DT: STiH4xx: Simplify clock binding of STiH4xx platforms
Date: Mon, 29 Aug 2016 14:26:55 +0200
Message-ID: <1472473626-15398-4-git-send-email-gabriel.fernandez@st.com>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472473626-15398-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, gabriel.fernandez-qxv4g6HH51o@public.gmane.org, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch simplifies the clock binding because we had too much detail.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 18 +++++++++---------
 arch/arm/boot/dts/stih410-clock.dtsi | 16 ++++++++--------
 arch/arm/boot/dts/stih418-clock.dtsi | 16 ++++++++--------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index ad45f5e..38a56d7 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -42,7 +42,7 @@
 
 			clockgen_a9_pll: clockgen-a9-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a9", "st,clkgen-plls-c32";
+				compatible = "st,stih407-clkgen-plla9";
 
 				clocks = <&clk_sysin>;
 
@@ -55,7 +55,7 @@
 		 */
 		clk_m_a9: clk-m-a9@92b0000 {
 			#clock-cells = <0>;
-			compatible = "st,stih407-clkgen-a9-mux", "st,clkgen-mux";
+			compatible = "st,stih407-clkgen-a9-mux";
 			reg = <0x92b0000 0x10000>;
 
 			clocks = <&clockgen_a9_pll 0>,
@@ -96,7 +96,7 @@
 
 			clk_s_a0_pll: clk-s-a0-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -117,7 +117,7 @@
 
 		clk_s_c0_quadfs: clk-s-c0-quadfs@9103000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-C", "st,quadfs";
+			compatible = "st,quadfs-pll";
 			reg = <0x9103000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -134,7 +134,7 @@
 
 			clk_s_c0_pll0: clk-s-c0-pll0 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -143,7 +143,7 @@
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_1", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll1";
 
 				clocks = <&clk_sysin>;
 
@@ -199,7 +199,7 @@
 
 		clk_s_d0_quadfs: clk-s-d0-quadfs@9104000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9104000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -233,7 +233,7 @@
 
 		clk_s_d2_quadfs: clk-s-d2-quadfs@9106000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9106000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -287,7 +287,7 @@
 
 		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9107000 0x1000>;
 
 			clocks = <&clk_sysin>;
diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index fd50496..e8f4d44 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -44,7 +44,7 @@
 
 			clockgen_a9_pll: clockgen-a9-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a9", "st,clkgen-plls-c32";
+				compatible = "st,stih407-clkgen-plla9";
 
 				clocks = <&clk_sysin>;
 
@@ -98,7 +98,7 @@
 
 			clk_s_a0_pll: clk-s-a0-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -122,7 +122,7 @@
 
 		clk_s_c0_quadfs: clk-s-c0-quadfs@9103000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-C", "st,quadfs";
+			compatible = "st,quadfs-pll";
 			reg = <0x9103000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -140,7 +140,7 @@
 
 			clk_s_c0_pll0: clk-s-c0-pll0 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -150,7 +150,7 @@
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_1", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll1";
 
 				clocks = <&clk_sysin>;
 
@@ -218,7 +218,7 @@
 
 		clk_s_d0_quadfs: clk-s-d0-quadfs@9104000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9104000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -254,7 +254,7 @@
 
 		clk_s_d2_quadfs: clk-s-d2-quadfs@9106000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9106000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -308,7 +308,7 @@
 
 		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9107000 0x1000>;
 
 			clocks = <&clk_sysin>;
diff --git a/arch/arm/boot/dts/stih418-clock.dtsi b/arch/arm/boot/dts/stih418-clock.dtsi
index ae6d997..0fd0fa5 100644
--- a/arch/arm/boot/dts/stih418-clock.dtsi
+++ b/arch/arm/boot/dts/stih418-clock.dtsi
@@ -44,7 +44,7 @@
 
 			clockgen_a9_pll: clockgen-a9-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih418-plls-c28-a9", "st,clkgen-plls-c32";
+				compatible = "st,stih418-clkgen-plla9";
 
 				clocks = <&clk_sysin>;
 
@@ -98,7 +98,7 @@
 
 			clk_s_a0_pll: clk-s-a0-pll {
 				#clock-cells = <1>;
-				compatible = "st,stih407-plls-c32-a0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -120,7 +120,7 @@
 
 		clk_s_c0_quadfs: clk-s-c0-quadfs@9103000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-C", "st,quadfs";
+			compatible = "st,quadfs-pll";
 			reg = <0x9103000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -137,7 +137,7 @@
 
 			clk_s_c0_pll0: clk-s-c0-pll0 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_0", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll0";
 
 				clocks = <&clk_sysin>;
 
@@ -146,7 +146,7 @@
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
 				#clock-cells = <1>;
-				compatible = "st,plls-c32-cx_1", "st,clkgen-plls-c32";
+				compatible = "st,clkgen-pll1";
 
 				clocks = <&clk_sysin>;
 
@@ -212,7 +212,7 @@
 
 		clk_s_d0_quadfs: clk-s-d0-quadfs@9104000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9104000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -248,7 +248,7 @@
 
 		clk_s_d2_quadfs: clk-s-d2-quadfs@9106000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9106000 0x1000>;
 
 			clocks = <&clk_sysin>;
@@ -309,7 +309,7 @@
 
 		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
 			#clock-cells = <1>;
-			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			compatible = "st,quadfs";
 			reg = <0x9107000 0x1000>;
 
 			clocks = <&clk_sysin>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

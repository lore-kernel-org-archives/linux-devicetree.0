From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM64: dts: amlogic: use generic bus node names
Date: Wed,  6 Dec 2017 11:30:05 -0800
Message-ID: <20171206193005.24171-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT spec recommends that node-names have generic names like "bus".
Fix that in the Amlogic DTs, while leaving the label names to have more
SoC-specific names that match with the HW documentation.

Suggested-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b932a784b02a..e7213eb53958 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -113,7 +113,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		cbus: cbus@ffd00000 {
+		cbus: bus@ffd00000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xffd00000 0x0 0x25000>;
 			#address-cells = <2>;
@@ -175,7 +175,7 @@
 			};
 		};
 
-		aobus: aobus@ff800000 {
+		aobus: bus@ff800000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff800000 0x0 0x100000>;
 			#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 7cdbf58a062f..6cb3c2a52baf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -211,7 +211,7 @@
 		#size-cells = <2>;
 		ranges;
 
-		cbus: cbus@c1100000 {
+		cbus: bus@c1100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc1100000 0x0 0x100000>;
 			#address-cells = <2>;
@@ -366,7 +366,7 @@
 			};
 		};
 
-		aobus: aobus@c8100000 {
+		aobus: bus@c8100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8100000 0x0 0x100000>;
 			#address-cells = <2>;
@@ -453,7 +453,7 @@
 			};
 		};
 
-		hiubus: hiubus@c883c000 {
+		hiubus: bus@c883c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc883c000 0x0 0x2000>;
 			#address-cells = <2>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

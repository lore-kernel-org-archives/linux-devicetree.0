From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 07/12] arm: dts: mt6323: move node mt6323 leds to
 mt6323.dtsi
Date: Wed, 11 Apr 2018 16:54:00 +0800
Message-ID: <d6a553c1d01596d7317520c6121eeef9b2741d62.1523434758.git.sean.wang@mediatek.com>
References: <cover.1523434757.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1523434757.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Since those LEDs are parts of PMIC MT6323, it is reasonable to merge
those LEDs node definition back into mt6323.dtsi. This way can improve
the reusability of those nodes among different boards with the same PMIC.

And LED is very much board specific and thus the mt6323.dtsi only includes
the parent node here and leave these child nodes in the board specific
dts file.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/mt6323.dtsi                 |  9 ++++-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 50 ++++++++++++---------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/mt6323.dtsi b/arch/arm/boot/dts/mt6323.dtsi
index 958980c..ba39740 100644
--- a/arch/arm/boot/dts/mt6323.dtsi
+++ b/arch/arm/boot/dts/mt6323.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2017 MediaTek Inc.
+ * Copyright (c) 2017-2018 MediaTek Inc.
  * Author: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
  *	   Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
  *
@@ -14,6 +14,13 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		mt6323_leds: leds {
+			compatible = "mediatek,mt6323-led";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mt6323regulator: mt6323regulator{
 			compatible = "mediatek,mt6323-regulator";
 
diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 1fd6f55..395912e 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -237,6 +237,28 @@
 	vqmmc-supply = <&reg_3p3v>;
 };
 
+&mt6323_leds {
+	status = "okay";
+
+	led@0 {
+		reg = <0>;
+		label = "bpi-r2:isink:green";
+		default-state = "off";
+	};
+
+	led@1 {
+		reg = <1>;
+		label = "bpi-r2:isink:red";
+		default-state = "off";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "bpi-r2:isink:blue";
+		default-state = "off";
+	};
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_default>;
@@ -482,34 +504,6 @@
 	status = "okay";
 };
 
-&pwrap {
-	mt6323 {
-		mt6323led: led {
-			compatible = "mediatek,mt6323-led";
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				label = "bpi-r2:isink:green";
-				default-state = "off";
-			};
-
-			led@1 {
-				reg = <1>;
-				label = "bpi-r2:isink:red";
-				default-state = "off";
-			};
-
-			led@2 {
-				reg = <2>;
-				label = "bpi-r2:isink:blue";
-				default-state = "off";
-			};
-		};
-	};
-};
-
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins_a>;
-- 
2.7.4

From: Alexander Kurz <akurz@blala.de>
Subject: [PATCH 1/3] ARM: dts: imx6 wandboard and riotboard: remove regulators
 bus node
Date: Sat, 26 May 2018 18:30:51 +0000
Message-ID: <20180526183053.14029-2-akurz@blala.de>
References: <20180526183053.14029-1-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180526183053.14029-1-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Alexander Kurz <akurz@blala.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

To match the convention, move regulator-fixed nodes directly into
the root node.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 arch/arm/boot/dts/imx6dl-riotboard.dts   | 55 +++++++++++++-------------------
 arch/arm/boot/dts/imx6qdl-wandboard.dtsi | 40 ++++++++++-------------
 2 files changed, 39 insertions(+), 56 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 2e98c92adff7..a52e05934e3a 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -19,38 +19,6 @@
 		reg = <0x10000000 0x40000000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_2p5v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "2P5V";
-			regulator-min-microvolt = <2500000>;
-			regulator-max-microvolt = <2500000>;
-		};
-
-		reg_3p3v: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		reg_usb_otg_vbus: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "usb_otg_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio3 22 0>;
-			enable-active-high;
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -82,6 +50,29 @@
 			mux-int-port = <1>;
 			mux-ext-port = <3>;
 	};
+
+	reg_2p5v: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P5V";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+	};
+
+	reg_3p3v: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usb_otg_vbus: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio3 22 0>;
+		enable-active-high;
+	};
 };
 
 &audmux {
diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
index ed96d7b5feab..ff7e824dfd28 100644
--- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
@@ -12,30 +12,6 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_2p5v: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "2P5V";
-			regulator-min-microvolt = <2500000>;
-			regulator-max-microvolt = <2500000>;
-			regulator-always-on;
-		};
-
-		reg_3p3v: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "3P3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
-	};
-
 	sound {
 		compatible = "fsl,imx6-wandboard-sgtl5000",
 			     "fsl,imx-audio-sgtl5000";
@@ -56,6 +32,22 @@
 		spdif-controller = <&spdif>;
 		spdif-out;
 	};
+
+	reg_2p5v: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "2P5V";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &audmux {
-- 
2.11.0

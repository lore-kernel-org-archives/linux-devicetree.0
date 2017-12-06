From: Marco Franchi <marcofrk@gmail.com>
Subject: [PATCH v3 2/3] ARM: dts: imx6sl-evk: Rearrange the regulators node
Date: Wed,  6 Dec 2017 13:15:18 -0200
Message-ID: <1512573319-6624-2-git-send-email-marcofrk@gmail.com>
References: <1512573319-6624-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1512573319-6624-1-git-send-email-marcofrk@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, marcofrk@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It is not recommended to place regulators inside "simple-bus", so move 
them out.

The motivation for doing this is to make it easier to adding new 
regulators.

Signed-off-by: Marco Franchi <marcofrk@gmail.com>
---
Changes since v2:
-include GPIO_ACTIVE_HIGH instead of numerical values
 arch/arm/boot/dts/imx6sl-evk.dts | 85 +++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
index 60600b4..c9114cc 100644
--- a/arch/arm/boot/dts/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/imx6sl-evk.dts
@@ -39,58 +39,47 @@
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reg_usb_otg1_vbus: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "usb_otg1_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio4 0 0>;
-			enable-active-high;
-			vin-supply = <&swbst_reg>;
-		};
+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg1_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&swbst_reg>;
+	};
 
-		reg_usb_otg2_vbus: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "usb_otg2_vbus";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			gpio = <&gpio4 2 0>;
-			enable-active-high;
-			vin-supply = <&swbst_reg>;
-		};
+	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_otg2_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio4 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&swbst_reg>;
+	};
 
-		reg_aud3v: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "wm8962-supply-3v15";
-			regulator-min-microvolt = <3150000>;
-			regulator-max-microvolt = <3150000>;
-			regulator-boot-on;
-		};
+	reg_aud3v: regulator-aud3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8962-supply-3v15";
+		regulator-min-microvolt = <3150000>;
+		regulator-max-microvolt = <3150000>;
+		regulator-boot-on;
+	};
 
-		reg_aud4v: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "wm8962-supply-4v2";
-			regulator-min-microvolt = <4325000>;
-			regulator-max-microvolt = <4325000>;
-			regulator-boot-on;
-		};
+	reg_aud4v: regulator-aud4v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8962-supply-4v2";
+		regulator-min-microvolt = <4325000>;
+		regulator-max-microvolt = <4325000>;
+		regulator-boot-on;
+	};
 
-		reg_lcd_3v3: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "lcd-3v3";
-			gpio = <&gpio4 3 0>;
-			enable-active-high;
-		};
+	reg_lcd_3v3: regulator-lcd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd-3v3";
+		gpio = <&gpio4 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	sound {
-- 
2.7.4

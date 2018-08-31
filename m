From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/2] ARM: dts: at91: nattis: drop three indentation levels
Date: Fri, 31 Aug 2018 22:44:02 +0200
Message-ID: <20180831204403.14653-2-peda@axentia.se>
References: <20180831204403.14653-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831204403.14653-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make use of the recently added &pinctrl and &watchdog labels. This
makes the whole file consistent and knowledge of the ahb/apb structure
is hidden.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 72 ++++++++++++-----------------
 1 file changed, 30 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
index 97e972aefac2..911d2c7c1500 100644
--- a/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
+++ b/arch/arm/boot/dts/at91-nattis-2-natte-2.dts
@@ -16,48 +16,6 @@
 	compatible = "axentia,nattis-2", "axentia,natte-2", "axentia,linea",
 		     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
 
-	ahb {
-		apb {
-			pinctrl@fffff200 {
-				nattis {
-					pinctrl_usba_vbus: usba_vbus {
-						atmel,pins =
-							<AT91_PIOD 28
-							 AT91_PERIPH_GPIO
-							 AT91_PINCTRL_DEGLITCH>;
-					};
-
-					pinctrl_mmc0_cd: mmc0_cd {
-						atmel,pins =
-							<AT91_PIOD 5
-							 AT91_PERIPH_GPIO
-							 AT91_PINCTRL_PULL_UP_DEGLITCH>;
-					};
-
-					pinctrl_lvds_prlud0: lvds_prlud0 {
-						atmel,pins =
-							<AT91_PIOA 21
-							 AT91_PERIPH_GPIO
-							 (AT91_PINCTRL_OUTPUT |
-							  AT91_PINCTRL_OUTPUT_VAL(0))>;
-					};
-
-					pinctrl_lvds_hipow0: lvds_hipow0 {
-						atmel,pins =
-							<AT91_PIOA 23
-							 AT91_PERIPH_GPIO
-							 (AT91_PINCTRL_OUTPUT |
-							  AT91_PINCTRL_OUTPUT_VAL(0))>;
-					};
-				};
-			};
-
-			watchdog@fffffe40 {
-				status = "okay";
-			};
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -183,6 +141,36 @@
 	};
 };
 
+&pinctrl {
+	nattis {
+		pinctrl_usba_vbus: usba_vbus {
+			atmel,pins = <AT91_PIOD 28 AT91_PERIPH_GPIO
+				      AT91_PINCTRL_DEGLITCH>;
+		};
+
+		pinctrl_mmc0_cd: mmc0_cd {
+			atmel,pins = <AT91_PIOD  5 AT91_PERIPH_GPIO
+				      AT91_PINCTRL_PULL_UP_DEGLITCH>;
+		};
+
+		pinctrl_lvds_prlud0: lvds_prlud0 {
+			atmel,pins = <AT91_PIOA 21 AT91_PERIPH_GPIO
+				      (AT91_PINCTRL_OUTPUT |
+				       AT91_PINCTRL_OUTPUT_VAL(0))>;
+		};
+
+		pinctrl_lvds_hipow0: lvds_hipow0 {
+			atmel,pins = <AT91_PIOA 23 AT91_PERIPH_GPIO
+				      (AT91_PINCTRL_OUTPUT |
+				       AT91_PINCTRL_OUTPUT_VAL(0))>;
+		};
+	};
+};
+
+&watchdog {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.11.0

Return-Path: <SRS0=klVN=JU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38519 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932363AbeGDIik (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Jul 2018 04:38:40 -0400
From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] ARM: dts: pandaboard: add gpio user button
Date: Wed,  4 Jul 2018 09:37:38 +0100
Message-Id: <20180704083738.32452-1-pbrobinson@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The PandaBoard has a user button connected to GPIO. On the ES this is connected
to GPIO 113, on all the other Panda editons this is GPIO 121.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/omap4-panda-common.dtsi | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/omap4-panda-es.dts      | 12 ++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index 5501d1b4e6cdf..9be08db960feb 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -5,6 +5,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
+#include <dt-bindings/input/input.h>
 #include "elpida_ecb240abacn.dtsi"
 
 / {
@@ -43,6 +44,21 @@
 		};
 	};
 
+	gpio_keys: gpio_keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <
+			&button_pins
+		>;
+
+		buttonS2 {
+			label = "button S2";
+			gpios = <&gpio4 25 GPIO_ACTIVE_LOW>;	/* gpio_121 */
+			linux,code = <BTN_0>;
+			wakeup-source;
+		};
+	};
+
 	sound: sound {
 		compatible = "ti,abe-twl6040";
 		ti,model = "PandaBoard";
@@ -357,6 +373,12 @@
 			OMAP4_IOPAD(0x152, PIN_INPUT_PULLUP | MUX_MODE0)	/* sdmmc5_dat3.sdmmc5_dat3 */
 		>;
 	};
+
+	button_pins: pinmux_button_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x114, PIN_INPUT_PULLUP | MUX_MODE3)	/* gpio_121 */
+		>;
+	};
 };
 
 &omap4_pmx_wkup {
diff --git a/arch/arm/boot/dts/omap4-panda-es.dts b/arch/arm/boot/dts/omap4-panda-es.dts
index 940fe4f7c5f6e..984f642639fab 100644
--- a/arch/arm/boot/dts/omap4-panda-es.dts
+++ b/arch/arm/boot/dts/omap4-panda-es.dts
@@ -46,6 +46,12 @@
 			OMAP4_IOPAD(0x0f6, PIN_OUTPUT | MUX_MODE3)	/* gpio_110 */
 		>;
 	};
+
+	button_pins: pinmux_button_pins {
+		pinctrl-single,pins = <
+			OMAP4_IOPAD(0x11b, PIN_INPUT_PULLUP | MUX_MODE3) /* gpio_113 */
+		>;
+	};
 };
 
 &led_wkgpio_pins {
@@ -68,6 +74,12 @@
 	};
 };
 
+&gpio_keys {
+	buttonS2 {
+		gpios = <&gpio4 17 GPIO_ACTIVE_LOW>; /* gpio_113 */
+	};
+};
+
 &gpio1 {
 	 ti,no-reset-on-init;
 };
-- 
2.17.1


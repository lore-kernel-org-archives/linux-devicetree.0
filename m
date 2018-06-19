Return-Path: <SRS0=Uw7E=JF=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: gpio: pca953x: Document interrupts, update example
Date: Tue, 19 Jun 2018 19:24:41 +0200
Message-Id: <20180619172441.20416-1-geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

The device can optionally supply an interrupt, hence document that.

Add required GPIO properties to the example (extracted from a patch by
Wolfram Sang).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 88f22866550750f9..4e3c550e319ad2e0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -37,6 +37,7 @@ Required properties:
  - #interrupt-cells: if to be used as interrupt expander.
 
 Optional properties:
+ - interrupts: interrupt specifier for the device's interrupt output.
  - reset-gpios: GPIO specification for the RESET input. This is an
 		active low signal to the PCA953x.
  - vcc-supply:	power supply regulator.
@@ -49,6 +50,8 @@ Example:
 		reg = <0x20>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pca9505>;
+		gpio-controller;
+		#gpio-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 	};
-- 
2.17.1

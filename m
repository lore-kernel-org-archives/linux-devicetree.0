Return-Path: <SRS0=Fqr3=HL=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: meson: add support for the Meson8m2 SoC
Date: Sun, 22 Apr 2018 12:53:28 +0200
Message-Id: <20180422105330.4712-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

The Meson8m2 SoC is a variant of Meson8 with some updates from Meson8b
(such as the Gigabit capable DesignWare MAC).
It is mostly pin compatible with Meson8, only 10 (existing) CBUS pins
get an additional function (four of these are Ethernet RXD2, RXD3, TXD2
and TXD3 which are required when the board uses an RGMII PHY).
The AOBUS pins seem to be identical on Meson8 and Meson8m2.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index 2c12f9789116..54ecb8ab7788 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -3,8 +3,10 @@
 Required properties for the root node:
  - compatible: one of "amlogic,meson8-cbus-pinctrl"
 		      "amlogic,meson8b-cbus-pinctrl"
+		      "amlogic,meson8m2-cbus-pinctrl"
 		      "amlogic,meson8-aobus-pinctrl"
 		      "amlogic,meson8b-aobus-pinctrl"
+		      "amlogic,meson8m2-aobus-pinctrl"
 		      "amlogic,meson-gxbb-periphs-pinctrl"
 		      "amlogic,meson-gxbb-aobus-pinctrl"
 		      "amlogic,meson-gxl-periphs-pinctrl"
-- 
2.17.0

From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] dt-bindings: pinctrl: pic32: Spelling s/configuraion/configuration/
Date: Fri,  7 Jun 2019 13:06:12 +0200
Message-ID: <20190607110612.12625-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
index 29b72e303ebf938f..51efd2085113eb53 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
@@ -5,7 +5,7 @@ Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
 pin controller, GPIO, and interrupt bindings.
 
 PIC32 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configuraions of
+used for a specific device or function. This node represents configurations of
 pins, optional function, and optional mux related configuration.
 
 Required properties for pin controller node:
-- 
2.17.1

From: Peter Vernia <peter.vernia@gmail.com>
Subject: [PATCH] pinctrl-mcp23s08: Fix property-name in dt-example
Date: Wed, 28 Aug 2019 15:56:09 -0400
Message-ID: <20190828195609.4176-1-peter.vernia@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: peter.vernia@gmail.com
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, poeschel@lemonage.de
List-Id: devicetree@vger.kernel.org

The device-tree properties documentation-file specifies the property
"microchip,spi-present-mask" as required for MCP23SXX chips. However,
the device-tree-source example below it uses only "spi-present-mask".
Without "microchip," on the front, the driver will print "missing
spi-present-mask" when it initializes.

Update the device-tree example with the correct property-name.

Signed-off-by: Peter Vernia <peter.vernia@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 625a22e2f211..8b94aa8f5971 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -82,7 +82,7 @@ gpiom1: gpio@0 {
         compatible = "microchip,mcp23s17";
         gpio-controller;
         #gpio-cells = <2>;
-        spi-present-mask = <0x01>;
+        microchip,spi-present-mask = <0x01>;
         reg = <0>;
         spi-max-frequency = <1000000>;
 };
-- 
2.20.1

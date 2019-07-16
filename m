From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: stm32: Fix missing 'clocks' property in examples
Date: Tue, 16 Jul 2019 15:56:18 -0600
Message-ID: <20190716215618.29757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Now that examples are validated against the DT schema, an error with
required 'clocks' property missing is exposed:

Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@40020000: gpio@0: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@1000: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@2000: 'clocks' is a required property

Add the missing 'clocks' properties to the examples to fix the errors.

Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 3ac5d2088e49..91d3e78b3395 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -197,6 +197,7 @@ required:
 examples:
   - |
     #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
     //Example 1
       pinctrl@40020000 {
               #address-cells = <1>;
@@ -210,6 +211,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x0 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
                       st,bank-name = "GPIOA";
               };
        };
@@ -227,6 +229,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x1000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
                       st,bank-name = "GPIOB";
                       gpio-ranges = <&pinctrl 0 0 16>;
               };
@@ -236,6 +239,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x2000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
                       st,bank-name = "GPIOC";
                       ngpios = <5>;
                       gpio-ranges = <&pinctrl 0 16 3>,
-- 
2.20.1

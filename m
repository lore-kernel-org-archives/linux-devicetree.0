From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v2 4/7] dt-bindings: pinctrl: mcp23s08: add documentation for irq-open-drain
Date: Fri,  6 Oct 2017 13:08:08 +0800
Message-ID: <1507266491-73971-5-git-send-email-preid@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, preid@electromag.com.au, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This flag set the mcp23s08 device series irq type to open drain active low.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 8a5bf99..7a0808f 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -58,6 +58,8 @@ Optional device specific properties:
         On devices with only one interrupt output this property is useless.
 - microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
         configures the IRQ output polarity as active high.
+- microchip,irq-open-drain: Sets the ODR flag in the IOCON register. This
+        configures the IRQ output as open drain active low.
 
 Example I2C (with interrupt):
 gpiom1: gpio@20 {
-- 
1.8.3.1


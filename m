From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v3 5/5] dt-bindings: pinctrl: deprecate 'microchip,irq-active-high' property
Date: Tue, 21 Nov 2017 16:21:31 +0800
Message-ID: <1511252491-79952-6-git-send-email-preid@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The irq output polarity can be determined from the 'interrupts'
configuration. So 'microchip,irq-active-high' is not required.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index a5a8322..72bac30 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -58,8 +58,8 @@ Optional device specific properties:
         occurred on. If it is not set, the interrupt are only generated for the
         bank they belong to.
         On devices with only one interrupt output this property is useless.
-- microchip,irq-active-high: Sets the INTPOL flag in the IOCON register. This
-        configures the IRQ output polarity as active high.
+- microchip,irq-active-high: (DEPRECATED)
+        irq polarity is determined from the 'interrupts' configuration
 
 Example I2C (with interrupt):
 gpiom1: gpio@20 {
-- 
1.8.3.1


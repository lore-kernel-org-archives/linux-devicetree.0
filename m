From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v3 2/5] dt-bindings: pinctrl: mcp23s08: add documentation for drive-open-drain
Date: Tue, 21 Nov 2017 16:21:28 +0800
Message-ID: <1511252491-79952-3-git-send-email-preid@electromag.com.au>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This flag set the mcp23s08 device irq type to open drain active low.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 9c451c2..a5a8322 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
@@ -45,6 +45,8 @@ Optional properties:
   - first cell is the pin number
   - second cell is used to specify flags.
 - interrupt-controller: Marks the device node as a interrupt controller.
+- drive-open-drain: Sets the ODR flag in the IOCON register. This configures
+        the IRQ output as open drain active low.
 
 Optional device specific properties:
 - microchip,irq-mirror: Sets the mirror flag in the IOCON register. Devices
-- 
1.8.3.1


Return-Path: <SRS0=/mGh=FN=electromag.com.au=preid@kernel.org>
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: mcp23s08: add documentation for drive-open-drain
Date: Mon, 19 Feb 2018 17:25:19 +0800
Message-Id: <1519032320-103817-3-git-send-email-preid@electromag.com.au>
In-Reply-To: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, jan.kundrat@cesnet.cz
List-ID: <devicetree@vger.kernel.org>

This flag set the mcp23s08 device irq type to open drain active low.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
index 7d262e9..72bac30 100644
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

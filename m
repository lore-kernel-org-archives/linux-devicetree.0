From: Matheus Castello <matheus@castello.eng.br>
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: bcm2835-gpio: Add generic pinctrl support
Date: Wed, 11 Apr 2018 00:58:44 -0400
Message-ID: <1523422726-7910-2-git-send-email-matheus@castello.eng.br>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
 <1523422726-7910-1-git-send-email-matheus@castello.eng.br>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523422726-7910-1-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, stefan.wahren@i2se.com, eric@anholt.net
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matheus Castello <matheus@castello.eng.br>
List-Id: devicetree@vger.kernel.org

Added generic pin configuration and multiplexing support,
and should be preferred than brcm legacy one.

Signed-off-by: Matheus Castello <matheus@castello.eng.br>
---
 .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index 2569866..51fe305 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -36,6 +36,24 @@ listed. In other words, a subnode that lists only a mux function implies no
 information about any pull configuration. Similarly, a subnode that lists only
 a pul parameter implies no information about the mux function.

+The BCM2835 pin configuration and multiplexing supports the generic bindings.
+For details on each properties, you can refer to ./pinctrl-bindings.txt.
+
+Required sub-node properties:
+  - pins
+  - function
+
+Optional sub-node properties:
+  - bias-disable
+  - bias-pull-up
+  - bias-pull-down
+  - output-high
+  - output-low
+
+Legacy pin configuration and multiplexing binding:
+*** (Its use is deprecated, use generic multiplexing and configuration
+bindings instead)
+
 Required subnode-properties:
 - brcm,pins: An array of cells. Each cell contains the ID of a pin. Valid IDs
   are the integer GPIO IDs; 0==GPIO0, 1==GPIO1, ... 53==GPIO53.
--
2.7.4

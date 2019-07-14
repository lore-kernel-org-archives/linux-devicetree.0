From: Zhou Yanjie <zhouyanjie@zoho.com>
Subject: [PATCH 1/6] dt-bindings: pinctrl: Add JZ4760 and JZ4760B bindings.
Date: Sun, 14 Jul 2019 11:53:51 +0800
Message-ID: <1563076436-5338-2-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, paul.burton@mips.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Add the pinctrl bindings for the JZ4760 Soc and
the JZ4760B Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
index af20b0e..a80ff68 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
@@ -11,8 +11,8 @@ naming scheme "PxN" where x is a character identifying the GPIO port with
 which the pin is associated and N is an integer from 0 to 31 identifying the
 pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
 PB31 is the last pin in GPIO port B. The jz4740 contains 4 GPIO ports, PA to
-PD, for a total of 128 pins. The jz4780 contains 6 GPIO ports, PA to PF, for a
-total of 192 pins.
+PD, for a total of 128 pins. The jz4760, the jz4770 and the jz4780 contains 6
+GPIO ports, PA to PF, for a total of 192 pins.
 
 
 Required properties:
@@ -21,6 +21,8 @@ Required properties:
  - compatible: One of:
     - "ingenic,jz4740-pinctrl"
     - "ingenic,jz4725b-pinctrl"
+    - "ingenic,jz4760-pinctrl"
+    - "ingenic,jz4760b-pinctrl"
     - "ingenic,jz4770-pinctrl"
     - "ingenic,jz4780-pinctrl"
  - reg: Address range of the pinctrl registers.
@@ -31,6 +33,7 @@ Required properties for sub-nodes (GPIO chips):
 
  - compatible: Must contain one of:
     - "ingenic,jz4740-gpio"
+    - "ingenic,jz4760-gpio"
     - "ingenic,jz4770-gpio"
     - "ingenic,jz4780-gpio"
  - reg: The GPIO bank number.
-- 
2.7.4

From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH v2 2/2] GPIO: 74xx-mmio: Add DT bindings documentation
Date: Fri,  3 Oct 2014 11:32:15 +0400
Message-ID: <1412321535-28441-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

This patch adds DT binding documentation for the 74xx-mmio GPIO driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/gpio/gpio-74xx-mmio.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
new file mode 100644
index 0000000..7bb1a9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
@@ -0,0 +1,30 @@
+* 74XX MMIO GPIO driver
+
+Required properties:
+- compatible: Should contain one of the following:
+   "ti,741g125": for 741G125 (1-bit Input),
+   "ti,741g174": for 741G74 (1-bit Output),
+   "ti,742g125": for 742G125 (2-bit Input),
+   "ti,7474"   : for 7474 (2-bit Output),
+   "ti,74125"  : for 74125 (4-bit Input),
+   "ti,74175"  : for 74175 (4-bit Output),
+   "ti,74365"  : for 74365 (6-bit Input),
+   "ti,74174"  : for 74174 (6-bit Output),
+   "ti,74244"  : for 74244 (8-bit Input),
+   "ti,74273"  : for 74273 (8-bit Output),
+   "ti,741624" : for 741624 (16-bit Input),
+   "ti,7416374": for 7416374 (16-bit Output).
+- reg: Physical base address and length where IC resides.
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be two. The first cell is the pin number and
+   the second cell is used to specify the GPIO polarity:
+    0 = Active High,
+    1 = Active Low.
+
+Example:
+	ctrl: gpio@30008004 {
+		compatible = "ti,74174";
+		reg = <0x30008004 0x1>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
2.0.4


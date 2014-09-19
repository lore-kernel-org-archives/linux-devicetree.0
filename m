From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/2] GPIO: 74xx-mmio: Add DT bindings documentation
Date: Fri, 19 Sep 2014 11:40:04 +0400
Message-ID: <1411112404-16040-3-git-send-email-shc_work@mail.ru>
References: <1411112404-16040-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1411112404-16040-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: devicetree@vger.kernel.org

This patch adds DT binding documentation for the 74xx-mmio GPIO driver.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 .../devicetree/bindings/gpio/gpio-74xx-mmio.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
new file mode 100644
index 0000000..202dce7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-74xx-mmio.txt
@@ -0,0 +1,30 @@
+* 74XX MMIO GPIO driver
+
+Required properties:
+- compatible: Should contain one of the following:
+   "ti,74ahc1g125": for 74AHC1G125 (1-bit Input),
+   "ti,74auc1g174": for 74AUC1G74 (1-bit Output),
+   "ti,74lvc2g125": for 74LVC2G125 (2-bit Input),
+   "ti,74hc74":     for 74HC74 (2-bit Output),
+   "ti,74hc125":    for 74HC125 (4-bit Input),
+   "ti,74hc175":    for 74HC175 (4-bit Output),
+   "ti,74hc365":    for 74HC365 (6-bit Input),
+   "ti,74hc174":    for 74HC174 (6-bit Output),
+   "ti,74hc244":    for 74HC244 (8-bit Input),
+   "ti,74hc273":    for 74HC273 (8-bit Output),
+   "ti,74ac1624":   for 74AC1624 (16-bit Input),
+   "ti,74ac16374":  for 74AC16374 (16-bit Output).
+- reg: Physical base address and length where IC resides.
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be two. The first cell is the pin number and
+   the second cell is used to specify the GPIO polarity:
+    0 = Active High,
+    1 = Active Low.
+
+Example:
+	ctrl: gpio@30008004 {
+		compatible = "ti,74hc174";
+		reg = <0x30008004 0x1>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
1.8.5.5


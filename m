From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH] dt-bindings: GPIO: Add TPIC2810 binding
Date: Tue, 23 Aug 2016 14:45:15 +0300
Message-ID: <1471952715-20749-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

Add binding for TPIC2810 GPO device.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
new file mode 100644
index 0000000..1afc2de
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.txt
@@ -0,0 +1,16 @@
+TPIC2810 GPIO controller bindings
+
+Required properties:
+ - compatible		: Should be "ti,tpic2810".
+ - reg			: The I2C address of the device
+ - gpio-controller	: Marks the device node as a GPIO controller.
+ - #gpio-cells		: Should be two. For consumer use see gpio.txt.
+
+Example:
+
+	gpio@60 {
+		compatible = "ti,tpic2810";
+		reg = <0x60>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
2.7.4

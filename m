From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v2 3/6] Documentation: tps65086: Add DT bindings for the TPS65086 GPO controller
Date: Fri, 30 Oct 2015 17:41:41 -0500
Message-ID: <1446244904-29315-4-git-send-email-afd@ti.com>
References: <1446244904-29315-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1446244904-29315-1-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65086 PMIC contains several regulators and a GPO controller.
Add bindings for the TPS65086 GPO controller.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tps65086.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
new file mode 100644
index 0000000..ba05107
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-tps65086.txt
@@ -0,0 +1,16 @@
+* TPS65086 GPO Controller bindings
+
+Required properties:
+ - compatible		: Should be "ti,tps65086-gpio".
+ - gpio-controller	: Marks the device node as a GPIO Controller.
+ - #gpio-cells		: Should be two. The first cell is the pin number
+			    and the second cell is used to specify flags.
+			    See ../gpio/gpio.txt for possible values.
+
+Example:
+
+	gpio4: gpio {
+		compatible = "ti,tps65086-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
1.9.1


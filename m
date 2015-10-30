From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dt-bindings: document the official use of "ngpios"
Date: Fri, 30 Oct 2015 12:03:22 +0100
Message-ID: <1446203002-7910-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Pramod Kumar <pramodku@broadcom.com>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

There are a bunch of drivers that utilize the "ngpios" DT property
without any vendor prefix. Try to start cleaning up the mess by
defining what we mean by this property.

Cc: devicetree@vger.kernel.org
Cc: Pramod Kumar <pramodku@broadcom.com>
Cc: Jonas Gorski <jogo@openwrt.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 63b1b9039ce8..9b081e6143a0 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -129,6 +129,30 @@ Every GPIO controller node must contain both an empty "gpio-controller"
 property, and a #gpio-cells integer property, which indicates the number of
 cells in a gpio-specifier.
 
+Optionally, a GPIO controller may have a "ngpios" property. This property
+indicates the number of in-use slots of available slots for GPIOs. The
+typical example is something like this: the hardware register is 32 bits
+wide, but only 18 of the bits have a physical counterpart. The driver is
+generally written so that all 32 bits can be used, but the IP block is reused
+in a lot of designs, some using all 32 bits, some using 18 and some using
+12. In this case, setting "ngpios = <18>;" informs the driver that only the
+first 18 GPIOs, at local offset 0 .. 17, are in use.
+
+If these GPIOs do not happen to be the first N GPIOs at offset 0...N, an
+additional bitmask is needed to specify which GPIOs are actually in use,
+and which are dummies. The bindings for this case has not yet been
+specified, but should be specified if/when such hardware appears.
+
+Example:
+
+gpio-controller@00000000 {
+	compatible = "foo";
+	reg = <0x00000000 0x1000>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	ngpios = <18>;
+}
+
 The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
 providing automatic GPIO request and configuration as part of the
 gpio-controller's driver probe function.
-- 
2.4.3


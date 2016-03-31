From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: dt-bindings: document the concept of GPIO banks
Date: Thu, 31 Mar 2016 11:10:59 +0200
Message-ID: <1459415459-8107-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Cc: devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6f9dac..f509ecf03ece 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -131,6 +131,19 @@ Every GPIO controller node must contain both an empty "gpio-controller"
 property, and a #gpio-cells integer property, which indicates the number of
 cells in a gpio-specifier.
 
+Some system-on-chips (SoCs) use the concept of GPIO banks. A GPIO bank is an
+instance of a hardware IP core on a silicon die, usually exposed to the
+programmer as a coherent range of I/O addresses. Usually each such bank is
+exposed in the device tree as an individual gpio-controller node, reflecting
+the fact that the hardware was synthesized by reusing the same IP block a
+few times over.
+
+A GPIO controller may specify a bank ID. This is a hardware index that
+indicate the logical order of the GPIO controller in the hardware architecture,
+usually in the sequence 0, 1, 2 .. n. The hardware index may be different
+from the order of register ranges and related to the backplane of how this
+one bank is connected to the outside through a pin controller for example.
+
 Optionally, a GPIO controller may have a "ngpios" property. This property
 indicates the number of in-use slots of available slots for GPIOs. The
 typical example is something like this: the hardware register is 32 bits
@@ -152,6 +165,7 @@ gpio-controller@00000000 {
 	reg = <0x00000000 0x1000>;
 	gpio-controller;
 	#gpio-cells = <2>;
+	gpio-bank = <0>;
 	ngpios = <18>;
 }
 
-- 
2.4.3


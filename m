Return-Path: <SRS0=dmff=LT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:49711 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbeIER4s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Sep 2018 13:56:48 -0400
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 2/2] dt-bindings: gpio: Add binding for gpio-mockup
Date: Wed,  5 Sep 2018 15:26:18 +0200
Message-Id: <20180905132618.31274-2-vincent.whitchurch@axis.com>
In-Reply-To: <20180905132618.31274-1-vincent.whitchurch@axis.com>
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
Sender: devicetree-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Vincent Whitchurch <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

This is a dummy GPIO controller which can be used in place of the real
hardware GPIO controller (for example, an external GPIO expander) before
actual hardware is available.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 .../devicetree/bindings/gpio/gpio-mockup.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mockup.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mockup.txt b/Documentation/devicetree/bindings/gpio/gpio-mockup.txt
new file mode 100644
index 000000000000..585f04e356fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-mockup.txt
@@ -0,0 +1,22 @@
+Mockup GPIO controller bindings
+
+This creates a dummy GPIO controller which can be used for testing higher level
+drivers or userspace before actual hardware is available.
+
+Required properties:
+- compatible: Should contain "gpio-mockup"
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells : Should be two.  The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+      0 = active high
+      1 = active low
+- nr-gpios: The number of dummy GPIOs
+
+Example:
+
+	gpio-mockup0 {
+		compatible = "gpio-mockup";
+		nr-gpios = <32>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
-- 
2.11.0

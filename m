From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 10/10] bindings: gpio-sx150x: Document new bindings
Date: Wed, 19 Oct 2016 07:04:06 -0700
Message-ID: <1476885846-16469-11-git-send-email-andrew.smirnov@gmail.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch documents the conversion of various platform data options
that used to be availible to SX150x driver to device tree/OF form.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 .../devicetree/bindings/gpio/gpio-sx150x.txt       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index c809acb..e96b554 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -26,6 +26,35 @@ The GPIO expander can optionally be used as an interrupt controller, in
 which case it uses the default two cell specifier as described in
 Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
 
+Optional properties:
+
+- semtech,io-polarity: A bit-mask which enables polarity inversion for
+  		       each IO line in the expander. Setting the bit
+  		       at position n inverts the polarity of that IO
+  		       line, while clearing it results in normal
+  		       polarity. For chips with fewer than 16 IO pins,
+  		       high-end bits are ignored.
+
+- semtech,io-pullup:
+- semtech,io-pulldown: A bit-mask which enables-or disables the
+  		       pull-up (pull-down) resistor for each IO line
+  		       in the expander. Setting the bit at position n
+  		       will enable the pull-down for the IO at the
+  		       corresponding offset.  For chips with fewer
+  		       than 16 IO pins, high-end bits are ignored.
+
+- semtech,reset-during-probe: Boolean, if true, the driver will
+  			      trigger a full reset of the chip at the
+  			      beginning of the probe in order to place
+  			      it in a known state.
+
+- semtech,oscio-is-gpo: Boolean, if set to true, the driver will
+  			configure OSCIO as a GPO instead of as an
+  			oscillator, increasing the size of the GP(I)O
+  			pool created by this expander by one.  The
+  			output-only GPO pin will be added at the end
+  			of the block.
+
 Example:
 
 	i2c_gpio_expander@20{
-- 
2.5.5

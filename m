From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 05/13] bindings: gpio-sx150x: Document "semtech,io-polarity" binding
Date: Mon, 17 Oct 2016 07:27:00 -0700
Message-ID: <1476714428-11264-6-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index c809acb..02b92ae 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -26,6 +26,15 @@ The GPIO expander can optionally be used as an interrupt controller, in
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
 Example:
 
 	i2c_gpio_expander@20{
-- 
2.5.5


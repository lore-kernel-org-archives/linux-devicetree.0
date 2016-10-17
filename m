From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 07/13] bindings: gpio-sx150x: Document "semtech,io-pull*" bindings
Date: Mon, 17 Oct 2016 07:27:02 -0700
Message-ID: <1476714428-11264-8-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index 02b92ae..7574137 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -35,6 +35,14 @@ Optional properties:
   		       polarity. For chips with fewer than 16 IO pins,
   		       high-end bits are ignored.
 
+- semtech,io-pullup:
+- semtech,io-pulldown: A bit-mask which enables-or disables the
+  		       pull-up (pull-down) resistor for each IO line
+  		       in the expander. Setting the bit at position n
+  		       will enable the pull-down for the IO at the
+  		       corresponding offset.  For chips with fewer
+  		       than 16 IO pins, high-end bits are ignored.
+
 Example:
 
 	i2c_gpio_expander@20{
-- 
2.5.5


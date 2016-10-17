From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 09/13] bindings: gpio-sx150x: Document "semtech,reset-during-probe" bindings
Date: Mon, 17 Oct 2016 07:27:04 -0700
Message-ID: <1476714428-11264-10-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index 7574137..4b7c48a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -43,6 +43,11 @@ Optional properties:
   		       corresponding offset.  For chips with fewer
   		       than 16 IO pins, high-end bits are ignored.
 
+- semtech,reset-during-probe: Boolean, if true, the driver will
+  			      trigger a full reset of the chip at the
+  			      beginning of the probe in order to place
+  			      it in a known state.
+
 Example:
 
 	i2c_gpio_expander@20{
-- 
2.5.5

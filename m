From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 11/13] bindings: gpio-sx150x: Document "semtech,oscio-is-gpo" binding
Date: Mon, 17 Oct 2016 07:27:06 -0700
Message-ID: <1476714428-11264-12-git-send-email-andrew.smirnov@gmail.com>
References: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-sx150x.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index 4b7c48a..e96b554 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -48,6 +48,13 @@ Optional properties:
   			      beginning of the probe in order to place
   			      it in a known state.
 
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

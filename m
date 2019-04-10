From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: gpio: lpc32xx: document interrupt bindings
Date: Wed, 10 Apr 2019 12:39:24 +0200
Message-ID: <20190410103926.8781-2-alexandre.belloni@bootlin.com>
References: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410103926.8781-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Some of the LPC32xx gpios are wired directly to one of the interrupt
controllers while port 0 and port 1 share the same interrupt for their
interrupt capable gpios.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt b/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
index 49819367a011..e7957a17e4db 100644
--- a/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio_lpc32xx.txt
@@ -16,6 +16,10 @@ Required properties:
    3) optional parameters:
       - bit 0 specifies polarity (0 for normal, 1 for inverted)
 - reg: Index of the GPIO group
+- interrupts: Should be the interrupt shared by port 0 and port 1 and the
+  interrupts for individual pins from port 3.
+- interrupt-names : Should be the names of irq resources. The shared port
+  interrupt is named "p01", the other use the pin names.
 
 Example:
 
-- 
2.20.1

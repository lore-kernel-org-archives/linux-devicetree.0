From: Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH v3 1/5] dt-bindings: gpio: aspeed: Update documentation with ast2600 controllers
Date: Fri,  6 Sep 2019 16:25:47 +1000
Message-ID: <20190906062547.13264-1-rashmica.g@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Rashmica Gupta <rashmica.g@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
        SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
        SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins.  We use
the ngpio property to differentiate between these controllers.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..b2033fc3a71a 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					or "aspeed,ast2600-gpio".
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
@@ -17,7 +18,9 @@ Required properties:
 
 Optional properties:
 
-- clocks                : A phandle to the clock to use for debounce timings
+- clocks		: A phandle to the clock to use for debounce timings
+- ngpios		: Number of GPIOs controlled by this controller. Should	be set
+				  when there are multiple GPIO controllers on a SoC (ast2600).
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.20.1

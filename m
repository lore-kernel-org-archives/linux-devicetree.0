From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt/bindings: gpio: add compatible string for marvell,pxa1928-gpio
Date: Mon, 26 Jan 2015 22:46:05 -0600
Message-ID: <1422333966-18338-3-git-send-email-robh@kernel.org>
References: <1422333966-18338-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422333966-18338-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new compatible string for PXA1928 GPIO controller. The IP block is
same as prior chips with a 6th bank added.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
index b2afdb2..67a2e4e 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
@@ -3,8 +3,8 @@
 Required properties:
 - compatible : Should be "intel,pxa25x-gpio", "intel,pxa26x-gpio",
 		"intel,pxa27x-gpio", "intel,pxa3xx-gpio",
-		"marvell,pxa93x-gpio", "marvell,mmp-gpio" or
-		"marvell,mmp2-gpio".
+		"marvell,pxa93x-gpio", "marvell,mmp-gpio",
+		"marvell,mmp2-gpio" or marvell,pxa1928-gpio.
 - reg : Address and length of the register set for the device
 - interrupts : Should be the port interrupt shared by all gpio pins.
   There're three gpio interrupts in arch-pxa, and they're gpio0,
-- 
2.1.0

From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: bcm2835-gpio: Document BCM7211 compatible
Date: Thu,  9 May 2019 13:59:53 -0700
Message-ID: <20190509205955.27842-2-f.fainelli@gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509205955.27842-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Doug Berger <opendmb@gmail.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

BCM7211 has a slightly different block layout and some additional GPIO
registers that were added, document the compatible string.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index 3fac0a061bcc..ac6d614d74e0 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -5,6 +5,9 @@ controller, and pinmux/control device.
 
 Required properties:
 - compatible: "brcm,bcm2835-gpio"
+- compatible: should be one of:
+  "brcm,bcm2835-gpio" - BCM2835 compatible pinctrl
+  "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
 - reg: Should contain the physical address of the GPIO module's registers.
 - gpio-controller: Marks the device node as a GPIO controller.
 - #gpio-cells : Should be two. The first cell is the pin number and the
-- 
2.17.1

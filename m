From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v2 5/7] dt-bindings: add bindings for SAM9X60
Date: Thu, 31 Jan 2019 16:18:17 +0000
Message-ID: <1548951466-26297-6-git-send-email-claudiu.beznea@microchip.com>
References: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548951466-26297-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add device tree binding for SAM9X60 pin controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.t=
xt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index 40e33dfc36fd..c2d51ed86d47 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -19,7 +19,7 @@ such as pull-up, multi drive, etc.
=20
 Required properties for iomux controller:
 - compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
-		or "atmel,sama5d3-pinctrl"
+		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pinctrl"
 - atmel,mux-mask: array of mask (periph per bank) to describe if a pin can=
 be
   configured in this periph mode. All the periph and bank need to be descr=
ibe.
=20
@@ -117,7 +117,8 @@ Some requirements for using atmel,at91rm9200-pinctrl bi=
nding:
 4. The gpio controller must be describe in the pinctrl simple-bus.
=20
 For each bank the required properties are:
-- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio"
+- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio" or
+  "microchip,sam9x60-gpio"
 - reg: physical base address and length of the controller's registers
 - interrupts: interrupt outputs from the controller
 - interrupt-controller: marks the device node as an interrupt controller
--=20
2.7.4

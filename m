From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 2/8] dt-bindings: arm: atmel: add binding for SAM9X60 SoC
Date: Thu, 14 Feb 2019 15:54:37 +0000
Message-ID: <1550159642-26878-3-git-send-email-claudiu.beznea@microchip.com>
References: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550159642-26878-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add device tree binding for SAM9X60 SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documen=
tation/devicetree/bindings/arm/atmel-at91.txt
index 4bf1b4da7659..99dee23c74a4 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
@@ -25,6 +25,7 @@ compatible: must be one of:
     o "atmel,at91sam9n12"
     o "atmel,at91sam9rl"
     o "atmel,at91sam9xe"
+    o "microchip,sam9x60"
  * "atmel,sama5" for SoCs using a Cortex-A5, shall be extended with the sp=
ecific
    SoC family:
     o "atmel,sama5d2" shall be extended with the specific SoC compatible:
--=20
2.7.4

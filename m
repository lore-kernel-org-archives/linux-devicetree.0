From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH 1/5] dt-bindings: arm: atmel: add bindings for PIT64B
Date: Thu, 14 Mar 2019 16:26:35 +0000
Message-ID: <1552580772-8499-2-git-send-email-claudiu.beznea@microchip.com>
References: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552580772-8499-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add device tree bindings for PIT64B timer.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Docu=
mentation/devicetree/bindings/arm/atmel-sysregs.txt
index 14f319f694b7..c7b7ead7966b 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -10,6 +10,13 @@ PIT Timer required properties:
 - interrupts: Should contain interrupt for the PIT which is the IRQ line
   shared across all System Controller members.
=20
+PIT64B Timer required properties:
+- compatible: Should be "microchip,sam9x60-pit64b"
+- reg: Should contain registers location and length
+- clock-frequency: Should contain PIT64B timer frequency
+- interrupts: Should contain interrupt for PIT64B timer
+- clocks: Should contain the available clock sources for PIT64B timer.
+
 System Timer (ST) required properties:
 - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
 - reg: Should contain registers location and length
--=20
2.7.4

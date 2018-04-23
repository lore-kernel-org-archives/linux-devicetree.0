Return-Path: <SRS0=/gx/=HM=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mvebu-uart: DT fix s/interrupts-names/interrupt-names/
Date: Mon, 23 Apr 2018 09:35:16 +0200
Message-Id: <1524468916-14508-1-git-send-email-geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/mvebu-uart.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/mvebu-uart.txt b/Documentation/devicetree/bindings/serial/mvebu-uart.txt
index 2ae2fee7e023c013..b7e0e32b9ac62c10 100644
--- a/Documentation/devicetree/bindings/serial/mvebu-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mvebu-uart.txt
@@ -24,7 +24,7 @@ Required properties:
     - Must contain two elements for the extended variant of the IP
       (marvell,armada-3700-uart-ext): "uart-tx" and "uart-rx",
       respectively the UART TX interrupt and the UART RX interrupt. A
-      corresponding interrupts-names property must be defined.
+      corresponding interrupt-names property must be defined.
     - For backward compatibility reasons, a single element interrupts
       property is also supported for the standard variant of the IP,
       containing only the UART sum interrupt. This form is deprecated
-- 
2.7.4

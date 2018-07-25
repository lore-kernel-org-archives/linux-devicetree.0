Return-Path: <SRS0=GvcF=KJ=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 3/3] serial: sh-sci: Document r7s9210 bindings
Date: Wed, 25 Jul 2018 09:38:50 -0500
Message-Id: <20180725143850.32985-4-chris.brandt@renesas.com>
In-Reply-To: <20180725143850.32985-1-chris.brandt@renesas.com>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add R7S9210 (RZ/A2) support.
Also describe interrupts property in more detail.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * Add more details to interrupts property
 * Geert gave a Reviewed-by for V1, but then later said that was a
   mistake because it was missing the interrupts description, so
   I didn't include his Reviewed-by yet.
---
 .../devicetree/bindings/serial/renesas,sci-serial.txt   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index 106808b55b6d..5d0997a04697 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -5,6 +5,7 @@ Required properties:
   - compatible: Must contain one or more of the following:
 
     - "renesas,scif-r7s72100" for R7S72100 (RZ/A1H) SCIF compatible UART.
+    - "renesas,scif-r7s9210" for R7S9210 (RZ/A2) SCIF compatible UART.
     - "renesas,scifa-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFA compatible UART.
     - "renesas,scifb-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFB compatible UART.
     - "renesas,scifa-r8a7740" for R8A7740 (R-Mobile A1) SCIFA compatible UART.
@@ -72,7 +73,21 @@ Required properties:
     family-specific and/or generic versions.
 
   - reg: Base address and length of the I/O registers used by the UART.
-  - interrupts: Must contain an interrupt-specifier for the SCIx interrupt.
+  - interrupts: Must contain one or more interrupt-specifiers for the SCIx.
+                If a single interrupt is expressed, then all events are
+                multiplexed into this single interrupt.
+
+                If multiple interrupts are provided by the hardware, the order
+                in which the interrupts are listed must match order below. Note
+                that some HW interrupt events may be muxed together resulting
+                in duplicate entires.
+                The interrupt order is as follows:
+                  1. Error (ERI)
+                  2. Receive buffer full (RXI)
+                  3. Transmit buffer empty (TXI)
+                  4. Break (BRI)
+                  5. Data Ready (DRI)
+                  6. Transmit End (TEI)
 
   - clocks: Must contain a phandle and clock-specifier pair for each entry
     in clock-names.
-- 
2.16.1

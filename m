Return-Path: <SRS0=Pf9O=KL=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/4] serial: sh-sci: Improve interrupts description
Date: Fri, 27 Jul 2018 16:09:13 -0500
Message-Id: <20180727210916.66642-2-chris.brandt@renesas.com>
In-Reply-To: <20180727210916.66642-1-chris.brandt@renesas.com>
References: <20180727210916.66642-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Describe interrupts property in more detail, especially when there are
more than one interrupt.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/serial/renesas,sci-serial.txt    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index a7cda6550100..eaca9da79d83 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -73,7 +73,21 @@ Required properties:
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
+                in duplicate entries.
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

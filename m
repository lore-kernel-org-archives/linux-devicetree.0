Return-Path: <SRS0=m83C=J3=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
Date: Wed, 11 Jul 2018 09:41:31 -0500
Message-Id: <20180711144131.73552-3-chris.brandt@renesas.com>
In-Reply-To: <20180711144131.73552-1-chris.brandt@renesas.com>
References: <20180711144131.73552-1-chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add R7S9210 (RZ/A2) support

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index 106808b55b6d..5c002bce8f42 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -5,6 +5,7 @@ Required properties:
   - compatible: Must contain one or more of the following:
 
     - "renesas,scif-r7s72100" for R7S72100 (RZ/A1H) SCIF compatible UART.
+    - "renesas,scif-r7s9210" for R7S9210 (RZ/A2) SCIF compatible UART.
     - "renesas,scifa-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFA compatible UART.
     - "renesas,scifb-r8a73a4" for R8A73A4 (R-Mobile APE6) SCIFB compatible UART.
     - "renesas,scifa-r8a7740" for R8A7740 (R-Mobile A1) SCIFA compatible UART.
-- 
2.16.1

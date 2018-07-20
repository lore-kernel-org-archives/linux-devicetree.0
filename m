Return-Path: <SRS0=9cEJ=KE=linux-m68k.org=geert@kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Document that serial aliases became optional
Date: Fri, 20 Jul 2018 14:19:40 +0200
Message-Id: <20180720121940.29616-1-geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

Serial aliases are optional since commit 7678f4c20fa7670f ("serial:
sh-sci: Add support for dynamic instances").
Update the DT bindings to reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index 5c002bce8f4276e3..a7cda65501003746 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -90,7 +90,7 @@ Required properties:
       - "scif_clk" for the optional external clock source for the frequency
 	divider (SCIF_CLK).
 
-Note: Each enabled SCIx UART should have an alias correctly numbered in the
+Note: Each enabled SCIx UART may have an optional "serialN" alias in the
 "aliases" node.
 
 Optional properties:
-- 
2.17.1

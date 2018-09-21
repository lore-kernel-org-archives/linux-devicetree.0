Return-Path: <SRS0=4SCW=MD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] dt-bindings: serial: sh-sci: Document r8a7744 bindings
Date: Fri, 21 Sep 2018 15:45:54 +0100
Message-Id: <1537541154-54306-1-git-send-email-biju.das@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

RZ/G1N (R8A7744) SoC also has the R-Car gen2 compatible SCIF, SCIFA,
SCIFB, and HSCIF ports, so document the SoC specific bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index eaca9da..723abe0 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -14,6 +14,10 @@ Required properties:
     - "renesas,scifa-r8a7743" for R8A7743 (RZ/G1M) SCIFA compatible UART.
     - "renesas,scifb-r8a7743" for R8A7743 (RZ/G1M) SCIFB compatible UART.
     - "renesas,hscif-r8a7743" for R8A7743 (RZ/G1M) HSCIF compatible UART.
+    - "renesas,scif-r8a7744" for R8A7744 (RZ/G1N) SCIF compatible UART.
+    - "renesas,scifa-r8a7744" for R8A7744 (RZ/G1N) SCIFA compatible UART.
+    - "renesas,scifb-r8a7744" for R8A7744 (RZ/G1N) SCIFB compatible UART.
+    - "renesas,hscif-r8a7744" for R8A7744 (RZ/G1N) HSCIF compatible UART.
     - "renesas,scif-r8a7745" for R8A7745 (RZ/G1E) SCIF compatible UART.
     - "renesas,scifa-r8a7745" for R8A7745 (RZ/G1E) SCIFA compatible UART.
     - "renesas,scifb-r8a7745" for R8A7745 (RZ/G1E) SCIFB compatible UART.
-- 
2.7.4

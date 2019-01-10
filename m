Return-Path: <SRS0=MwbZ=PS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:44628 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbfAJPaP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 Jan 2019 10:30:15 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF bindings
Date: Thu, 10 Jan 2019 16:30:12 +0100
Message-Id: <20190110153012.21024-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Ulrich Hecht <uli+renesas@fpond.eu>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Document support for the HSCIF serial ports in the Renesas R-Car M1A
(R8A7778) and H1 (R8A7779) SoCs.

No driver update is needed.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
[geert: Patch description]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Picked up from Ulrich and rebased against current.
---
 Documentation/devicetree/bindings/serial/renesas,sci-serial.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index 20232ad05d894223..dd63151dc8b6d3e1 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -29,7 +29,9 @@ Required properties:
     - "renesas,scif-r8a774c0" for R8A774C0 (RZ/G2E) SCIF compatible UART.
     - "renesas,hscif-r8a774c0" for R8A774C0 (RZ/G2E) HSCIF compatible UART.
     - "renesas,scif-r8a7778" for R8A7778 (R-Car M1) SCIF compatible UART.
+    - "renesas,hscif-r8a7778" for R8A7778 (R-Car M1) HSCIF compatible UART.
     - "renesas,scif-r8a7779" for R8A7779 (R-Car H1) SCIF compatible UART.
+    - "renesas,hscif-r8a7779" for R8A7779 (R-Car H1) HSCIF compatible UART.
     - "renesas,scif-r8a7790" for R8A7790 (R-Car H2) SCIF compatible UART.
     - "renesas,scifa-r8a7790" for R8A7790 (R-Car H2) SCIFA compatible UART.
     - "renesas,scifb-r8a7790" for R8A7790 (R-Car H2) SCIFB compatible UART.
-- 
2.17.1

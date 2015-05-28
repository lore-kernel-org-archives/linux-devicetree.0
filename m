From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/6] serial: sh-sci: Add device tree bindings for r8a7793
Date: Thu, 28 May 2015 17:17:03 +0200
Message-ID: <1432826225-6743-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1432826225-6743-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432826225-6743-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
Cc: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Also replaces "R-Car M2" with "R-Car M2-W" to avoid confusion.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
---
 .../devicetree/bindings/serial/renesas,sci-serial.txt        | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index ae73bb0..78419eb 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -15,10 +15,14 @@ Required properties:
     - "renesas,scifa-r8a7790" for R8A7790 (R-Car H2) SCIFA compatible UART.
     - "renesas,scifb-r8a7790" for R8A7790 (R-Car H2) SCIFB compatible UART.
     - "renesas,hscif-r8a7790" for R8A7790 (R-Car H2) HSCIF compatible UART.
-    - "renesas,scif-r8a7791" for R8A7791 (R-Car M2) SCIF compatible UART.
-    - "renesas,scifa-r8a7791" for R8A7791 (R-Car M2) SCIFA compatible UART.
-    - "renesas,scifb-r8a7791" for R8A7791 (R-Car M2) SCIFB compatible UART.
-    - "renesas,hscif-r8a7791" for R8A7791 (R-Car M2) HSCIF compatible UART.
+    - "renesas,scif-r8a7791" for R8A7791 (R-Car M2-W) SCIF compatible UART.
+    - "renesas,scifa-r8a7791" for R8A7791 (R-Car M2-W) SCIFA compatible UART.
+    - "renesas,scifb-r8a7791" for R8A7791 (R-Car M2-W) SCIFB compatible UART.
+    - "renesas,hscif-r8a7791" for R8A7791 (R-Car M2-W) HSCIF compatible UART.
+    - "renesas,scif-r8a7793" for R8A7793 (R-Car M2-N) SCIF compatible UART.
+    - "renesas,scifa-r8a7793" for R8A7793 (R-Car M2-N) SCIFA compatible UART.
+    - "renesas,scifb-r8a7793" for R8A7793 (R-Car M2-N) SCIFB compatible UART.
+    - "renesas,hscif-r8a7793" for R8A7793 (R-Car M2-N) HSCIF compatible UART.
     - "renesas,scif-r8a7794" for R8A7794 (R-Car E2) SCIF compatible UART.
     - "renesas,scifa-r8a7794" for R8A7794 (R-Car E2) SCIFA compatible UART.
     - "renesas,scifb-r8a7794" for R8A7794 (R-Car E2) SCIFB compatible UART.
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

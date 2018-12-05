Return-Path: <SRS0=nQ6t=OO=fpond.eu=uli+renesas@kernel.org>
From: Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 2/2] dt-bindings: can: rcar_canfd: add r8a77995 (R-Car D3) compatibility strings
Date: Wed,  5 Dec 2018 09:17:05 +0800
Message-Id: <1543972625-11267-3-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
References: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org, robh@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Adds compatible strings for the R-Car CAN FD controller in the D3 SoC.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index ac71daa..ae2a2b7 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -8,6 +8,7 @@ Required properties:
   - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controller.
   - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
   - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible controller.
+  - "renesas,r8a77995-canfd" for R8A77995 (R-Car D3) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
@@ -26,10 +27,9 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
-compatible:
-In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
-CAN and CAN FD controller at the same time. It needs to be scaled to maximum
+Required properties for R8A7795, R8A7796 and R8A77995:
+In the denoted SoCs, canfd clock is a div6 clock and can be used by both CAN
+and CAN FD controller at the same time. It needs to be scaled to maximum
 frequency if any of these controllers use it. This is done using the below
 properties:
 
-- 
2.7.4

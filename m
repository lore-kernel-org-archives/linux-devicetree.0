Return-Path: <SRS0=nQ6t=OO=fpond.eu=uli+renesas@kernel.org>
From: Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 1/2] dt-bindings: can: rcar_can: add r8a77995 (R-Car D3) compatibility strings
Date: Wed,  5 Dec 2018 09:17:04 +0800
Message-Id: <1543972625-11267-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
References: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org, robh@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Adds compatible strings for the R-Car CAN controller in the D3 SoC.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 9936b9e..a72ced1 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -16,6 +16,7 @@ Required properties:
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
 	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
 	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
+	      "renesas,can-r8a77995" if CAN controller is a part of R8A77995 SoC.
 	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device.
 	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
 	      compatible device.
@@ -37,7 +38,7 @@ Required properties:
 - pinctrl-0: pin control group to be used for this controller.
 - pinctrl-names: must be "default".
 
-Required properties for R8A7795, R8A7796 and R8A77965:
+Required properties for R8A7795, R8A7796, R8A77965 and R8A77995:
 For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock and can
 be used by both CAN and CAN FD controller at the same time. It needs to be
 scaled to maximum frequency if any of these controllers use it. This is done
-- 
2.7.4

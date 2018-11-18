Return-Path: <SRS0=qRW3=N5=gmail.com=marek.vasut@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
Date: Sun, 18 Nov 2018 18:30:56 +0100
Message-Id: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document the support for rcar_can on R8A77990 SoC devices.
Add R8A77990 to the list of SoCs which require the "assigned-clocks"
and "assigned-clock-rates" properties.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
index 9936b9ee67c3..d962138d5b50 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
@@ -16,6 +16,7 @@ Required properties:
 	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
 	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
 	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 SoC.
+	      "renesas,can-r8a77990" if CAN controller is a part of R8A77990 SoC.
 	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible device.
 	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
 	      compatible device.
@@ -37,7 +38,7 @@ Required properties:
 - pinctrl-0: pin control group to be used for this controller.
 - pinctrl-names: must be "default".
 
-Required properties for R8A7795, R8A7796 and R8A77965:
+Required properties for R8A7795, R8A7796, R8A77965 and R8A77990:
 For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock and can
 be used by both CAN and CAN FD controller at the same time. It needs to be
 scaled to maximum frequency if any of these controllers use it. This is done
-- 
2.18.0

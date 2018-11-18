Return-Path: <SRS0=qRW3=N5=gmail.com=marek.vasut@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 2/2] dt-bindings: can: rcar_canfd: document r8a77990 support
Date: Sun, 18 Nov 2018 18:32:01 +0100
Message-Id: <20181118173201.4645-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document the support for rcar_canfd on R8A77990 SoC devices.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: devicetree@vger.kernel.org
---
 .../devicetree/bindings/net/can/rcar_canfd.txt      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
index 4720e916fbdd..41049fed5872 100644
--- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
+++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
@@ -9,6 +9,7 @@ Required properties:
   - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
   - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible controller.
   - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible controller.
+  - "renesas,r8a77990-canfd" for R8A77990 (R-Car E3) compatible controller.
 
   When compatible with the generic version, nodes must list the
   SoC-specific version corresponding to the platform first, followed by the
@@ -27,12 +28,12 @@ The name of the child nodes are "channel0" and "channel1" respectively. Each
 child node supports the "status" property only, which is used to
 enable/disable the respective channel.
 
-Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
-"renesas,r8a77965-canfd" compatible:
-In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
-be used by both CAN and CAN FD controller at the same time. It needs to be
-scaled to maximum frequency if any of these controllers use it. This is done
-using the below properties:
+Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd",
+"renesas,r8a77965-canfd" and "renesas,r8a77990-canfd" compatible:
+In R8A7795, R8A7796, R8A77965 and R8A77990 SoCs, canfd clock is a div6 clock
+and can be used by both CAN and CAN FD controller at the same time. It needs
+to be scaled to maximum frequency if any of these controllers use it. This is
+done using the below properties:
 
 - assigned-clocks: phandle of canfd clock.
 - assigned-clock-rates: maximum frequency of this clock.
-- 
2.18.0

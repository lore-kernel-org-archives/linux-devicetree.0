From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 4/4] dt-bindings: net: phy: mscc: vsc8531: factorize vsc8531,led-N-mode
Date: Mon, 30 Jul 2018 15:02:36 +0200
Message-ID: <20180730130236.3837-4-quentin.schulz@bootlin.com>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

VSC8584 supports 4 LEDs while VSC8531 only supports 2. Let's factorize
the documentation for LED mode properties and give the 4 default values
(the first two being shared between VSC8531 and VSC8584).

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 .../devicetree/bindings/net/mscc-phy-vsc8531.txt | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
index 4c7d1d384df0..4d3f8b07a286 100644
--- a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
+++ b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
@@ -22,14 +22,16 @@ Optional properties:
 			  'vddmac'.
 			  Default value is 0%.
 			  Ref: Table:1 - Edge rate change (below).
-- vsc8531,led-0-mode	: LED mode. Specify how the LED[0] should behave.
-			  Allowed values are define in
+- vsc8531,led-[N]-mode	: LED mode. Specify how the LED[N] should behave.
+			  N depends on the number of LEDs supported by a
+			  PHY.
+			  Allowed values are defined in
 			  "include/dt-bindings/net/mscc-phy-vsc8531.h".
-			  Default value is VSC8531_LINK_1000_ACTIVITY (1).
-- vsc8531,led-1-mode	: LED mode. Specify how the LED[1] should behave.
-			  Allowed values are define in
-			  "include/dt-bindings/net/mscc-phy-vsc8531.h".
-			  Default value is VSC8531_LINK_100_ACTIVITY (2).
+			  Default values are VSC8531_LINK_1000_ACTIVITY (1),
+			  VSC8531_LINK_100_ACTIVITY (2),
+			  VSC8531_LINK_ACTIVITY (0) and
+			  VSC8531_DUPLEX_COLLISION (8).
+
 
 Table: 1 - Edge rate change
 ----------------------------------------------------------------|
-- 
2.17.1

From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v2 7/7] dt-bindings: net: phy: mscc: vsc8531: factorize vsc8531,led-N-mode
Date: Mon,  3 Sep 2018 10:48:53 +0200
Message-ID: <20180903084853.18092-7-quentin.schulz@bootlin.com>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903084853.18092-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

VSC8584 supports 4 LEDs while VSC8531 only supports 2. Let's factorize
the documentation for LED mode properties and give the 4 default values
(the first two being shared between VSC8531 and VSC8584).

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 .../devicetree/bindings/net/mscc-phy-vsc8531.txt | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
index 664d9d0543fc..5ff37c68c941 100644
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

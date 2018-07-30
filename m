From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 2/4] dt-bindings: net: phy: mscc: vsc8531: remove compatible from required properties
Date: Mon, 30 Jul 2018 15:02:34 +0200
Message-ID: <20180730130236.3837-2-quentin.schulz@bootlin.com>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Compatible isn't a required property for PHYs so let's remove it from
the binding DT of the VSC8531 PHYs.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
index 0eedabe22cc3..664d9d0543fc 100644
--- a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
+++ b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
@@ -1,10 +1,5 @@
 * Microsemi - vsc8531 Giga bit ethernet phy
 
-Required properties:
-- compatible	: Should contain phy id as "ethernet-phy-idAAAA.BBBB"
-		  The PHY device uses the binding described in
-		  Documentation/devicetree/bindings/net/phy.txt
-
 Optional properties:
 - vsc8531,vddmac	: The vddmac in mV. Allowed values is listed
 			  in the first row of Table 1 (below).
-- 
2.17.1

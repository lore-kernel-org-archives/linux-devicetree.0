From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 3/4] dt-bindings: net: phy: mscc: vsc8531: fix missing "/bits/ 8" in example
Date: Mon, 30 Jul 2018 15:02:35 +0200
Message-ID: <20180730130236.3837-3-quentin.schulz@bootlin.com>
References: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730130236.3837-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org, alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The "vsc8531,led-N-mode" property is read as a u8 in the driver and
there aren't a lot of modes anyway.

Without the "/bits/ 8" in front of the value of the property, the
value is stored as an u32 resulting in of_read_property_u8 to always
return 0.

Fix the example so that people using the property can actually use it.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
index 664d9d0543fc..4c7d1d384df0 100644
--- a/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
+++ b/Documentation/devicetree/bindings/net/mscc-phy-vsc8531.txt
@@ -63,6 +63,6 @@ Example:
                 compatible = "ethernet-phy-id0007.0570";
                 vsc8531,vddmac		= <3300>;
                 vsc8531,edge-slowdown	= <7>;
-                vsc8531,led-0-mode	= <LINK_1000_ACTIVITY>;
-                vsc8531,led-1-mode	= <LINK_100_ACTIVITY>;
+                vsc8531,led-0-mode	= /bits/ 8 <LINK_1000_ACTIVITY>;
+                vsc8531,led-1-mode	= /bits/ 8 <LINK_100_ACTIVITY>;
         };
-- 
2.17.1

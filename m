From: Robert Beckett <bob.beckett@collabora.com>
Subject: [PATCH 3/7] dt-bindings: mv88e6xxx: add ability to set default queue priorities per port
Date: Tue, 10 Sep 2019 16:41:49 +0100
Message-ID: <20190910154238.9155-4-bob.beckett@collabora.com>
References: <20190910154238.9155-1-bob.beckett@collabora.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190910154238.9155-1-bob.beckett@collabora.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Robert Beckett <bob.beckett@collabora.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document a new setting for Marvell switch chips to set the default queue
priorities per port.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 Documentation/devicetree/bindings/net/dsa/marvell.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/marvell.txt b/Documentation/devicetree/bindings/net/dsa/marvell.txt
index 6f9538974bb9..e097c3c52eac 100644
--- a/Documentation/devicetree/bindings/net/dsa/marvell.txt
+++ b/Documentation/devicetree/bindings/net/dsa/marvell.txt
@@ -47,6 +47,10 @@ Optional properties:
 			  bus. The node must contains a compatible string of
 			  "marvell,mv88e6xxx-mdio-external"
 
+Optional properties for ports:
+- defqpri=<n>		: Enforced default queue priority for the given port.
+			  Valid range is 0..3
+
 Example:
 
 	mdio {
-- 
2.18.0

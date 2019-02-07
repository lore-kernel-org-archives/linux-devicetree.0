From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v2 4/6] dt-bindings: net: mvneta: add phys property
Date: Thu, 07 Feb 2019 16:19:21 +0000
Message-ID: <E1grmOX-0000N4-1N@rmk-PC.armlinux.org.uk>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add an optional phys property to the mvneta binding documentation for
the common phy.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
index bedcfd5a52cd..691f886cfc4a 100644
--- a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
+++ b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
@@ -19,7 +19,7 @@
   "marvell,armada-370-neta" and 9800B for others.
 - clock-names: List of names corresponding to clocks property; shall be
   "core" for core clock and "bus" for the optional bus clock.
-
+- phys: comphy for the ethernet port, see ../phy/phy-bindings.txt
 
 Optional properties (valid only for Armada XP/38x):
 
-- 
2.7.4

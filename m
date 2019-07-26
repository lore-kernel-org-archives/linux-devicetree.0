From: Marek Vasut <marex@denx.de>
Subject: [PATCH V3 1/3] dt-bindings: net: dsa: ksz: document Microchip KSZ87xx family switches
Date: Fri, 26 Jul 2019 18:23:06 +0200
Message-ID: <20190726162308.16764-2-marex@denx.de>
References: <20190726162308.16764-1-marex@denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726162308.16764-1-marex@denx.de>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>, Vivien Didelot <vivien.didelot@gmail.com>, Woojung Huh <woojung.huh@microchip.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document Microchip KSZ87xx family switches. These include
KSZ8765 - 5 port switch
KSZ8794 - 4 port switch
KSZ8795 - 5 port switch

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: David S. Miller <davem@davemloft.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Tristram Ha <Tristram.Ha@microchip.com>
Cc: Vivien Didelot <vivien.didelot@gmail.com>
Cc: Woojung Huh <woojung.huh@microchip.com>
Cc: devicetree@vger.kernel.org
---
V2: No change
V3: No change
---
 Documentation/devicetree/bindings/net/dsa/ksz.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 4ac21cef370e..5e8429b6f9ca 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -5,6 +5,9 @@ Required properties:
 
 - compatible: For external switch chips, compatible string must be exactly one
   of the following:
+  - "microchip,ksz8765"
+  - "microchip,ksz8794"
+  - "microchip,ksz8795"
   - "microchip,ksz9477"
   - "microchip,ksz9897"
   - "microchip,ksz9896"
-- 
2.20.1

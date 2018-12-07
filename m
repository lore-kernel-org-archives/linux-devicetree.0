From: Marek Vasut <marex@denx.de>
Subject: [PATCH] net: dsa: Add optional reset GPIO to Microchip KSZ switch binding
Date: Fri,  7 Dec 2018 22:57:43 +0100
Message-ID: <20181207215743.9629-1-marex@denx.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Add optional reset GPIO, as such a signal is available on the KSZ switches.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Woojung Huh <Woojung.Huh@microchip.com>
Cc: David S. Miller <davem@davemloft.net>
---
 Documentation/devicetree/bindings/net/dsa/ksz.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index ac145b885e955..0f407fb371ce1 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -8,6 +8,10 @@ Required properties:
   - "microchip,ksz9477"
   - "microchip,ksz9897"
 
+Optional properties:
+
+- reset-gpios		: Should be a gpio specifier for a reset line
+
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required and optional properties.
 
-- 
2.18.0

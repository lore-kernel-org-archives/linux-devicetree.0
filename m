From: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 RESEND 1/2] net: dsa: ksz: Add optional reset GPIO to Microchip KSZ switch binding
Date: Mon, 10 Dec 2018 14:43:05 +0100
Message-ID: <20181210134306.8786-2-marex@denx.de>
References: <20181210134306.8786-1-marex@denx.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181210134306.8786-1-marex@denx.de>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Add optional reset GPIO, as such a signal is available on the KSZ switches.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Woojung Huh <Woojung.Huh@microchip.com>
Cc: David S. Miller <davem@davemloft.net>
---
V2: No change
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

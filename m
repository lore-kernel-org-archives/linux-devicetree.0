Return-Path: <SRS0=BtsV=GC=ni.com=prvs=260901fb48=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v4 net-next 4/4] Documentation: macb: Document phy-handle binding
Date: Mon, 12 Mar 2018 16:34:35 -0500
Message-ID: <20180312213435.115174-5-brad.mouring@ni.com>
In-Reply-To: <20180312213435.115174-1-brad.mouring@ni.com>
References: <20180312175956.GS27783@lunn.ch>
 <20180312213435.115174-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org, Brad Mouring <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

Document the existance of the optional binding, directing to the
general ethernet document that describes this binding.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/net/macb.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 27966ae741e0..457d5ae16f23 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -29,6 +29,7 @@ Optional properties for PHY child node:
 - reset-gpios : Should specify the gpio for phy reset
 - magic-packet : If present, indicates that the hardware supports waking
   up via magic packet.
+- phy-handle : see ethernet.txt file in the same directory
 
 Examples:
 
-- 
2.16.2

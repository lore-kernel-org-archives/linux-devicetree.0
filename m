Return-Path: <SRS0=Pv+M=F7=ni.com=prvs=26060a5556=brad.mouring@kernel.org>
From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH v2 net-next 3/3] Documentation: macb: Document phy-handle optional binding
Date: Fri, 9 Mar 2018 16:12:33 -0600
Message-ID: <20180309221233.71202-3-brad.mouring@ni.com>
In-Reply-To: <20180309221233.71202-1-brad.mouring@ni.com>
References: <20180308173247.GA22340@lunn.ch>
 <20180309221233.71202-1-brad.mouring@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, "Michael Grzeschik  <m.grzeschik@pengutronix.de>, Andrew Lunn" <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, "Julia Cartwright  <julia@ni.com>, <devicetree@vger.kernel.org>, Brad Mouring" <brad.mouring@ni.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
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

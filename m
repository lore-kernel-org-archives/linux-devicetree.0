From: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH 2/2] Documentation: macb: Document phy-handle optional binding
Date: Wed, 7 Mar 2018 16:42:57 -0600
Message-ID: <20180307224257.1959-2-brad.mouring@ni.com>
References: <20180307224257.1959-1-brad.mouring@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307224257.1959-1-brad.mouring@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, Julia Cartwright <julia@ni.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brad Mouring <brad.mouring@ni.com>
List-Id: devicetree@vger.kernel.org

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

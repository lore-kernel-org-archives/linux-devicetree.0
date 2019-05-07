Return-Path: <SRS0=QtQs=TH=geanix.com=sean@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 2/2] dt-bindings: can: mcp251x: add mcp25625 support
Date: Tue,  7 May 2019 11:34:37 +0200
Message-Id: <20190507093437.26025-2-sean@geanix.com>
In-Reply-To: <20190507093437.26025-1-sean@geanix.com>
References: <20190507093437.26025-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, mkl@pengutronix.de
Cc: Sean Nyekjaer <sean@geanix.com>, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

Fully compatible with mcp2515, the mcp25625 have
integrated transceiver.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt b/Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt
index 188c8bd4eb67..5a0111d4de58 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt
+++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251x.txt
@@ -4,6 +4,7 @@ Required properties:
  - compatible: Should be one of the following:
    - "microchip,mcp2510" for MCP2510.
    - "microchip,mcp2515" for MCP2515.
+   - "microchip,mcp25625" for MCP25625.
  - reg: SPI chip select.
  - clocks: The clock feeding the CAN controller.
  - interrupts: Should contain IRQ line for the CAN controller.
-- 
2.21.0

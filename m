Return-Path: <SRS0=QtQs=TH=geanix.com=sean@kernel.org>
From: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH 1/2] can: mcp251x: add support for mcp25625
Date: Tue,  7 May 2019 11:34:36 +0200
Message-Id: <20190507093437.26025-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, mkl@pengutronix.de
Cc: Sean Nyekjaer <sean@geanix.com>, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

Fully compatible with mcp2515, the mcp25625 have
integrated transceiver.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/net/can/spi/mcp251x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index e90817608645..4113621569d2 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -1006,6 +1006,10 @@ static const struct of_device_id mcp251x_of_match[] = {
 		.compatible	= "microchip,mcp2515",
 		.data		= (void *)CAN_MCP251X_MCP2515,
 	},
+	{
+		.compatible	= "microchip,mcp25625",
+		.data		= (void *)CAN_MCP251X_MCP2515,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mcp251x_of_match);
@@ -1019,6 +1023,10 @@ static const struct spi_device_id mcp251x_id_table[] = {
 		.name		= "mcp2515",
 		.driver_data	= (kernel_ulong_t)CAN_MCP251X_MCP2515,
 	},
+	{
+		.name		= "mcp25625",
+		.driver_data	= (kernel_ulong_t)CAN_MCP251X_MCP2515,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, mcp251x_id_table);
-- 
2.21.0

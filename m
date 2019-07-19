Return-Path: <SRS0=OQoQ=VQ=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/3] Revert "usb: usb251xb: Add US port lanes inversion property"
Date: Fri, 19 Jul 2019 10:44:06 +0200
Message-Id: <20190719084407.28041-2-l.stach@pengutronix.de>
In-Reply-To: <20190719084407.28041-1-l.stach@pengutronix.de>
References: <20190719084407.28041-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Serge Semin <fancer.lancer@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

This property isn't needed and not yet used anywhere. The swap-dx-lanes
property is perfectly fine for doing the swap on the upstream port
lanes.

CC: stable@vger.kernel.org #5.2
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 4d6ae3795a88..119aeb658c81 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -574,8 +574,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	hub->port_swap = USB251XB_DEF_PORT_SWAP;
 	usb251xb_get_ports_field(hub, "swap-dx-lanes", data->port_cnt,
 				 &hub->port_swap);
-	if (of_get_property(np, "swap-us-lanes", NULL))
-		hub->port_swap |= BIT(0);
 
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
-- 
2.20.1

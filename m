From: Jan Kotas <jank@cadence.com>
Subject: [PATCH 2/3] media: Add lane checks for Cadence CSI2RX
Date: Thu, 25 Jul 2019 11:26:47 +0100
Message-ID: <20190725102648.13445-3-jank@cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds lane checks for CSI2RX, to prevent clock lane
being used as a data lane.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 31ace114e..97ec09e72 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -2,7 +2,7 @@
 /*
  * Driver for Cadence MIPI-CSI2 RX Controller v1.3
  *
- * Copyright (C) 2017 Cadence Design Systems Inc.
+ * Copyright (C) 2017-2019 Cadence Design Systems Inc.
  */
 
 #include <linux/clk.h>
@@ -364,7 +364,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	struct fwnode_handle *fwh;
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 
 	ep = of_graph_get_endpoint_by_regs(csi2rx->dev->of_node, 0, 0);
 	if (!ep)
@@ -395,6 +395,15 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
 		return -EINVAL;
 	}
 
+	for (i = 0; i < csi2rx->num_lanes; i++) {
+		if (csi2rx->lanes[i] < 1) {
+			dev_err(csi2rx->dev, "Invalid lane[%d] number: %u\n",
+				i, csi2rx->lanes[i]);
+			of_node_put(ep);
+			return -EINVAL;
+		}
+	}
+
 	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
 	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
 	of_node_put(ep);
-- 
2.15.0

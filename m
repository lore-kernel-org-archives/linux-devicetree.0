From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 2/4] media: Add lane checks for Cadence CSI2TX
Date: Mon, 22 Jul 2019 09:22:21 +0100
Message-ID: <20190722082223.18693-3-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds lane checks for CSI2TX, to prevent clock lane
being used as a data lane.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 5042d053b..232259c71 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -2,7 +2,7 @@
 /*
  * Driver for Cadence MIPI-CSI2 TX Controller
  *
- * Copyright (C) 2017-2018 Cadence Design Systems Inc.
+ * Copyright (C) 2017-2019 Cadence Design Systems Inc.
  */
 
 #include <linux/clk.h>
@@ -434,7 +434,7 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 {
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	struct device_node *ep;
-	int ret;
+	int ret, i;
 
 	ep = of_graph_get_endpoint_by_regs(csi2tx->dev->of_node, 0, 0);
 	if (!ep)
@@ -461,6 +461,15 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 		goto out;
 	}
 
+	for (i = 0; i < csi2tx->num_lanes; i++) {
+		if (v4l2_ep.bus.mipi_csi2.data_lanes[i] < 1) {
+			dev_err(csi2tx->dev, "Invalid lane[%d] number: %u\n",
+				i, v4l2_ep.bus.mipi_csi2.data_lanes[i]);
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
 	memcpy(csi2tx->lanes, v4l2_ep.bus.mipi_csi2.data_lanes,
 	       sizeof(csi2tx->lanes));
 
-- 
2.15.0

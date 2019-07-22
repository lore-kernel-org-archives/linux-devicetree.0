From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 3/4] media: Fix Lane mapping in Cadence CSI2TX
Date: Mon, 22 Jul 2019 09:22:22 +0100
Message-ID: <20190722082223.18693-4-jank@cadence.com>
References: <20190722082223.18693-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722082223.18693-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch fixes mapping of lanes in DPHY_CFG register
of the controller. In the register, bit 0 means first data lane.
In Linux we currently assume lane 0 is clock.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 232259c71..c72c8a065 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -236,7 +236,7 @@ static int csi2tx_start(struct csi2tx_priv *csi2tx)
 	/* Put our lanes (clock and data) out of reset */
 	reg = CSI2TX_DPHY_CFG_CLK_RESET | CSI2TX_DPHY_CFG_MODE_LPDT;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
@@ -244,7 +244,7 @@ static int csi2tx_start(struct csi2tx_priv *csi2tx)
 	/* Enable our (clock and data) lanes */
 	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
-- 
2.15.0

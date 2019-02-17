Return-Path: <SRS0=whS5=QY=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V6 9/9] can: mcp25xxfd: optimize reception of big CanFD frame reception with BRS
Date: Sun, 17 Feb 2019 11:02:02 +0000
Message-Id: <20190217110202.31986-10-kernel@martin.sperl.org>
In-Reply-To: <20190217110202.31986-1-kernel@martin.sperl.org>
References: <20190217110202.31986-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

In case of predicted DLC=15 and in case at least 33% of those are
sent via BRS be aggressive and use bulk fifo reads to avoid missing
any frames due to releasing FIFOs not as fast as possible.

This would be of most impact when having a 1MHz Can Bus with
a 8MHz data bitrate.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

---
Changelog:
  V5->V6: new with this patchset version

---
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h |  1 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 48 +++++++++++++++-------
 2 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
index 1a48e801065d..eeb9c88c7e97 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
@@ -178,6 +178,7 @@ struct mcp25xxfd_can_priv {
 	struct {
 #define MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE 32
 		u8 dlc[MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE];
+		u8 brs[MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE];
 		u8 index;
 		u32 predicted_len;
 	} rx_history;
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
index e2102aa00578..11bf12461e58 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
@@ -104,6 +104,8 @@ int mcp25xxfd_can_rx_submit_frame(struct mcp25xxfd_can_priv *cpriv, int fifo)

 	/* add to rx_history */
 	cpriv->rx_history.dlc[cpriv->rx_history.index] = dlc;
+	cpriv->rx_history.brs[cpriv->rx_history.index] =
+		(rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_BRS) ? CANFD_BRS : 0;
 	cpriv->rx_history.index++;
 	if (cpriv->rx_history.index >= MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE)
 		cpriv->rx_history.index = 0;
@@ -395,19 +397,10 @@ static int mcp25xxfd_can_rx_predict_prefetch(struct mcp25xxfd_can_priv *cpriv)
  * reading multiple rx fifos is a realistic option of optimization
  */

-/* right now we only optimize for sd (can2.0) frame case,
- * but in principle it could be also be valuable for CANFD
- * frames when we receive lots of 64 byte packets with BRS set
- * and a big difference between nominal and data bitrates
- */
-
-int mcp25xxfd_can_rx_read_fd_frames(struct mcp25xxfd_can_priv *cpriv)
+static int mcp25xxfd_can_rx_read_single_frames(struct mcp25xxfd_can_priv *cpriv,
+					       int prefetch)
 {
-	int i, f, prefetch;
-	int ret;
-
-	/* calculate optimal prefetch to use */
-	prefetch = mcp25xxfd_can_rx_predict_prefetch(cpriv);
+	int i, f, ret;

 	/* loop all frames */
 	for (i = 0, f = cpriv->fifos.rx.start; i < cpriv->fifos.rx.count;
@@ -424,7 +417,7 @@ int mcp25xxfd_can_rx_read_fd_frames(struct mcp25xxfd_can_priv *cpriv)
 	return 0;
 }

-static int mcp25xxfd_can_rx_read_sd_frames(struct mcp25xxfd_can_priv *cpriv)
+static int mcp25xxfd_can_rx_read_bulk_frames(struct mcp25xxfd_can_priv *cpriv)
 {
 	int i, start, end;
 	int ret;
@@ -447,12 +440,39 @@ static int mcp25xxfd_can_rx_read_sd_frames(struct mcp25xxfd_can_priv *cpriv)
 	return 0;
 }

+static int mcp25xxfd_can_rx_read_fd_frames(struct mcp25xxfd_can_priv *cpriv)
+{
+	int i, count_dlc15, count_brs, prefetch;
+
+	/* get a prediction on prefetch */
+	prefetch = mcp25xxfd_can_rx_predict_prefetch(cpriv);
+
+	/* if the prefetch is < 64 then just read single */
+	if (prefetch < 64)
+		return mcp25xxfd_can_rx_read_single_frames(cpriv, prefetch);
+
+	/* check if we have mostly brs frames of those DLC=15 frames */
+	for (i = 0, count_brs = 0, count_dlc15 = 0;
+	     i < MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE; i++)
+		if (cpriv->rx_history.dlc[i] == 15) {
+			count_dlc15++;
+			if (cpriv->rx_history.brs[i])
+				count_brs++;
+		}
+
+	/* if we have at least 33% brs frames then run bulk */
+	if (count_brs * 3 >= count_dlc15)
+		return mcp25xxfd_can_rx_read_bulk_frames(cpriv);
+	else
+		return mcp25xxfd_can_rx_read_single_frames(cpriv, prefetch);
+}
+
 static int mcp25xxfd_can_rx_read_frames(struct mcp25xxfd_can_priv *cpriv)
 {
 	if (cpriv->can.dev->mtu == CANFD_MTU)
 		return mcp25xxfd_can_rx_read_fd_frames(cpriv);
 	else
-		return mcp25xxfd_can_rx_read_sd_frames(cpriv);
+		return mcp25xxfd_can_rx_read_bulk_frames(cpriv);
 }

 int mcp25xxfd_can_rx_handle_int_rxif(struct mcp25xxfd_can_priv *cpriv)
--
2.11.0

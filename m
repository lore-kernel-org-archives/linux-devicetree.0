Return-Path: <SRS0=5lt5=Q4=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V7 09/10] can: mcp25xxfd: add prediction of CanFD frames sizes based on history
Date: Thu, 21 Feb 2019 21:07:35 +0000
Message-Id: <20190221210736.640-10-kernel@martin.sperl.org>
In-Reply-To: <20190221210736.640-1-kernel@martin.sperl.org>
References: <20190221210736.640-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Allow prediction of can frame sizes based on the last 32 Can Frames
received.

Naive histogram approach hast been taken for now.

Some simple stats based on 1000 frames received with DLC=6:
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads_prefetched_too_few
16
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads_prefetched_too_few_bytes
96
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads_prefetched_too_many
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads_prefetched_too_many_bytes
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads_prefetch_predicted
6

The first 16 frames are predicted as 0, but after that the prediction is 6.

It should be possible to take this prediction to use bulk reads for CanFD
as well when we have a prediction of length of 48 or 64.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c  |  4 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h |  8 ++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 45 ++++++++++++++++++++--
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
index 56b8d38b756d..d2caf82a6b3e 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
@@ -103,6 +103,10 @@ static void mcp25xxfd_can_debugfs_stats(struct mcp25xxfd_can_priv *cpriv,
 	snprintf(name, sizeof(name), "rx_bulk_reads_%i+", i + 1);
 	debugfs_create_u64(name, 0444, dir,
 			   &cpriv->stats.rx_bulk_read_sizes[i]);
+
+	if (cpriv->can.dev->mtu == CANFD_MTU)
+		debugfs_create_u32("rx_reads_prefetch_predicted_len", 0444,
+				   dir, &cpriv->rx_history.predicted_len);
 #undef DEBUGFS_CREATE
 }

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
index cae22cc02795..1a48e801065d 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
@@ -174,6 +174,14 @@ struct mcp25xxfd_can_priv {
 	} stats;
 #endif /* CONFIG_DEBUG_FS */

+	/* history of rx-dlc */
+	struct {
+#define MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE 32
+		u8 dlc[MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE];
+		u8 index;
+		u32 predicted_len;
+	} rx_history;
+
 	/* bus state */
 	struct {
 		u32 state;
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
index ee52d2ba74a5..e2102aa00578 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
@@ -102,6 +102,12 @@ int mcp25xxfd_can_rx_submit_frame(struct mcp25xxfd_can_priv *cpriv, int fifo)
 	if (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_FDF)
 		MCP25XXFD_DEBUGFS_INCR(cpriv->fifos.rx.fd_count);

+	/* add to rx_history */
+	cpriv->rx_history.dlc[cpriv->rx_history.index] = dlc;
+	cpriv->rx_history.index++;
+	if (cpriv->rx_history.index >= MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE)
+		cpriv->rx_history.index = 0;
+
 	/* allocate the skb buffer */
 	if (rx->flags & MCP25XXFD_CAN_OBJ_FLAGS_FDF) {
 		flags = 0;
@@ -237,6 +243,40 @@ static int mcp25xxfd_can_read_rx_frame_bulk(struct mcp25xxfd_can_priv *cpriv,
 	return 0;
 }

+/* predict dlc size based on historic behaviour */
+static int mcp25xxfd_can_rx_predict_prefetch(struct mcp25xxfd_can_priv *cpriv)
+{
+	int dlc, i, top;
+	u8 histo[16];
+
+	/* if we have a prfecth set then use that one */
+	if (rx_prefetch_bytes != -1)
+		return min_t(int, rx_prefetch_bytes,
+			     (cpriv->can.dev->mtu == CANFD_MTU) ? 64 : 8);
+
+	/* memset */
+	memset(histo, 0, sizeof(histo));
+
+	/* for all others compute the histogram */
+	for (i = 0; i < MCP25XXFD_CAN_RX_DLC_HISTORY_SIZE; i++)
+		histo[cpriv->rx_history.dlc[i]]++;
+
+	/* and now find the highest fit */
+	for (i = (cpriv->can.dev->mtu == CANFD_MTU) ? 15 : 8, dlc = 8, top = 0;
+	      i >= 0; i--) {
+		if (top < histo[i]) {
+			top = histo[i];
+			dlc = i;
+		}
+	}
+
+	/* compute length from dlc */
+	cpriv->rx_history.predicted_len = can_dlc2len(dlc);
+
+	/* return the predicted length */
+	return cpriv->rx_history.predicted_len;
+}
+
 /* at least in can2.0 mode we can read multiple RX-fifos in one go
  * in case they are ajactent to each other and thus we can reduce
  * the number of spi messages produced and this improves spi-bus
@@ -367,10 +407,7 @@ int mcp25xxfd_can_rx_read_fd_frames(struct mcp25xxfd_can_priv *cpriv)
 	int ret;

 	/* calculate optimal prefetch to use */
-	if (rx_prefetch_bytes != -1)
-		prefetch = min_t(int, rx_prefetch_bytes, 64);
-	else
-		prefetch = 8;
+	prefetch = mcp25xxfd_can_rx_predict_prefetch(cpriv);

 	/* loop all frames */
 	for (i = 0, f = cpriv->fifos.rx.start; i < cpriv->fifos.rx.count;
--
2.11.0

Return-Path: <SRS0=whS5=QY=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V6 6/9] can: mcp25xxfd: optimize TEF reads reading multiple TEFs in one go
Date: Sun, 17 Feb 2019 11:01:59 +0000
Message-Id: <20190217110202.31986-7-kernel@martin.sperl.org>
In-Reply-To: <20190217110202.31986-1-kernel@martin.sperl.org>
References: <20190217110202.31986-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

To reduce the amount of spi_messages send this patch optimizes the
read TEF so that multiple TEFs are read together.

Statistics in debugfs show for 100000 DLC=0 can messages sent:
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_conservative_reads
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads
44691
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_1
1862
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_2
30349
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_3
12480
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_4
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_5
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_6
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_7
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_optimized_reads_8+
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_reads
100000
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/tef_read_splits
0

So to read all of those 100000 TEF frames to read we formerly have
scheduled 100000 spi_messages.
While with this patch we have only scheduled 44691 spi_messages, so
only 44.6% of the former value.
This also means we have not been transferring 110618 (=2*30349+2*2*12480)
unnecessary command bytes over the SPI bus.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>

---

Changelog:
  V5->V6: new with this patchset version

---
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c  | 18 +++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h |  7 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c   | 85 +++++++++++++++++++---
 3 files changed, 101 insertions(+), 9 deletions(-)

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
index 4f7d5d8633c3..90034ea21c49 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
@@ -43,6 +43,9 @@ static void mcp25xxfd_can_debugfs_stats(struct mcp25xxfd_can_priv *cpriv,
 					struct dentry *root)
 {
 	struct dentry *dir = debugfs_create_dir("stats", root);
+	char name[32];
+	u64 *data;
+	int i;

 # define DEBUGFS_CREATE(name, var) debugfs_create_u64(name, 0444, dir, \
 						      &cpriv->stats.var)
@@ -62,6 +65,21 @@ static void mcp25xxfd_can_debugfs_stats(struct mcp25xxfd_can_priv *cpriv,
 	DEBUGFS_CREATE("int_rx_invalid_message", int_ivm_count);
 	DEBUGFS_CREATE("int_crcerror",		 int_cerr_count);

+	DEBUGFS_CREATE("tef_reads",		 tef_reads);
+	DEBUGFS_CREATE("tef_conservative_reads", tef_conservative_reads);
+	DEBUGFS_CREATE("tef_optimized_reads",	 tef_optimized_reads);
+	DEBUGFS_CREATE("tef_read_splits",	 tef_read_splits);
+
+	for (i = 0; i < MCP25XXFD_CAN_TEF_READ_BINS - 1; i++) {
+		snprintf(name, sizeof(name),
+			 "tef_optimized_reads_%i", i + 1);
+		data = &cpriv->stats.tef_optimized_read_sizes[i];
+		debugfs_create_u64(name, 0444, dir, data);
+	}
+	snprintf(name, sizeof(name), "tef_optimized_reads_%i+", i + 1);
+	debugfs_create_u64(name, 0444, dir,
+			   &cpriv->stats.tef_optimized_read_sizes[i]);
+
 	DEBUGFS_CREATE("tx_frames_fd",		 tx_fd_count);
 	DEBUGFS_CREATE("tx_frames_brs",		 tx_brs_count);

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
index 5727d4608dfd..766bec350e1e 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
@@ -155,6 +155,13 @@ struct mcp25xxfd_can_priv {
 		u64 tx_fd_count;
 		u64 tx_brs_count;

+		u64 tef_reads;
+		u64 tef_read_splits;
+		u64 tef_conservative_reads;
+		u64 tef_optimized_reads;
+#define MCP25XXFD_CAN_TEF_READ_BINS 8
+		u64 tef_optimized_read_sizes[MCP25XXFD_CAN_TEF_READ_BINS];
+
 		u64 rx_reads;
 		u64 rx_reads_prefetched_too_few;
 		u64 rx_reads_prefetched_too_few_bytes;
diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
index 0d08bc9768d9..13cb898247fe 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
@@ -233,21 +233,62 @@ void mcp25xxfd_can_tx_queue_restart(struct mcp25xxfd_can_priv *cpriv)
 }

 static
-int mcp25xxfd_can_tx_handle_int_tefif_fifo(struct mcp25xxfd_can_priv *cpriv)
+int mcp25xxfd_can_tx_tef_read(struct mcp25xxfd_can_priv *cpriv,
+			      int start, int count)
 {
-	u32 tef_offset = cpriv->fifos.tef.index * cpriv->fifos.tef.size;
+	u32 tef_offset = start * cpriv->fifos.tef.size;
 	struct mcp25xxfd_can_obj_tef *tef =
 		(struct mcp25xxfd_can_obj_tef *)(cpriv->sram + tef_offset);
-	int fifo, ret;
-	unsigned long flags;
+	int last, read, ret;

-	/* read the next TEF entry to get the transmit timestamp and fifo */
+	/* compute how many we can read in one go */
+	last = start + count;
+	read = (last > cpriv->fifos.tef.count) ?
+		(cpriv->fifos.tef.count - start) :
+		count;
+
+	/* and read it */
 	ret = mcp25xxfd_cmd_read_regs(cpriv->priv->spi,
 				      MCP25XXFD_SRAM_ADDR(tef_offset),
-				      &tef->id, sizeof(*tef));
+				      &tef->id, sizeof(*tef) * read);
 	if (ret)
 		return ret;

+	/* and read a second part on wrap */
+	if (read != count) {
+		/* update stats */
+		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, tef_read_splits);
+		/* compute the addresses  */
+		read = count - read;
+		tef = (struct mcp25xxfd_can_obj_tef *)(cpriv->sram);
+		/* and read again */
+		ret = mcp25xxfd_cmd_read_regs(cpriv->priv->spi,
+					      MCP25XXFD_SRAM_ADDR(0),
+					      &tef->id,
+					      sizeof(*tef) * read);
+	}
+
+	return ret;
+}
+
+static
+int mcp25xxfd_can_tx_handle_int_tefif_fifo(struct mcp25xxfd_can_priv *cpriv,
+					   bool read_data)
+{
+	u32 tef_offset = cpriv->fifos.tef.index * cpriv->fifos.tef.size;
+	struct mcp25xxfd_can_obj_tef *tef =
+		(struct mcp25xxfd_can_obj_tef *)(cpriv->sram + tef_offset);
+	int fifo, ret;
+	unsigned long flags;
+
+	/* read the next TEF entry to get the transmit timestamp and fifo */
+	if (read_data) {
+		ret = mcp25xxfd_can_tx_tef_read(cpriv,
+						cpriv->fifos.tef.index, 1);
+		if (ret)
+			return ret;
+	}
+
 	/* get the fifo from tef */
 	fifo = (tef->flags & MCP25XXFD_CAN_OBJ_FLAGS_SEQ_MASK) >>
 		MCP25XXFD_CAN_OBJ_FLAGS_SEQ_SHIFT;
@@ -260,6 +301,9 @@ int mcp25xxfd_can_tx_handle_int_tefif_fifo(struct mcp25xxfd_can_priv *cpriv)
 			   fifo, tef->id, tef->flags, tef->ts);
 	spin_unlock_irqrestore(&cpriv->fifos.tx_queue->lock, flags);

+	/* update stats */
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, tef_reads);
+
 	/* now we can schedule the fifo for echo submission */
 	mcp25xxfd_can_queue_frame(cpriv, fifo, tef->ts, false);

@@ -296,10 +340,12 @@ mcp25xxfd_can_tx_handle_int_tefif_conservative(struct mcp25xxfd_can_priv *cpriv)
 	/* read the tef in an inefficient loop */
 	while (tefsta & MCP25XXFD_CAN_TEFSTA_TEFNEIF) {
 		/* read one tef */
-		ret = mcp25xxfd_can_tx_handle_int_tefif_fifo(cpriv);
+		ret = mcp25xxfd_can_tx_handle_int_tefif_fifo(cpriv, true);
 		if (ret)
 			return ret;

+		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, tef_conservative_reads);
+
 		/* read the TEF status */
 		ret = mcp25xxfd_cmd_read_mask(cpriv->priv->spi,
 					      MCP25XXFD_CAN_TEFSTA, &tefsta,
@@ -315,13 +361,34 @@ static int
 mcp25xxfd_can_tx_handle_int_tefif_optimized(struct mcp25xxfd_can_priv *cpriv,
 					    u32 finished)
 {
-	int i, fifo, ret;
+	int i, fifo, count, ret;
+
+	/* count the number of fifos that have terminated */
+	for (i = 0, fifo = cpriv->fifos.tx.start, count = 0;
+	     i < cpriv->fifos.tx.count; i++, fifo++)
+		if (finished & BIT(fifo))
+			count++;
+
+	/* read them in one go if possible
+	 * we also assume that we have count(TEF) >= count(TX-FIFOS)
+	 * this may require 2 reads when we wrap arround
+	 * (that is unless count(TEF) == count(TX-FIFOS))
+	 */
+	ret = mcp25xxfd_can_tx_tef_read(cpriv, cpriv->fifos.tef.index, count);
+	if (ret)
+		return ret;
+
+	/* update stats */
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, tef_optimized_reads);
+	i = min_t(int, MCP25XXFD_CAN_TEF_READ_BINS - 1, count - 1);
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, tef_optimized_read_sizes[i]);

 	/* now iterate those */
 	for (i = 0, fifo = cpriv->fifos.tx.start; i < cpriv->fifos.tx.count;
 	     i++, fifo++) {
 		if (finished & BIT(fifo)) {
-			ret = mcp25xxfd_can_tx_handle_int_tefif_fifo(cpriv);
+			ret = mcp25xxfd_can_tx_handle_int_tefif_fifo(cpriv,
+								     false);
 			if (ret)
 				return ret;
 		}
--
2.11.0

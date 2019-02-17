Return-Path: <SRS0=whS5=QY=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V6 7/9] can: mcp25xxfd: optimize SPI reads of FIFOs in can2.0 mode
Date: Sun, 17 Feb 2019 11:02:00 +0000
Message-Id: <20190217110202.31986-8-kernel@martin.sperl.org>
In-Reply-To: <20190217110202.31986-1-kernel@martin.sperl.org>
References: <20190217110202.31986-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

To reduce the amount of spi_messages send this patch optimizes the
read of RX fifos so that multiple Fifos are read together.

This only works well in CAN2.0 mode where the overhead of prefetching
8 bytes (even if the actual length is 0) is negligable compared
to the SPI-framework overhead.

Statistics in debugfs show for 1000000 DLC=0 can messages received:
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads <==
355411
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_1 <==
92778
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_2 <==
7133
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_3 <==
130390
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_4 <==
123807
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_5 <==
1266
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_6 <==
34
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_7 <==
1
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_bulk_reads_8+ <==
0
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/rx_reads <==
999999
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/int_system_error <==
1
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/int_system_error_rx <==
1
==> /sys/kernel/debug/mcp25xxfd-spi0.0/can/stats/int_system_error_tx <==
0

There was one SERR error where we lost one can frame during the handling
of the error condition.

So to read all of those 999999 RX fifos we formerly have scheduled
999999 spi_messages.

With this patch we have only scheduled 355411 spi_messages, so
only 35.5% of the former value.

This also means we have not been transferring 1289176 (=2*(999999-355411))
unnecessary command bytes over the SPI bus.

As we have been issuing less SPI transfers reading SRAM this
also has reduced the likleyhood of SERR happening - it does not
solve the complete issue as seen above.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
Changelog:
  V5->V6: new with this patchset version

---
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c  | 11 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h |  4 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 96 +++++++++++++++++++---
 3 files changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
index 90034ea21c49..56b8d38b756d 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
@@ -92,6 +92,17 @@ static void mcp25xxfd_can_debugfs_stats(struct mcp25xxfd_can_priv *cpriv,
 		       rx_reads_prefetched_too_many);
 	DEBUGFS_CREATE("rx_reads_prefetched_too_many_bytes",
 		       rx_reads_prefetched_too_many_bytes);
+	DEBUGFS_CREATE("rx_single_reads",	 rx_single_reads);
+	DEBUGFS_CREATE("rx_bulk_reads",		 rx_bulk_reads);
+
+	for (i = 0; i < MCP25XXFD_CAN_RX_BULK_READ_BINS - 1; i++) {
+		snprintf(name, sizeof(name), "rx_bulk_reads_%i", i + 1);
+		data = &cpriv->stats.rx_bulk_read_sizes[i];
+		debugfs_create_u64(name, 0444, dir, data);
+	}
+	snprintf(name, sizeof(name), "rx_bulk_reads_%i+", i + 1);
+	debugfs_create_u64(name, 0444, dir,
+			   &cpriv->stats.rx_bulk_read_sizes[i]);
 #undef DEBUGFS_CREATE
 }

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
index 766bec350e1e..cae22cc02795 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
@@ -167,6 +167,10 @@ struct mcp25xxfd_can_priv {
 		u64 rx_reads_prefetched_too_few_bytes;
 		u64 rx_reads_prefetched_too_many;
 		u64 rx_reads_prefetched_too_many_bytes;
+		u64 rx_single_reads;
+		u64 rx_bulk_reads;
+#define MCP25XXFD_CAN_RX_BULK_READ_BINS 8
+		u64 rx_bulk_read_sizes[MCP25XXFD_CAN_RX_BULK_READ_BINS];
 	} stats;
 #endif /* CONFIG_DEBUG_FS */

diff --git a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
index 0974cf8b0c56..ee52d2ba74a5 100644
--- a/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
+++ b/drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
@@ -131,7 +131,7 @@ int mcp25xxfd_can_rx_submit_frame(struct mcp25xxfd_can_priv *cpriv, int fifo)
 }

 static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
-				       int fifo, int prefetch_bytes)
+				       int fifo, int prefetch_bytes, bool read)
 {
 	struct spi_device *spi = cpriv->priv->spi;
 	struct net_device *net = cpriv->can.dev;
@@ -142,10 +142,13 @@ static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
 	int len, ret;

 	/* we read the header plus prefetch_bytes */
-	ret = mcp25xxfd_cmd_readn(spi, MCP25XXFD_SRAM_ADDR(addr),
-				  rx, sizeof(*rx) + prefetch_bytes);
-	if (ret)
-		return ret;
+	if (read) {
+		cpriv->stats.rx_single_reads++;
+		ret = mcp25xxfd_cmd_readn(spi, MCP25XXFD_SRAM_ADDR(addr),
+					  rx, sizeof(*rx) + prefetch_bytes);
+		if (ret)
+			return ret;
+	}

 	/* transpose the headers to CPU format*/
 	rx->id = le32_to_cpu(rx->id);
@@ -158,7 +161,7 @@ static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
 	len = can_dlc2len(min_t(int, dlc, (net->mtu == CANFD_MTU) ? 15 : 8));

 	/* read the remaining data for canfd frames */
-	if (len > prefetch_bytes) {
+	if (read && len > prefetch_bytes) {
 		/* update stats */
 		MCP25XXFD_DEBUGFS_STATS_INCR(cpriv,
 					     rx_reads_prefetched_too_few);
@@ -200,6 +203,40 @@ static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
 					MCP25XXFD_CAN_FIFOCON_FRESET);
 }

+static int mcp25xxfd_can_read_rx_frame_bulk(struct mcp25xxfd_can_priv *cpriv,
+					    int fstart,
+					    int fend)
+{
+	struct net_device *net = cpriv->can.dev;
+	int count = abs(fend - fstart) + 1;
+	int flowest = min_t(int, fstart, fend);
+	int addr = cpriv->fifos.info[flowest].offset;
+	struct mcp25xxfd_can_obj_rx *rx =
+		(struct mcp25xxfd_can_obj_rx *)(cpriv->sram + addr);
+	int len = (sizeof(*rx) + ((net->mtu == CANFD_MTU) ? 64 : 8)) * count;
+	int fifo, i, ret;
+
+	/* update stats */
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, rx_bulk_reads);
+	i = min_t(int, MCP25XXFD_CAN_RX_BULK_READ_BINS - 1, count - 1);
+	MCP25XXFD_DEBUGFS_STATS_INCR(cpriv, rx_bulk_read_sizes[i]);
+
+	/* we read the header plus read_min data bytes */
+	ret = mcp25xxfd_cmd_readn(cpriv->priv->spi, MCP25XXFD_SRAM_ADDR(addr),
+				  rx, len);
+	if (ret)
+		return ret;
+
+	/* now process all of them - no need to read... */
+	for (fifo = fstart; count > 0; fifo ++, count--) {
+		ret = mcp25xxfd_can_rx_read_frame(cpriv, fifo, 8, false);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /* at least in can2.0 mode we can read multiple RX-fifos in one go
  * in case they are ajactent to each other and thus we can reduce
  * the number of spi messages produced and this improves spi-bus
@@ -318,24 +355,30 @@ static int mcp25xxfd_can_rx_read_frame(struct mcp25xxfd_can_priv *cpriv,
  * reading multiple rx fifos is a realistic option of optimization
  */

-int mcp25xxfd_can_rx_read_frames(struct mcp25xxfd_can_priv *cpriv)
+/* right now we only optimize for sd (can2.0) frame case,
+ * but in principle it could be also be valuable for CANFD
+ * frames when we receive lots of 64 byte packets with BRS set
+ * and a big difference between nominal and data bitrates
+ */
+
+int mcp25xxfd_can_rx_read_fd_frames(struct mcp25xxfd_can_priv *cpriv)
 {
 	int i, f, prefetch;
 	int ret;

 	/* calculate optimal prefetch to use */
 	if (rx_prefetch_bytes != -1)
-		prefetch = min_t(int, rx_prefetch_bytes,
-				 (cpriv->can.dev->mtu == CANFD_MTU) ? 64 : 8);
+		prefetch = min_t(int, rx_prefetch_bytes, 64);
 	else
 		prefetch = 8;

-	/* we can optimize here */
+	/* loop all frames */
 	for (i = 0, f = cpriv->fifos.rx.start; i < cpriv->fifos.rx.count;
 	     i++, f++) {
 		if (cpriv->status.rxif & BIT(f)) {
 			/* read the frame */
-			ret = mcp25xxfd_can_rx_read_frame(cpriv, f, prefetch);
+			ret = mcp25xxfd_can_rx_read_frame(cpriv, f,
+							  prefetch, true);
 			if (ret)
 				return ret;
 		}
@@ -344,6 +387,37 @@ int mcp25xxfd_can_rx_read_frames(struct mcp25xxfd_can_priv *cpriv)
 	return 0;
 }

+static int mcp25xxfd_can_rx_read_sd_frames(struct mcp25xxfd_can_priv *cpriv)
+{
+	int i, start, end;
+	int ret;
+
+	/* iterate over fifos trying to find fifos next to each other */
+	for (i = 0, start = cpriv->fifos.rx.start, end = start;
+	     i < cpriv->fifos.rx.count; i++, end++, start = end) {
+		/* if bit is not set then continue */
+		if (!(cpriv->status.rxif & BIT(start)))
+			continue;
+		/* find the last fifo with a bit set in sequence */
+		for (end = start; cpriv->status.rxif & BIT(end + 1); end++)
+			;
+		/* and now read those fifos in bulk */
+		ret = mcp25xxfd_can_read_rx_frame_bulk(cpriv, start, end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mcp25xxfd_can_rx_read_frames(struct mcp25xxfd_can_priv *cpriv)
+{
+	if (cpriv->can.dev->mtu == CANFD_MTU)
+		return mcp25xxfd_can_rx_read_fd_frames(cpriv);
+	else
+		return mcp25xxfd_can_rx_read_sd_frames(cpriv);
+}
+
 int mcp25xxfd_can_rx_handle_int_rxif(struct mcp25xxfd_can_priv *cpriv)
 {
 	if (!cpriv->status.rxif)
--
2.11.0

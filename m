Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH V3 2/4] firmware: tegra: refactor bpmp driver
Date: Thu, 24 Jan 2019 19:03:53 +0200
Message-ID: <1548349435-1086-3-git-send-email-talho@nvidia.com>
In-Reply-To: <1548349435-1086-1-git-send-email-talho@nvidia.com>
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jonathanh@nvidia.com, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Split bpmp driver into common and chip specific parts to facilitate
adding support for previous and future Tegra chips that are using bpmp
as co-processor.

Signed-off-by: Timo Alho <talho@nvidia.com>
---
 drivers/firmware/tegra/Makefile       |   1 +
 drivers/firmware/tegra/bpmp-private.h |  28 ++++
 drivers/firmware/tegra/bpmp-t186.c    | 303 ++++++++++++++++++++++++++++++++++
 drivers/firmware/tegra/bpmp.c         | 257 ++++++----------------------
 include/soc/tegra/bpmp.h              |  12 +-
 5 files changed, 393 insertions(+), 208 deletions(-)
 create mode 100644 drivers/firmware/tegra/bpmp-private.h
 create mode 100644 drivers/firmware/tegra/bpmp-t186.c

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 1b826dc..367d482 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -1,4 +1,5 @@
 tegra-bpmp-y			= bpmp.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-t186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
 obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
new file mode 100644
index 0000000..2354337
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, NVIDIA CORPORATION.
+ */
+
+#ifndef __FIRMWARE_TEGRA_BPMP_PRIVATE_H
+#define __FIRMWARE_TEGRA_BPMP_PRIVATE_H
+
+#include <soc/tegra/bpmp.h>
+
+struct tegra_bpmp_ops {
+	int (*init)(struct tegra_bpmp *bpmp);
+	void (*deinit)(struct tegra_bpmp *bpmp);
+	bool (*is_resp_ready)(struct tegra_bpmp_channel *channel);
+	bool (*is_req_ready)(struct tegra_bpmp_channel *channel);
+	int (*ack_resp)(struct tegra_bpmp_channel *channel);
+	int (*ack_req)(struct tegra_bpmp_channel *channel);
+	bool (*is_resp_channel_free)(struct tegra_bpmp_channel *channel);
+	bool (*is_req_channel_free)(struct tegra_bpmp_channel *channel);
+	int (*post_resp)(struct tegra_bpmp_channel *channel);
+	int (*post_req)(struct tegra_bpmp_channel *channel);
+	int (*ring_doorbell)(struct tegra_bpmp *bpmp);
+	int (*resume)(struct tegra_bpmp *bpmp);
+};
+
+extern struct tegra_bpmp_ops tegra186_bpmp_ops;
+
+#endif
diff --git a/drivers/firmware/tegra/bpmp-t186.c b/drivers/firmware/tegra/bpmp-t186.c
new file mode 100644
index 0000000..e425c6f
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-t186.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, NVIDIA CORPORATION.
+ */
+
+#include <linux/clk/tegra.h>
+#include <linux/genalloc.h>
+#include <linux/mailbox_client.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/semaphore.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/bpmp-abi.h>
+#include <soc/tegra/ivc.h>
+
+#include "bpmp-private.h"
+
+struct tegra186_bpmp {
+	struct tegra_bpmp *parent;
+
+	struct {
+		struct gen_pool *pool;
+		dma_addr_t phys;
+		void *virt;
+	} tx, rx;
+
+	struct {
+		struct mbox_client client;
+		struct mbox_chan *channel;
+	} mbox;
+};
+
+static inline struct tegra_bpmp *
+mbox_client_to_bpmp(struct mbox_client *client)
+{
+	struct tegra186_bpmp *priv;
+
+	priv = container_of(client, struct tegra186_bpmp, mbox.client);
+
+	return priv->parent;
+}
+
+static bool tegra186_bpmp_is_message_ready(struct tegra_bpmp_channel *channel)
+{
+	void *frame;
+
+	frame = tegra_ivc_read_get_next_frame(channel->ivc);
+	if (IS_ERR(frame)) {
+		channel->ib = NULL;
+		return false;
+	}
+
+	channel->ib = frame;
+
+	return true;
+}
+
+static bool tegra186_bpmp_is_channel_free(struct tegra_bpmp_channel *channel)
+{
+	void *frame;
+
+	frame = tegra_ivc_write_get_next_frame(channel->ivc);
+	if (IS_ERR(frame)) {
+		channel->ob = NULL;
+		return false;
+	}
+
+	channel->ob = frame;
+
+	return true;
+}
+
+static int tegra186_bpmp_ack_message(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_read_advance(channel->ivc);
+}
+
+static int tegra186_bpmp_post_message(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_write_advance(channel->ivc);
+}
+
+static int tegra186_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
+{
+	struct tegra186_bpmp *priv = bpmp->priv;
+	int err;
+
+	err = mbox_send_message(priv->mbox.channel, NULL);
+	if (err < 0)
+		return err;
+
+	mbox_client_txdone(priv->mbox.channel, 0);
+
+	return 0;
+}
+
+static void tegra186_bpmp_ivc_notify(struct tegra_ivc *ivc, void *data)
+{
+	struct tegra_bpmp *bpmp = data;
+	struct tegra186_bpmp *priv = bpmp->priv;
+
+	if (WARN_ON(priv->mbox.channel == NULL))
+		return;
+
+	tegra186_bpmp_ring_doorbell(bpmp);
+}
+
+static int tegra186_bpmp_channel_init(struct tegra_bpmp_channel *channel,
+				   struct tegra_bpmp *bpmp,
+				   unsigned int index)
+{
+	struct tegra186_bpmp *priv = bpmp->priv;
+	size_t message_size, queue_size;
+	unsigned int offset;
+	int err;
+
+	channel->ivc = devm_kzalloc(bpmp->dev, sizeof(*channel->ivc),
+				    GFP_KERNEL);
+	if (!channel->ivc)
+		return -ENOMEM;
+
+	message_size = tegra_ivc_align(MSG_MIN_SZ);
+	queue_size = tegra_ivc_total_queue_size(message_size);
+	offset = queue_size * index;
+
+	err = tegra_ivc_init(channel->ivc, NULL,
+			     priv->rx.virt + offset, priv->rx.phys + offset,
+			     priv->tx.virt + offset, priv->tx.phys + offset,
+			     1, message_size, tegra186_bpmp_ivc_notify,
+			     bpmp);
+	if (err < 0) {
+		dev_err(bpmp->dev, "failed to setup IVC for channel %u: %d\n",
+			index, err);
+		return err;
+	}
+
+	init_completion(&channel->completion);
+	channel->bpmp = bpmp;
+
+	return 0;
+}
+
+static void tegra186_bpmp_channel_reset(struct tegra_bpmp_channel *channel)
+{
+	/* reset the channel state */
+	tegra_ivc_reset(channel->ivc);
+
+	/* sync the channel state with BPMP */
+	while (tegra_ivc_notified(channel->ivc))
+		;
+}
+
+static void tegra186_bpmp_channel_cleanup(struct tegra_bpmp_channel *channel)
+{
+	tegra_ivc_cleanup(channel->ivc);
+}
+
+static void mbox_handle_rx(struct mbox_client *client, void *data)
+{
+	struct tegra_bpmp *bpmp = mbox_client_to_bpmp(client);
+
+	tegra_bpmp_handle_rx(bpmp);
+}
+
+static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
+{
+	struct tegra186_bpmp *priv;
+	unsigned int i;
+	int err;
+
+	priv = devm_kzalloc(bpmp->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	bpmp->priv = priv;
+	priv->parent = bpmp;
+
+	priv->tx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 0);
+	if (!priv->tx.pool) {
+		dev_err(bpmp->dev, "TX shmem pool not found\n");
+		return -ENOMEM;
+	}
+
+	priv->tx.virt = gen_pool_dma_alloc(priv->tx.pool, 4096, &priv->tx.phys);
+	if (!priv->tx.virt) {
+		dev_err(bpmp->dev, "failed to allocate from TX pool\n");
+		return -ENOMEM;
+	}
+
+	priv->rx.pool = of_gen_pool_get(bpmp->dev->of_node, "shmem", 1);
+	if (!priv->rx.pool) {
+		dev_err(bpmp->dev, "RX shmem pool not found\n");
+		err = -ENOMEM;
+		goto free_tx;
+	}
+
+	priv->rx.virt = gen_pool_dma_alloc(priv->rx.pool, 4096, &priv->rx.phys);
+	if (!priv->rx.virt) {
+		dev_err(bpmp->dev, "failed to allocate from RX pool\n");
+		err = -ENOMEM;
+		goto free_tx;
+	}
+
+	err = tegra186_bpmp_channel_init(bpmp->tx_channel, bpmp,
+					 bpmp->soc->channels.cpu_tx.offset);
+	if (err < 0)
+		goto free_rx;
+
+	err = tegra186_bpmp_channel_init(bpmp->rx_channel, bpmp,
+					 bpmp->soc->channels.cpu_rx.offset);
+	if (err < 0)
+		goto cleanup_tx_channel;
+
+	for (i = 0; i < bpmp->threaded.count; i++) {
+		err = tegra186_bpmp_channel_init(
+			&bpmp->threaded_channels[i], bpmp,
+			bpmp->soc->channels.thread.offset + i);
+		if (err < 0)
+			goto cleanup_channels;
+	}
+
+	/* mbox registration */
+	priv->mbox.client.dev = bpmp->dev;
+	priv->mbox.client.rx_callback = mbox_handle_rx;
+	priv->mbox.client.tx_block = false;
+	priv->mbox.client.knows_txdone = false;
+
+	priv->mbox.channel = mbox_request_channel(&priv->mbox.client, 0);
+	if (IS_ERR(priv->mbox.channel)) {
+		err = PTR_ERR(priv->mbox.channel);
+		dev_err(bpmp->dev, "failed to get HSP mailbox: %d\n", err);
+		goto cleanup_channels;
+	}
+
+	tegra186_bpmp_channel_reset(bpmp->tx_channel);
+	tegra186_bpmp_channel_reset(bpmp->rx_channel);
+	for (i = 0; i < bpmp->threaded.count; i++)
+		tegra186_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+
+	return 0;
+
+cleanup_channels:
+	for (i = 0; i < bpmp->threaded.count; i++) {
+		if (bpmp->threaded_channels[i].bpmp)
+			tegra186_bpmp_channel_cleanup(
+				&bpmp->threaded_channels[i]);
+	}
+
+	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
+cleanup_tx_channel:
+	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
+free_rx:
+	gen_pool_free(priv->rx.pool, (unsigned long)priv->rx.virt, 4096);
+free_tx:
+	gen_pool_free(priv->tx.pool, (unsigned long)priv->tx.virt, 4096);
+
+	return err;
+}
+
+static void tegra186_bpmp_deinit(struct tegra_bpmp *bpmp)
+{
+	struct tegra186_bpmp *priv = bpmp->priv;
+	unsigned int i;
+
+	mbox_free_channel(priv->mbox.channel);
+	for (i = 0; i < bpmp->threaded.count; i++)
+		tegra186_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
+	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
+	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
+	gen_pool_free(priv->rx.pool, (unsigned long)priv->rx.virt, 4096);
+	gen_pool_free(priv->tx.pool, (unsigned long)priv->tx.virt, 4096);
+}
+
+static int tegra186_bpmp_resume(struct tegra_bpmp *bpmp)
+{
+	int i;
+
+	/* reset message channels */
+	tegra186_bpmp_channel_reset(bpmp->tx_channel);
+	tegra186_bpmp_channel_reset(bpmp->rx_channel);
+
+	for (i = 0; i < bpmp->threaded.count; i++)
+		tegra186_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+
+	return 0;
+}
+
+struct tegra_bpmp_ops tegra186_bpmp_ops = {
+	.init = tegra186_bpmp_init,
+	.deinit = tegra186_bpmp_deinit,
+	.is_resp_ready = tegra186_bpmp_is_message_ready,
+	.is_req_ready = tegra186_bpmp_is_message_ready,
+	.ack_resp = tegra186_bpmp_ack_message,
+	.ack_req = tegra186_bpmp_ack_message,
+	.is_resp_channel_free = tegra186_bpmp_is_channel_free,
+	.is_req_channel_free = tegra186_bpmp_is_channel_free,
+	.post_resp = tegra186_bpmp_post_message,
+	.post_req = tegra186_bpmp_post_message,
+	.ring_doorbell = tegra186_bpmp_ring_doorbell,
+	.resume = tegra186_bpmp_resume,
+};
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index af123de..483a37b 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -26,6 +26,8 @@
 #include <soc/tegra/bpmp-abi.h>
 #include <soc/tegra/ivc.h>
 
+#include "bpmp-private.h"
+
 #define MSG_ACK		BIT(0)
 #define MSG_RING	BIT(1)
 #define TAG_SZ		32
@@ -36,6 +38,14 @@ mbox_client_to_bpmp(struct mbox_client *client)
 	return container_of(client, struct tegra_bpmp, mbox.client);
 }
 
+static inline struct tegra_bpmp_ops *
+channel_to_ops(struct tegra_bpmp_channel *channel)
+{
+	struct tegra_bpmp *bpmp = channel->bpmp;
+
+	return bpmp->soc->ops;
+}
+
 struct tegra_bpmp *tegra_bpmp_get(struct device *dev)
 {
 	struct platform_device *pdev;
@@ -98,22 +108,16 @@ static bool tegra_bpmp_message_valid(const struct tegra_bpmp_message *msg)
 
 static bool tegra_bpmp_is_resp_ready(struct tegra_bpmp_channel *channel)
 {
-	void *frame;
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
 
-	frame = tegra_ivc_read_get_next_frame(channel->ivc);
-	if (IS_ERR(frame)) {
-		channel->ib = NULL;
-		return false;
-	}
-
-	channel->ib = frame;
-
-	return true;
+	return ops->is_resp_ready(channel);
 }
 
 static bool tegra_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
 {
-	return tegra_bpmp_is_resp_ready(channel);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->is_req_ready(channel);
 }
 
 static int tegra_bpmp_wait_resp(struct tegra_bpmp_channel *channel)
@@ -133,32 +137,30 @@ static int tegra_bpmp_wait_resp(struct tegra_bpmp_channel *channel)
 
 static int tegra_bpmp_ack_resp(struct tegra_bpmp_channel *channel)
 {
-	return tegra_ivc_read_advance(channel->ivc);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->ack_resp(channel);
 }
 
 static int tegra_bpmp_ack_req(struct tegra_bpmp_channel *channel)
 {
-	return tegra_ivc_read_advance(channel->ivc);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->ack_req(channel);
 }
 
 static bool tegra_bpmp_is_req_channel_free(struct tegra_bpmp_channel *channel)
 {
-	void *frame;
-
-	frame = tegra_ivc_write_get_next_frame(channel->ivc);
-	if (IS_ERR(frame)) {
-		channel->ob = NULL;
-		return false;
-	}
-
-	channel->ob = frame;
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
 
-	return true;
+	return ops->is_req_channel_free(channel);
 }
 
 static bool tegra_bpmp_is_resp_channel_free(struct tegra_bpmp_channel *channel)
 {
-	return tegra_bpmp_is_req_channel_free(channel);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->is_resp_channel_free(channel);
 }
 
 static int tegra_bpmp_wait_req_channel_free(struct tegra_bpmp_channel *channel)
@@ -180,28 +182,21 @@ static int tegra_bpmp_wait_req_channel_free(struct tegra_bpmp_channel *channel)
 
 static int tegra_bpmp_post_req(struct tegra_bpmp_channel *channel)
 {
-	return tegra_ivc_write_advance(channel->ivc);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->post_req(channel);
 }
 
 static int tegra_bpmp_post_resp(struct tegra_bpmp_channel *channel)
 {
-	return tegra_ivc_write_advance(channel->ivc);
+	struct tegra_bpmp_ops *ops = channel_to_ops(channel);
+
+	return ops->post_resp(channel);
 }
 
 static int tegra_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
 {
-	int err;
-
-	if (WARN_ON(bpmp->mbox.channel == NULL))
-		return -EINVAL;
-
-	err = mbox_send_message(bpmp->mbox.channel, NULL);
-	if (err < 0)
-		return err;
-
-	mbox_client_txdone(bpmp->mbox.channel, 0);
-
-	return 0;
+	return bpmp->soc->ops->ring_doorbell(bpmp);
 }
 
 static ssize_t __tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
@@ -665,9 +660,8 @@ static void tegra_bpmp_channel_signal(struct tegra_bpmp_channel *channel)
 	complete(&channel->completion);
 }
 
-static void tegra_bpmp_handle_rx(struct mbox_client *client, void *data)
+void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 {
-	struct tegra_bpmp *bpmp = mbox_client_to_bpmp(client);
 	struct tegra_bpmp_channel *channel;
 	unsigned int i, count;
 	unsigned long *busy;
@@ -695,66 +689,9 @@ static void tegra_bpmp_handle_rx(struct mbox_client *client, void *data)
 	spin_unlock(&bpmp->lock);
 }
 
-static void tegra_bpmp_ivc_notify(struct tegra_ivc *ivc, void *data)
-{
-	struct tegra_bpmp *bpmp = data;
-
-	WARN_ON(tegra_bpmp_ring_doorbell(bpmp));
-}
-
-static int tegra_bpmp_channel_init(struct tegra_bpmp_channel *channel,
-				   struct tegra_bpmp *bpmp,
-				   unsigned int index)
-{
-	size_t message_size, queue_size;
-	unsigned int offset;
-	int err;
-
-	channel->ivc = devm_kzalloc(bpmp->dev, sizeof(*channel->ivc),
-				    GFP_KERNEL);
-	if (!channel->ivc)
-		return -ENOMEM;
-
-	message_size = tegra_ivc_align(MSG_MIN_SZ);
-	queue_size = tegra_ivc_total_queue_size(message_size);
-	offset = queue_size * index;
-
-	err = tegra_ivc_init(channel->ivc, NULL,
-			     bpmp->rx.virt + offset, bpmp->rx.phys + offset,
-			     bpmp->tx.virt + offset, bpmp->tx.phys + offset,
-			     1, message_size, tegra_bpmp_ivc_notify,
-			     bpmp);
-	if (err < 0) {
-		dev_err(bpmp->dev, "failed to setup IVC for channel %u: %d\n",
-			index, err);
-		return err;
-	}
-
-	init_completion(&channel->completion);
-	channel->bpmp = bpmp;
-
-	return 0;
-}
-
-static void tegra_bpmp_channel_reset(struct tegra_bpmp_channel *channel)
-{
-	/* reset the channel state */
-	tegra_ivc_reset(channel->ivc);
-
-	/* sync the channel state with BPMP */
-	while (tegra_ivc_notified(channel->ivc))
-		;
-}
-
-static void tegra_bpmp_channel_cleanup(struct tegra_bpmp_channel *channel)
-{
-	tegra_ivc_cleanup(channel->ivc);
-}
-
 static int tegra_bpmp_probe(struct platform_device *pdev)
 {
 	struct tegra_bpmp *bpmp;
-	unsigned int i;
 	char tag[TAG_SZ];
 	size_t size;
 	int err;
@@ -766,32 +703,6 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	bpmp->soc = of_device_get_match_data(&pdev->dev);
 	bpmp->dev = &pdev->dev;
 
-	bpmp->tx.pool = of_gen_pool_get(pdev->dev.of_node, "shmem", 0);
-	if (!bpmp->tx.pool) {
-		dev_err(&pdev->dev, "TX shmem pool not found\n");
-		return -ENOMEM;
-	}
-
-	bpmp->tx.virt = gen_pool_dma_alloc(bpmp->tx.pool, 4096, &bpmp->tx.phys);
-	if (!bpmp->tx.virt) {
-		dev_err(&pdev->dev, "failed to allocate from TX pool\n");
-		return -ENOMEM;
-	}
-
-	bpmp->rx.pool = of_gen_pool_get(pdev->dev.of_node, "shmem", 1);
-	if (!bpmp->rx.pool) {
-		dev_err(&pdev->dev, "RX shmem pool not found\n");
-		err = -ENOMEM;
-		goto free_tx;
-	}
-
-	bpmp->rx.virt = gen_pool_dma_alloc(bpmp->rx.pool, 4096, &bpmp->rx.phys);
-	if (!bpmp->rx.virt) {
-		dev_err(&pdev->dev, "failed to allocate from RX pool\n");
-		err = -ENOMEM;
-		goto free_tx;
-	}
-
 	INIT_LIST_HEAD(&bpmp->mrqs);
 	spin_lock_init(&bpmp->lock);
 
@@ -801,81 +712,38 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	size = BITS_TO_LONGS(bpmp->threaded.count) * sizeof(long);
 
 	bpmp->threaded.allocated = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
-	if (!bpmp->threaded.allocated) {
-		err = -ENOMEM;
-		goto free_rx;
-	}
+	if (!bpmp->threaded.allocated)
+		return -ENOMEM;
 
 	bpmp->threaded.busy = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
-	if (!bpmp->threaded.busy) {
-		err = -ENOMEM;
-		goto free_rx;
-	}
+	if (!bpmp->threaded.busy)
+		return -ENOMEM;
 
 	spin_lock_init(&bpmp->atomic_tx_lock);
 	bpmp->tx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
 					GFP_KERNEL);
-	if (!bpmp->tx_channel) {
-		err = -ENOMEM;
-		goto free_rx;
-	}
+	if (!bpmp->tx_channel)
+		return -ENOMEM;
 
 	bpmp->rx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->rx_channel),
 	                                GFP_KERNEL);
-	if (!bpmp->rx_channel) {
-		err = -ENOMEM;
-		goto free_rx;
-	}
+	if (!bpmp->rx_channel)
+		return -ENOMEM;
 
 	bpmp->threaded_channels = devm_kcalloc(&pdev->dev, bpmp->threaded.count,
 					       sizeof(*bpmp->threaded_channels),
 					       GFP_KERNEL);
-	if (!bpmp->threaded_channels) {
-		err = -ENOMEM;
-		goto free_rx;
-	}
-
-	err = tegra_bpmp_channel_init(bpmp->tx_channel, bpmp,
-				      bpmp->soc->channels.cpu_tx.offset);
-	if (err < 0)
-		goto free_rx;
+	if (!bpmp->threaded_channels)
+		return -ENOMEM;
 
-	err = tegra_bpmp_channel_init(bpmp->rx_channel, bpmp,
-				      bpmp->soc->channels.cpu_rx.offset);
+	err = bpmp->soc->ops->init(bpmp);
 	if (err < 0)
-		goto cleanup_tx_channel;
-
-	for (i = 0; i < bpmp->threaded.count; i++) {
-		err = tegra_bpmp_channel_init(
-			&bpmp->threaded_channels[i], bpmp,
-			bpmp->soc->channels.thread.offset + i);
-		if (err < 0)
-			goto cleanup_threaded_channels;
-	}
-
-	/* mbox registration */
-	bpmp->mbox.client.dev = &pdev->dev;
-	bpmp->mbox.client.rx_callback = tegra_bpmp_handle_rx;
-	bpmp->mbox.client.tx_block = false;
-	bpmp->mbox.client.knows_txdone = false;
-
-	bpmp->mbox.channel = mbox_request_channel(&bpmp->mbox.client, 0);
-	if (IS_ERR(bpmp->mbox.channel)) {
-		err = PTR_ERR(bpmp->mbox.channel);
-		dev_err(&pdev->dev, "failed to get HSP mailbox: %d\n", err);
-		goto cleanup_threaded_channels;
-	}
-
-	/* reset message channels */
-	tegra_bpmp_channel_reset(bpmp->tx_channel);
-	tegra_bpmp_channel_reset(bpmp->rx_channel);
-	for (i = 0; i < bpmp->threaded.count; i++)
-		tegra_bpmp_channel_reset(&bpmp->threaded_channels[i]);
+		return err;
 
 	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
 				     tegra_bpmp_mrq_handle_ping, bpmp);
 	if (err < 0)
-		goto free_mbox;
+		goto deinit;
 
 	err = tegra_bpmp_ping(bpmp);
 	if (err < 0) {
@@ -917,37 +785,21 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 free_mrq:
 	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
-free_mbox:
-	mbox_free_channel(bpmp->mbox.channel);
-cleanup_threaded_channels:
-	for (i = 0; i < bpmp->threaded.count; i++) {
-		if (bpmp->threaded_channels[i].bpmp)
-			tegra_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
-	}
+deinit:
+	if (bpmp->soc->ops->deinit)
+		bpmp->soc->ops->deinit(bpmp);
 
-	tegra_bpmp_channel_cleanup(bpmp->rx_channel);
-cleanup_tx_channel:
-	tegra_bpmp_channel_cleanup(bpmp->tx_channel);
-free_rx:
-	gen_pool_free(bpmp->rx.pool, (unsigned long)bpmp->rx.virt, 4096);
-free_tx:
-	gen_pool_free(bpmp->tx.pool, (unsigned long)bpmp->tx.virt, 4096);
 	return err;
 }
 
 static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 {
 	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
-	unsigned int i;
-
-	/* reset message channels */
-	tegra_bpmp_channel_reset(bpmp->tx_channel);
-	tegra_bpmp_channel_reset(bpmp->rx_channel);
-
-	for (i = 0; i < bpmp->threaded.count; i++)
-		tegra_bpmp_channel_reset(&bpmp->threaded_channels[i]);
 
-	return 0;
+	if (bpmp->soc->ops->resume)
+		return bpmp->soc->ops->resume(bpmp);
+	else
+		return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
@@ -968,6 +820,7 @@ static const struct tegra_bpmp_soc tegra186_soc = {
 			.timeout = 0,
 		},
 	},
+	.ops = &tegra186_bpmp_ops,
 	.num_resets = 193,
 };
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index b02f926..a4818c0 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -23,6 +23,7 @@
 #include <soc/tegra/bpmp-abi.h>
 
 struct tegra_bpmp_clk;
+struct tegra_bpmp_ops;
 
 struct tegra_bpmp_soc {
 	struct {
@@ -32,6 +33,8 @@ struct tegra_bpmp_soc {
 			unsigned int timeout;
 		} cpu_tx, thread, cpu_rx;
 	} channels;
+
+	struct tegra_bpmp_ops *ops;
 	unsigned int num_resets;
 };
 
@@ -63,12 +66,7 @@ struct tegra_bpmp_mrq {
 struct tegra_bpmp {
 	const struct tegra_bpmp_soc *soc;
 	struct device *dev;
-
-	struct {
-		struct gen_pool *pool;
-		dma_addr_t phys;
-		void *virt;
-	} tx, rx;
+	void *priv;
 
 	struct {
 		struct mbox_client client;
@@ -173,6 +171,8 @@ static inline bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp,
 }
 #endif
 
+void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp);
+
 #if IS_ENABLED(CONFIG_CLK_TEGRA_BPMP)
 int tegra_bpmp_init_clocks(struct tegra_bpmp *bpmp);
 #else
-- 
2.7.4

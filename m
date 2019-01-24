Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH V3 1/4] firmware: tegra: reword messaging terminology
Date: Thu, 24 Jan 2019 19:03:52 +0200
Message-ID: <1548349435-1086-2-git-send-email-talho@nvidia.com>
In-Reply-To: <1548349435-1086-1-git-send-email-talho@nvidia.com>
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jonathanh@nvidia.com, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

As a preparatory change to refactor bpmp driver to support other than
t186/t194 chip generations, reword and slightly refactor some of the
functions to better match with what is actually happening in the
wire-level protocol.

The communication with bpmp is essentially a Remote Procedure Call
consisting of "request" and "response". Either side (BPMP or CPU) can
initiate the communication. The state machine for communication
consists of following steps (from Linux point of view):

Linux initiating the call:
 1) check that channel is free to transmit a request (is_req_channel_free)
 2) copy request message payload to shared location
 3) post the request in channel (post_req)
 4) notify BPMP that channel state has been updated (ring_doorbell)
 5) wait for response (is_resp_ready)
 6) copy response message payload from shared location
 7) acknowledge the response in channel (ack_resp)

BPMP initiating the call:
 1) wait for request (is_req_ready)
 2) copy request message payload from shared location
 3) acknowledge the request in channel (ack_req)
 4) check that channel is free to transmit response (is_resp_channel_free)
 5) copy response message payload to shared location
 6) post the response message to channel (post_resp)
 7) notify BPMP that channel state has been updated (ring_doorbell)

Signed-off-by: Timo Alho <talho@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 106 +++++++++++++++++++++++++++---------------
 1 file changed, 68 insertions(+), 38 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 689478b..af123de 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -96,7 +96,7 @@ static bool tegra_bpmp_message_valid(const struct tegra_bpmp_message *msg)
 	       (msg->rx.size == 0 || msg->rx.data);
 }
 
-static bool tegra_bpmp_master_acked(struct tegra_bpmp_channel *channel)
+static bool tegra_bpmp_is_resp_ready(struct tegra_bpmp_channel *channel)
 {
 	void *frame;
 
@@ -111,7 +111,12 @@ static bool tegra_bpmp_master_acked(struct tegra_bpmp_channel *channel)
 	return true;
 }
 
-static int tegra_bpmp_wait_ack(struct tegra_bpmp_channel *channel)
+static bool tegra_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
+{
+	return tegra_bpmp_is_resp_ready(channel);
+}
+
+static int tegra_bpmp_wait_resp(struct tegra_bpmp_channel *channel)
 {
 	unsigned long timeout = channel->bpmp->soc->channels.cpu_tx.timeout;
 	ktime_t end;
@@ -119,14 +124,24 @@ static int tegra_bpmp_wait_ack(struct tegra_bpmp_channel *channel)
 	end = ktime_add_us(ktime_get(), timeout);
 
 	do {
-		if (tegra_bpmp_master_acked(channel))
+		if (tegra_bpmp_is_resp_ready(channel))
 			return 0;
 	} while (ktime_before(ktime_get(), end));
 
 	return -ETIMEDOUT;
 }
 
-static bool tegra_bpmp_master_free(struct tegra_bpmp_channel *channel)
+static int tegra_bpmp_ack_resp(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_read_advance(channel->ivc);
+}
+
+static int tegra_bpmp_ack_req(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_read_advance(channel->ivc);
+}
+
+static bool tegra_bpmp_is_req_channel_free(struct tegra_bpmp_channel *channel)
 {
 	void *frame;
 
@@ -141,7 +156,12 @@ static bool tegra_bpmp_master_free(struct tegra_bpmp_channel *channel)
 	return true;
 }
 
-static int tegra_bpmp_wait_master_free(struct tegra_bpmp_channel *channel)
+static bool tegra_bpmp_is_resp_channel_free(struct tegra_bpmp_channel *channel)
+{
+	return tegra_bpmp_is_req_channel_free(channel);
+}
+
+static int tegra_bpmp_wait_req_channel_free(struct tegra_bpmp_channel *channel)
 {
 	unsigned long timeout = channel->bpmp->soc->channels.cpu_tx.timeout;
 	ktime_t start, now;
@@ -149,7 +169,7 @@ static int tegra_bpmp_wait_master_free(struct tegra_bpmp_channel *channel)
 	start = ns_to_ktime(local_clock());
 
 	do {
-		if (tegra_bpmp_master_free(channel))
+		if (tegra_bpmp_is_req_channel_free(channel))
 			return 0;
 
 		now = ns_to_ktime(local_clock());
@@ -158,6 +178,32 @@ static int tegra_bpmp_wait_master_free(struct tegra_bpmp_channel *channel)
 	return -ETIMEDOUT;
 }
 
+static int tegra_bpmp_post_req(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_write_advance(channel->ivc);
+}
+
+static int tegra_bpmp_post_resp(struct tegra_bpmp_channel *channel)
+{
+	return tegra_ivc_write_advance(channel->ivc);
+}
+
+static int tegra_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
+{
+	int err;
+
+	if (WARN_ON(bpmp->mbox.channel == NULL))
+		return -EINVAL;
+
+	err = mbox_send_message(bpmp->mbox.channel, NULL);
+	if (err < 0)
+		return err;
+
+	mbox_client_txdone(bpmp->mbox.channel, 0);
+
+	return 0;
+}
+
 static ssize_t __tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
 					 void *data, size_t size, int *ret)
 {
@@ -166,7 +212,7 @@ static ssize_t __tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
 	if (data && size > 0)
 		memcpy(data, channel->ib->data, size);
 
-	err = tegra_ivc_read_advance(channel->ivc);
+	err = tegra_bpmp_ack_resp(channel);
 	if (err < 0)
 		return err;
 
@@ -210,7 +256,7 @@ static ssize_t __tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 	if (data && size > 0)
 		memcpy(channel->ob->data, data, size);
 
-	return tegra_ivc_write_advance(channel->ivc);
+	return tegra_bpmp_post_req(channel);
 }
 
 static struct tegra_bpmp_channel *
@@ -238,7 +284,7 @@ tegra_bpmp_write_threaded(struct tegra_bpmp *bpmp, unsigned int mrq,
 
 	channel = &bpmp->threaded_channels[index];
 
-	if (!tegra_bpmp_master_free(channel)) {
+	if (!tegra_bpmp_is_req_channel_free(channel)) {
 		err = -EBUSY;
 		goto unlock;
 	}
@@ -270,7 +316,7 @@ static ssize_t tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 {
 	int err;
 
-	err = tegra_bpmp_wait_master_free(channel);
+	err = tegra_bpmp_wait_req_channel_free(channel);
 	if (err < 0)
 		return err;
 
@@ -302,13 +348,11 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 
 	spin_unlock(&bpmp->atomic_tx_lock);
 
-	err = mbox_send_message(bpmp->mbox.channel, NULL);
+	err = tegra_bpmp_ring_doorbell(bpmp);
 	if (err < 0)
 		return err;
 
-	mbox_client_txdone(bpmp->mbox.channel, 0);
-
-	err = tegra_bpmp_wait_ack(channel);
+	err = tegra_bpmp_wait_resp(channel);
 	if (err < 0)
 		return err;
 
@@ -335,12 +379,10 @@ int tegra_bpmp_transfer(struct tegra_bpmp *bpmp,
 	if (IS_ERR(channel))
 		return PTR_ERR(channel);
 
-	err = mbox_send_message(bpmp->mbox.channel, NULL);
+	err = tegra_bpmp_ring_doorbell(bpmp);
 	if (err < 0)
 		return err;
 
-	mbox_client_txdone(bpmp->mbox.channel, 0);
-
 	timeout = usecs_to_jiffies(bpmp->soc->channels.thread.timeout);
 
 	err = wait_for_completion_timeout(&channel->completion, timeout);
@@ -369,38 +411,34 @@ void tegra_bpmp_mrq_return(struct tegra_bpmp_channel *channel, int code,
 {
 	unsigned long flags = channel->ib->flags;
 	struct tegra_bpmp *bpmp = channel->bpmp;
-	struct tegra_bpmp_mb_data *frame;
 	int err;
 
 	if (WARN_ON(size > MSG_DATA_MIN_SZ))
 		return;
 
-	err = tegra_ivc_read_advance(channel->ivc);
+	err = tegra_bpmp_ack_req(channel);
 	if (WARN_ON(err < 0))
 		return;
 
 	if ((flags & MSG_ACK) == 0)
 		return;
 
-	frame = tegra_ivc_write_get_next_frame(channel->ivc);
-	if (WARN_ON(IS_ERR(frame)))
+	if (WARN_ON(!tegra_bpmp_is_resp_channel_free(channel)))
 		return;
 
-	frame->code = code;
+	channel->ob->code = code;
 
 	if (data && size > 0)
-		memcpy(frame->data, data, size);
+		memcpy(channel->ob->data, data, size);
 
-	err = tegra_ivc_write_advance(channel->ivc);
+	err = tegra_bpmp_post_resp(channel);
 	if (WARN_ON(err < 0))
 		return;
 
 	if (flags & MSG_RING) {
-		err = mbox_send_message(bpmp->mbox.channel, NULL);
+		err = tegra_bpmp_ring_doorbell(bpmp);
 		if (WARN_ON(err < 0))
 			return;
-
-		mbox_client_txdone(bpmp->mbox.channel, 0);
 	}
 }
 EXPORT_SYMBOL_GPL(tegra_bpmp_mrq_return);
@@ -638,7 +676,7 @@ static void tegra_bpmp_handle_rx(struct mbox_client *client, void *data)
 	count = bpmp->soc->channels.thread.count;
 	busy = bpmp->threaded.busy;
 
-	if (tegra_bpmp_master_acked(channel))
+	if (tegra_bpmp_is_req_ready(channel))
 		tegra_bpmp_handle_mrq(bpmp, channel->ib->code, channel);
 
 	spin_lock(&bpmp->lock);
@@ -648,7 +686,7 @@ static void tegra_bpmp_handle_rx(struct mbox_client *client, void *data)
 
 		channel = &bpmp->threaded_channels[i];
 
-		if (tegra_bpmp_master_acked(channel)) {
+		if (tegra_bpmp_is_resp_ready(channel)) {
 			tegra_bpmp_channel_signal(channel);
 			clear_bit(i, busy);
 		}
@@ -660,16 +698,8 @@ static void tegra_bpmp_handle_rx(struct mbox_client *client, void *data)
 static void tegra_bpmp_ivc_notify(struct tegra_ivc *ivc, void *data)
 {
 	struct tegra_bpmp *bpmp = data;
-	int err;
 
-	if (WARN_ON(bpmp->mbox.channel == NULL))
-		return;
-
-	err = mbox_send_message(bpmp->mbox.channel, NULL);
-	if (err < 0)
-		return;
-
-	mbox_client_txdone(bpmp->mbox.channel, 0);
+	WARN_ON(tegra_bpmp_ring_doorbell(bpmp));
 }
 
 static int tegra_bpmp_channel_init(struct tegra_bpmp_channel *channel,
-- 
2.7.4

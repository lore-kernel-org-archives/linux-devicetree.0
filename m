Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36486 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbeK1Uzb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Nov 2018 15:55:31 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 01/12] mailbox: Support blocking transfers in atomic context
Date: Wed, 28 Nov 2018 10:54:10 +0100
Message-Id: <20181128095421.20573-2-thierry.reding@gmail.com>
In-Reply-To: <20181128095421.20573-1-thierry.reding@gmail.com>
References: <20181128095421.20573-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

The mailbox framework supports blocking transfers via completions for
clients that can sleep. In order to support blocking transfers in cases
where the transmission is not permitted to sleep, add a new ->flush()
callback that controller drivers can implement to busy loop until the
transmission has been completed. A new mbox_flush() function can be
called by mailbox consumers in atomic context to make sure a transfer
has completed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add explicit mailbox flush API
---
 drivers/mailbox/mailbox.c          | 28 ++++++++++++++++++++++++++++
 include/linux/mailbox_client.h     |  1 +
 include/linux/mailbox_controller.h |  4 ++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index eb781e2b19cb..044e24804767 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -283,6 +283,34 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_flush - flush a mailbox channel
+ * @chan: mailbox channel to flush
+ * @timeout: time, in milliseconds, to allow the flush operation to succeed
+ *
+ * Mailbox controllers that need to work in atomic context can implement the
+ * ->flush() callback to busy loop until a transmission has been completed.
+ * The implementation must call mbox_chan_txdone() upon success. Clients can
+ * call the mbox_flush() function at any time after mbox_send_message() to
+ * flush the transmission. After the function returns success, the mailbox
+ * transmission is guaranteed to have completed.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	int ret;
+
+	if (!chan->mbox->ops->flush)
+		return -ENOTSUPP;
+
+	ret = chan->mbox->ops->flush(chan, timeout);
+	if (ret < 0)
+		tx_tick(chan, ret);
+
+	return ret;
+}
+
 /**
  * mbox_request_channel - Request a mailbox channel.
  * @cl: Identity of the client requesting the channel.
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index 44348710953f..faa7da3c9c8b 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -44,6 +44,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
 void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 9b0b21207345..4994a438444c 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -24,6 +24,9 @@ struct mbox_chan;
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
  *		sleep.
+ * @flush:	Called when a client requests transmissions to be blocking but
+ *		the context doesn't allow sleeping. Typically the controller
+ *		will implement a busy loop waiting for the data to flush out.
  * @startup:	Called when a client requests the chan. The controller
  *		could ask clients for additional parameters of communication
  *		to be provided via client's chan_data. This call may
@@ -46,6 +49,7 @@ struct mbox_chan;
  */
 struct mbox_chan_ops {
 	int (*send_data)(struct mbox_chan *chan, void *data);
+	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
 	int (*startup)(struct mbox_chan *chan);
 	void (*shutdown)(struct mbox_chan *chan);
 	bool (*last_tx_done)(struct mbox_chan *chan);
-- 
2.19.1

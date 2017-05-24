From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 5/6] mailbox: arm_mhu: add full support for the doorbells
Date: Wed, 24 May 2017 11:16:42 +0100
Message-ID: <1495621003-4291-6-git-send-email-sudeep.holla@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495621003-4291-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We now have the basic infrastructure and binding to support doorbells
on ARM MHU controller.

This patch adds all the necessary mailbox operations to add support for
the doorbells. Maximum of 32 doorbells are supported on each physical
channel, however the total number of doorbells is restricted to 20
in order to save memory. It can increased if required in future.

Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/mailbox/arm_mhu.c | 136 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
index ae06924eb6f4..79d2392d7f3b 100644
--- a/drivers/mailbox/arm_mhu.c
+++ b/drivers/mailbox/arm_mhu.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -94,6 +95,14 @@ mhu_mbox_to_channel(struct mbox_controller *mbox,
 	return NULL;
 }
 
+static void mhu_mbox_clear_irq(struct mbox_chan *chan)
+{
+	struct mhu_channel *chan_info = chan->con_priv;
+	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].rx_reg;
+
+	writel_relaxed(BIT(chan_info->doorbell), base + INTR_CLR_OFS);
+}
+
 static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
 {
 	unsigned int pchan;
@@ -105,6 +114,95 @@ static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
 	return pchan;
 }
 
+static struct mbox_chan *mhu_mbox_irq_to_channel(struct arm_mhu *mhu,
+						 unsigned int pchan)
+{
+	unsigned long bits;
+	unsigned int doorbell;
+	struct mbox_chan *chan = NULL;
+	struct mbox_controller *mbox = &mhu->mbox;
+	void __iomem *base = mhu->mlink[pchan].rx_reg;
+
+	bits = readl_relaxed(base + INTR_STAT_OFS);
+	if (!bits)
+		/* No IRQs fired in specified physical channel */
+		return NULL;
+
+	/* An IRQ has fired, find the associated channel */
+	for (doorbell = 0; bits; doorbell++) {
+		if (!test_and_clear_bit(doorbell, &bits))
+			continue;
+
+		chan = mhu_mbox_to_channel(mbox, pchan, doorbell);
+		if (chan)
+			break;
+	}
+
+	return chan;
+}
+
+static irqreturn_t mhu_mbox_thread_handler(int irq, void *data)
+{
+	struct mbox_chan *chan;
+	struct arm_mhu *mhu = data;
+	unsigned int pchan = mhu_mbox_irq_to_pchan_num(mhu, irq);
+
+	while (NULL != (chan = mhu_mbox_irq_to_channel(mhu, pchan))) {
+		mbox_chan_received_data(chan, NULL);
+		mhu_mbox_clear_irq(chan);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static bool mhu_doorbell_last_tx_done(struct mbox_chan *chan)
+{
+	struct mhu_channel *chan_info = chan->con_priv;
+	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
+
+	if (readl_relaxed(base + INTR_STAT_OFS) & BIT(chan_info->doorbell))
+		return false;
+
+	return true;
+}
+
+static int mhu_doorbell_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mhu_channel *chan_info = chan->con_priv;
+	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
+
+	/* Send event to co-processor */
+	writel_relaxed(BIT(chan_info->doorbell), base + INTR_SET_OFS);
+
+	return 0;
+}
+
+static int mhu_doorbell_startup(struct mbox_chan *chan)
+{
+	mhu_mbox_clear_irq(chan);
+	return 0;
+}
+
+static void mhu_doorbell_shutdown(struct mbox_chan *chan)
+{
+	struct mhu_channel *chan_info = chan->con_priv;
+	struct mbox_controller *mbox = &chan_info->mhu->mbox;
+	int i;
+
+	for (i = 0; i < mbox->num_chans; i++)
+		if (chan == &mbox->chans[i])
+			break;
+
+	if (mbox->num_chans == i) {
+		dev_warn(mbox->dev, "Request to free non-existent channel\n");
+		return;
+	}
+
+	/* Reset channel */
+	mhu_mbox_clear_irq(chan);
+	chan->con_priv = NULL;
+}
+
 static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
 					const struct of_phandle_args *spec)
 {
@@ -227,15 +325,34 @@ static const struct mbox_chan_ops mhu_ops = {
 	.last_tx_done = mhu_last_tx_done,
 };
 
+static const struct mbox_chan_ops mhu_doorbell_ops = {
+	.send_data = mhu_doorbell_send_data,
+	.startup = mhu_doorbell_startup,
+	.shutdown = mhu_doorbell_shutdown,
+	.last_tx_done = mhu_doorbell_last_tx_done,
+};
+
 static const struct mhu_mbox_pdata arm_mhu_pdata = {
 	.num_pchans = 3,
 	.num_doorbells = 1,
 	.support_doorbells = false,
 };
 
+static const struct mhu_mbox_pdata arm_mhu_doorbell_pdata = {
+	.num_pchans = 2,	/* Secure can't be used */
+	.num_doorbells = 32,
+	.support_doorbells = true,
+};
+
 static const struct of_device_id mhu_mbox_match[] = {
-	{ .compatible = "arm,mhu", .data = (void *)&arm_mhu_pdata },
-	{}
+	{
+		.compatible = "arm,mhu",
+		.data = (void *)&arm_mhu_pdata
+	}, {
+		.compatible = "arm,mhu-doorbell",
+		.data = (void *)&arm_mhu_doorbell_pdata
+	}, {
+	}
 };
 
 MODULE_DEVICE_TABLE(of, mhu_mbox_match);
@@ -243,6 +360,7 @@ MODULE_DEVICE_TABLE(of, mhu_mbox_match);
 static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int i, err, max_chans;
+	irq_handler_t handler;
 	struct arm_mhu *mhu;
 	struct mbox_chan *chans;
 	struct mhu_mbox_pdata *pdata;
@@ -287,7 +405,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 	mhu->mbox.dev = dev;
 	mhu->mbox.chans = chans;
 	mhu->mbox.num_chans = max_chans;
-	mhu->mbox.ops = &mhu_ops;
 	mhu->mbox.txdone_irq = false;
 	mhu->mbox.txdone_poll = true;
 	mhu->mbox.txpoll_period = 1;
@@ -295,6 +412,14 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 	mhu->mbox.of_xlate = mhu_mbox_xlate;
 	amba_set_drvdata(adev, mhu);
 
+	if (pdata->support_doorbells) {
+		mhu->mbox.ops = &mhu_doorbell_ops;
+		handler = mhu_mbox_thread_handler;
+	} else {
+		mhu->mbox.ops = &mhu_ops;
+		handler = mhu_rx_interrupt;
+	}
+
 	err = mbox_controller_register(&mhu->mbox);
 	if (err) {
 		dev_err(dev, "Failed to register mailboxes %d\n", err);
@@ -312,9 +437,8 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
 
-		err = devm_request_threaded_irq(dev, irq, NULL,
-						mhu_rx_interrupt, IRQF_ONESHOT,
-						"mhu_link", mhu);
+		err = devm_request_threaded_irq(dev, irq, NULL, handler,
+						IRQF_ONESHOT, "mhu_link", mhu);
 		if (err) {
 			dev_err(dev, "Can't claim IRQ %d\n", irq);
 			mbox_controller_unregister(&mhu->mbox);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

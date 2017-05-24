From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 3/6] mailbox: arm_mhu: migrate to threaded irq handler
Date: Wed, 24 May 2017 11:16:40 +0100
Message-ID: <1495621003-4291-4-git-send-email-sudeep.holla@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495621003-4291-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In preparation to introduce support for doorbells which require the
interrupt handlers to be threaded, this patch moves the existing
interrupt handler to threaded handler.

Also it moves out the registering and freeing of the handlers from
the mailbox startup and shutdown methods. This also is required to
support doorbells.

Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/mailbox/arm_mhu.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
index be0f293a9457..ebe17c097f43 100644
--- a/drivers/mailbox/arm_mhu.c
+++ b/drivers/mailbox/arm_mhu.c
@@ -84,27 +84,15 @@ static int mhu_startup(struct mbox_chan *chan)
 {
 	struct mhu_link *mlink = chan->con_priv;
 	u32 val;
-	int ret;
 
 	val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
 	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
 
-	ret = request_irq(mlink->irq, mhu_rx_interrupt,
-			  IRQF_SHARED, "mhu_link", chan);
-	if (ret) {
-		dev_err(chan->mbox->dev,
-			"Unable to acquire IRQ %d\n", mlink->irq);
-		return ret;
-	}
-
 	return 0;
 }
 
 static void mhu_shutdown(struct mbox_chan *chan)
 {
-	struct mhu_link *mlink = chan->con_priv;
-
-	free_irq(mlink->irq, chan);
 }
 
 static const struct mbox_chan_ops mhu_ops = {
@@ -132,13 +120,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(mhu->base);
 	}
 
-	for (i = 0; i < MHU_CHANS; i++) {
-		mhu->chan[i].con_priv = &mhu->mlink[i];
-		mhu->mlink[i].irq = adev->irq[i];
-		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
-		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
-	}
-
 	mhu->mbox.dev = dev;
 	mhu->mbox.chans = &mhu->chan[0];
 	mhu->mbox.num_chans = MHU_CHANS;
@@ -155,6 +136,28 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 		return err;
 	}
 
+	for (i = 0; i < MHU_CHANS; i++) {
+		int irq = mhu->mlink[i].irq = adev->irq[i];
+
+		if (irq <= 0) {
+			dev_dbg(dev, "No IRQ found for Channel %d\n", i);
+			continue;
+		}
+
+		mhu->chan[i].con_priv = &mhu->mlink[i];
+		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
+		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
+
+		err = devm_request_threaded_irq(dev, irq, NULL,
+						mhu_rx_interrupt, IRQF_ONESHOT,
+						"mhu_link", &mhu->chan[i]);
+		if (err) {
+			dev_err(dev, "Can't claim IRQ %d\n", irq);
+			mbox_controller_unregister(&mhu->mbox);
+			return err;
+		}
+	}
+
 	dev_info(dev, "ARM MHU Mailbox registered\n");
 	return 0;
 }
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

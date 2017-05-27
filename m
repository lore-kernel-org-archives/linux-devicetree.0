From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v7 1/3] mailbox: Make startup and shutdown ops optional
Date: Sat, 27 May 2017 16:14:02 -0700
Message-ID: <20170527231404.7632-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some mailbox hardware doesn't have to perform any additional operations
on startup of shutdown, so make these optional.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Changes since v6:
- None

 drivers/mailbox/mailbox.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 9dfbf7ea10a2..537f4f6d009b 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -355,11 +355,14 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	ret = chan->mbox->ops->startup(chan);
-	if (ret) {
-		dev_err(dev, "Unable to startup the chan (%d)\n", ret);
-		mbox_free_channel(chan);
-		chan = ERR_PTR(ret);
+	if (chan->mbox->ops->startup) {
+		ret = chan->mbox->ops->startup(chan);
+
+		if (ret) {
+			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
+			mbox_free_channel(chan);
+			chan = ERR_PTR(ret);
+		}
 	}
 
 	mutex_unlock(&con_mutex);
@@ -408,7 +411,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (!chan || !chan->cl)
 		return;
 
-	chan->mbox->ops->shutdown(chan);
+	if (chan->mbox->ops->shutdown)
+		chan->mbox->ops->shutdown(chan);
 
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

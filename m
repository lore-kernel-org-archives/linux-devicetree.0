From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 1/3] mailbox: Make startup and shutdown ops optional
Date: Fri,  5 May 2017 18:31:42 -0700
Message-ID: <20170506013144.15297-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some mailbox hardware doesn't have to perform any additional operations
on startup of shutdown, so make these optional.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Inline the conditionals, rather than breaking them out into separate
  functions

 drivers/mailbox/mailbox.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 4671f8a12872..505651ce9dcc 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -352,11 +352,14 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
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
@@ -405,7 +408,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 	if (!chan || !chan->cl)
 		return;
 
-	chan->mbox->ops->shutdown(chan);
+	if (chan->mbox->ops->shutdown)
+		chan->mbox->ops->shutdown(chan);
 
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
-- 
2.12.0

From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v6 2/4] mailbox: Support stateless mailboxes without txdone
Date: Tue,  9 May 2017 12:47:01 -0700
Message-ID: <20170509194703.28871-2-bjorn.andersson@linaro.org>
References: <20170509194703.28871-1-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170509194703.28871-1-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

For some types of doorbell-like mailbox hardware there is no mechanism
for delivery notification and the only possible message is an identity
element; i.e. the mailbox is stateless and writing any number of
messages to the mailbox is equivalent to writing a single message.

Support this type of mailbox hardware by introducing the "none" tx done
method, which means that neither the hardware nor the client is expected
to tick the mailbox state machine.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Changes since v5:
- New patch

 drivers/mailbox/mailbox.c          | 2 ++
 drivers/mailbox/mailbox.h          | 1 +
 include/linux/mailbox_controller.h | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 505651ce9dcc..bf224c7c8f58 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -453,6 +453,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		txdone = TXDONE_BY_IRQ;
 	else if (mbox->txdone_poll)
 		txdone = TXDONE_BY_POLL;
+	else if (mbox->txdone_none)
+		txdone = TXDONE_NONE;
 	else /* It has to be ACK then */
 		txdone = TXDONE_BY_ACK;
 
diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
index 456ba68513bb..708c8bb822fe 100644
--- a/drivers/mailbox/mailbox.h
+++ b/drivers/mailbox/mailbox.h
@@ -7,6 +7,7 @@
 #ifndef __MAILBOX_H
 #define __MAILBOX_H
 
+#define TXDONE_NONE	0 /* mailbox provides no means of flow control */
 #define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
 #define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define TXDONE_BY_ACK	BIT(2) /* S/W ACK recevied by Client ticks the TX */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 74deadb42d76..43fa4ab9b3e1 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -58,6 +58,7 @@ struct mbox_chan_ops {
  * @ops:		Operators that work on each communication chan
  * @chans:		Array of channels
  * @num_chans:		Number of channels in the 'chans' array.
+ * @txdone_none:	The controller has no sense of TX done
  * @txdone_irq:		Indicates if the controller can report to API when
  *			the last transmitted data was read by the remote.
  *			Eg, if it has some TX ACK irq.
@@ -78,6 +79,7 @@ struct mbox_controller {
 	int num_chans;
 	bool txdone_irq;
 	bool txdone_poll;
+	bool txdone_none;
 	unsigned txpoll_period;
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

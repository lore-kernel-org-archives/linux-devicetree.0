From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 29 Apr 2015 13:25:38 +0100
Message-ID: <1430310338.27241.45.camel@linaro.org>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
	 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
	 <1430229283.3321.40.camel@linaro.org> <5540B840.1030900@arm.com>
	 <1430307828.27241.32.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430307828.27241.32.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-29 at 12:43 +0100, Jon Medhurst (Tixy) wrote:
> On Wed, 2015-04-29 at 11:53 +0100, Sudeep Holla wrote:
> > On 28/04/15 14:54, Jon Medhurst (Tixy) wrote:
> > > On Mon, 2015-04-27 at 12:40 +0100, Sudeep Holla wrote:
> [...]
> > >> +     int ret;
> > >> +     u8 token, chan;
> > >> +     struct scpi_xfer *msg;
> > >> +     struct scpi_chan *scpi_chan;
> > >> +
> > >> +     chan = atomic_inc_return(&scpi_info->next_chan) % scpi_info->num_chans;
> > >> +     scpi_chan = scpi_info->channels + chan;
> > >> +
> > >> +     msg = get_scpi_xfer(scpi_chan);
> > >> +     if (!msg)
> > >> +             return -ENOMEM;
> > >> +
> > >> +     token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
> > >
> > > So, this 8 bit token is what's used to 'uniquely' identify a pending
> > > command. But as it's just an incrementing value, then if one command
> > > gets delayed for long enough that 256 more are issued then we will have
> > > a non-unique value and scpi_process_cmd can go wrong.
> > >
> > 
> > IMO by the time 256 message are queued up and serviced we would timeout
> > on the initial command. Moreover the core mailbox has sent the mailbox
> > length to 20(MBOX_TX_QUEUE_LEN) which needs to removed to even get the
> > remote chance of hit the corner case.
> 
> The corner case can be hit even if the queue length is only 2, because
> other processes/cpus can use the other message we don't own here and
> they can send then receive a message using that, 256 times. The corner
> case doesn't require 256 simultaneous outstanding requests.
> 
> That is the reason I suggested that rather than using an incrementing
> value for the 'unique' token, that each message instead contain the
> value of the token to use with it.

Of course, I failed to mention that this solution to this problem makes
thing worse for the situation where we timeout messages, because the
same token will get reused quicker in that case. So, in practice, if we
have timeouts, and a unchangeable protocol limitation of 256 tokens,
then using those tokens in order, for each message sent is probably the
best we can do.

Perhaps that's the clue, generate and add the token to the message, just
before transmission via the MHU, at a point where we know no other
request can overtake us. In scpi_tx_prepare? Perhaps, it might also be
good to only use up a token if we are expecting a response, and use zero
for other messages?

Something like this totally untested patch...

diff --git a/drivers/mailbox/scpi_protocol.c b/drivers/mailbox/scpi_protocol.c
index c74575b..5818d9b 100644
--- a/drivers/mailbox/scpi_protocol.c
+++ b/drivers/mailbox/scpi_protocol.c
@@ -286,14 +286,23 @@ static void scpi_tx_prepare(struct mbox_client *c, void *msg)
 	struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
 	struct scpi_shared_mem *mem = (struct scpi_shared_mem *)ch->tx_payload;
 
-	mem->command = cpu_to_le32(t->cmd);
 	if (t->tx_buf)
 		memcpy_toio(mem->payload, t->tx_buf, t->tx_len);
 	if (t->rx_buf) {
+		int token;
 		spin_lock_irqsave(&ch->rx_lock, flags);
+		/*
+		 * Presumably we can do this token setting outside
+		 * spinlock and still be safe from concurrency?
+		 */
+		do
+			token = (++ch->token) & CMD_TOKEN_ID_MASK;
+		while(!token);
+		t->cmd |= token << CMD_TOKEN_ID_SHIFT;
 		list_add_tail(&t->node, &ch->rx_pending);
 		spin_unlock_irqrestore(&ch->rx_lock, flags);
 	}
+	mem->command = cpu_to_le32(t->cmd);
 }
 
 static struct scpi_xfer *get_scpi_xfer(struct scpi_chan *ch)
@@ -322,7 +331,7 @@ static int
 scpi_send_message(u8 cmd, void *tx_buf, unsigned int len, void *rx_buf)
 {
 	int ret;
-	u8 token, chan;
+	u8 chan;
 	struct scpi_xfer *msg;
 	struct scpi_chan *scpi_chan;
 
@@ -333,10 +342,8 @@ scpi_send_message(u8 cmd, void *tx_buf, unsigned int len, void *rx_buf)
 	if (!msg)
 		return -ENOMEM;
 
-	token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
-
 	msg->slot = BIT(SCPI_SLOT);
-	msg->cmd = PACK_SCPI_CMD(cmd, token, len);
+	msg->cmd = PACK_SCPI_CMD(cmd, 0, len);
 	msg->tx_buf = tx_buf;
 	msg->tx_len = len;
 	msg->rx_buf = rx_buf;


-- 
Tixy

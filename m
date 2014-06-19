Return-Path: <mporter@linaro.org>
Date: Thu, 19 Jun 2014 15:03:42 -0400
From: Matt Porter <mporter@linaro.org>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Message-ID: <20140619190342.GT4173@beef>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
 <1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
 <53A32927.4060004@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53A32927.4060004@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "patches@linaro.org" <patches@linaro.org>, "bjorn@kryo.se" <bjorn@kryo.se>, "ashwin.chaugule@linaro.org" <ashwin.chaugule@linaro.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "s-anna@ti.com" <s-anna@ti.com>, "loic.pallardy@st.com" <loic.pallardy@st.com>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>, "slapdau@yahoo.com.au" <slapdau@yahoo.com.au>, "courtney.cavin@sonymobile.com" <courtney.cavin@sonymobile.com>, Pawel Moll <Pawel.Moll@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "joshc@codeaurora.org" <joshc@codeaurora.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 19, 2014 at 07:17:11PM +0100, Sudeep Holla wrote:
> Hi Jassi,
> 
> I started using this from v5 and tried briefly to follow previous versions
> and discussion. Please forgive me if I ask questions that are already answered.
> 
> On 12/06/14 18:01, Jassi Brar wrote:
> >Introduce common framework for client/protocol drivers and
> >controller drivers of Inter-Processor-Communication (IPC).
> >
> >Client driver developers should have a look at
> >  include/linux/mailbox_client.h to understand the part of
> >the API exposed to client drivers.
> >Similarly controller driver developers should have a look
> >at include/linux/mailbox_controller.h

...

> >+ * After startup and before shutdown any data received on the chan
> >+ * is passed on to the API via atomic mbox_chan_received_data().
> >+ * The controller should ACK the RX only after this call returns.
> 
> Does this mean we can't support asynchronous messages from the remote.
> One possible scenario I can think is if the remote system power controller
> has feature to configure the bounds for thermal sensors and it can send
> async interrupt when the bounds are crossed. We can't just block one channel
> for this always. Again this might have been discussed before and you might have
> solution, I could not gather it with my brief look at older discussions.

The way I see it we are simply putting the burden on the client to
implement very little in the rx_callback. In my case, we will have a
single client which is the IPC layer. The controller driver will notify
the IPC client layer which will do as little as possible in the
rx_callback before returning. We'll handle asynchronous dispatch of
events within our IPC layer to the real client drivers rather than in
the controller driver.

> >+ */
> >+void mbox_chan_received_data(struct mbox_chan *chan, void *mssg)
> >+{
> >+       /* No buffering the received data */
> >+       if (chan->cl->rx_callback)
> >+               chan->cl->rx_callback(chan->cl, mssg);
> >+}
> >+EXPORT_SYMBOL_GPL(mbox_chan_received_data);
> >+
> >+/**
> >+ * mbox_chan_txdone - A way for controller driver to notify the
> >+ *                     framework that the last TX has completed.
> >+ * @chan: Pointer to the mailbox chan on which TX happened.
> >+ * @r: Status of last TX - OK or ERROR
> >+ *
> >+ * The controller that has IRQ for TX ACK calls this atomic API
> >+ * to tick the TX state machine. It works only if txdone_irq
> >+ * is set by the controller.
> >+ */
> >+void mbox_chan_txdone(struct mbox_chan *chan, int r)
> >+{
> >+       if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
> >+               pr_err("Controller can't run the TX ticker\n");
> >+               return;
> >+       }
> >+
> >+       tx_tick(chan, r);
> >+}
> >+EXPORT_SYMBOL_GPL(mbox_chan_txdone);
> >+
> >+/**
> >+ * mbox_client_txdone - The way for a client to run the TX state machine.
> >+ * @chan: Mailbox channel assigned to this client.
> >+ * @r: Success status of last transmission.
> >+ *
> >+ * The client/protocol had received some 'ACK' packet and it notifies
> >+ * the API that the last packet was sent successfully. This only works
> >+ * if the controller can't sense TX-Done.
> >+ */
> >+void mbox_client_txdone(struct mbox_chan *chan, int r)
> >+{
> >+       if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
> >+               pr_err("Client can't run the TX ticker\n");
> >+               return;
> >+       }
> >+
> >+       tx_tick(chan, r);
> >+}
> >+EXPORT_SYMBOL_GPL(mbox_client_txdone);
> >+
> >+/**
> >+ * mbox_client_peek_data - A way for client driver to pull data
> >+ *                     received from remote by the controller.
> >+ * @chan: Mailbox channel assigned to this client.
> >+ *
> >+ * A poke to controller driver for any received data.
> >+ * The data is actually passed onto client via the
> >+ * mbox_chan_received_data()
> >+ * The call can be made from atomic context, so the controller's
> >+ * implementation of peek_data() must not sleep.
> >+ *
> >+ * Return: True, if controller has, and is going to push after this,
> >+ *          some data.
> >+ *         False, if controller doesn't have any data to be read.
> >+ */
> >+bool mbox_client_peek_data(struct mbox_chan *chan)
> >+{
> >+       if (chan->mbox->ops->peek_data)
> >+               return chan->mbox->ops->peek_data(chan);
> >+
> >+       return false;
> >+}
> >+EXPORT_SYMBOL_GPL(mbox_client_peek_data);
> 
> I am unable to understand how this API will be used. IIUC when the controller
> receives any data from remote, it calls mbox_chan_received_data to push data to
> client.

Good question.

That function is a no-op if your client chooses not to populate
rx_callback. It's not explicitly stated, but the implementation is a
no-op if rx_callback is NULL so rx_callback seems to be intended as an
optional field in the client data.

I'm also not clear of the scenario where this could be used. I
originally thought .peek_data() was an alternative to the callback for
polling purposes except it clearly states it needs the callback to carry
the data.

I probably missed earlier discussion that explains this.

-Matt

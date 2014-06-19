From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7 2/5] mailbox: Introduce framework for mailbox
Date: Fri, 20 Jun 2014 01:59:30 +0530
Message-ID: <CAJe_ZhcTvn+8P71ZgDGYVQH8XHGgOfKvdkYQO8y4tR44KRWkqA@mail.gmail.com>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
	<1402592479-7244-1-git-send-email-jaswinder.singh@linaro.org>
	<53A32927.4060004@arm.com>
	<20140619190342.GT4173@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140619190342.GT4173@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, "ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "s-anna-l0cyMroinI0@public.gmane.org" <s-anna-l0cyMroinI0@public.gmane.org>, "loic.pallardy-qxv4g6HH51o@public.gmane.org" <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org" <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, "courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org" <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20 June 2014 00:33, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Jun 19, 2014 at 07:17:11PM +0100, Sudeep Holla wrote:
>
>> >+ * After startup and before shutdown any data received on the chan
>> >+ * is passed on to the API via atomic mbox_chan_received_data().
>> >+ * The controller should ACK the RX only after this call returns.
>>
>> Does this mean we can't support asynchronous messages from the remote.
>> One possible scenario I can think is if the remote system power controller
>> has feature to configure the bounds for thermal sensors and it can send
>> async interrupt when the bounds are crossed. We can't just block one channel
>> for this always. Again this might have been discussed before and you might have
>> solution, I could not gather it with my brief look at older discussions.
>
> The way I see it we are simply putting the burden on the client to
> implement very little in the rx_callback. In my case, we will have a
> single client which is the IPC layer. The controller driver will notify
> the IPC client layer which will do as little as possible in the
> rx_callback before returning. We'll handle asynchronous dispatch of
> events within our IPC layer to the real client drivers rather than in
> the controller driver.
>
Yes. So do I.

>> >+/**
>> >+ * mbox_client_peek_data - A way for client driver to pull data
>> >+ *                     received from remote by the controller.
>> >+ * @chan: Mailbox channel assigned to this client.
>> >+ *
>> >+ * A poke to controller driver for any received data.
>> >+ * The data is actually passed onto client via the
>> >+ * mbox_chan_received_data()
>> >+ * The call can be made from atomic context, so the controller's
>> >+ * implementation of peek_data() must not sleep.
>> >+ *
>> >+ * Return: True, if controller has, and is going to push after this,
>> >+ *          some data.
>> >+ *         False, if controller doesn't have any data to be read.
>> >+ */
>> >+bool mbox_client_peek_data(struct mbox_chan *chan)
>> >+{
>> >+       if (chan->mbox->ops->peek_data)
>> >+               return chan->mbox->ops->peek_data(chan);
>> >+
>> >+       return false;
>> >+}
>> >+EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>>
>> I am unable to understand how this API will be used. IIUC when the controller
>> receives any data from remote, it calls mbox_chan_received_data to push data to
>> client.
>
> Good question.
>
> That function is a no-op if your client chooses not to populate
> rx_callback. It's not explicitly stated, but the implementation is a
> no-op if rx_callback is NULL so rx_callback seems to be intended as an
> optional field in the client data.
>
> I'm also not clear of the scenario where this could be used. I
> originally thought .peek_data() was an alternative to the callback for
> polling purposes except it clearly states it needs the callback to carry
> the data.
>
> I probably missed earlier discussion that explains this.
>
peek_data is just a trigger for controller to flush out any buffered
RX via mbox_chan_received_data() to upper layer. Intended usecase is
irq-mitigation for QMTM driver, as Arnd pointed out a few months ago.

Thanks
-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

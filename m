From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv7 2/2] mailbox: Adding driver for Xilinx LogiCORE IP mailbox.
Date: Thu, 3 Dec 2015 10:35:36 +0530
Message-ID: <CAJe_ZhexWxTOYTLKH0-NPQ-XVARFUatHVT_XGYcDe_Vhx8ncOg@mail.gmail.com>
References: <1436922022-17564-1-git-send-email-moritz.fischer@ettus.com>
	<1436922022-17564-3-git-send-email-moritz.fischer@ettus.com>
	<CABb+yY3tpepdO=s9nb9kAE241sYVTTXB-ci_4ihuthHTekedNg@mail.gmail.com>
	<CAAtXAHe_7vR71wZPbEw1so_40OEHiNN38mnTuqoX7SCwqEpfcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHe_7vR71wZPbEw1so_40OEHiNN38mnTuqoX7SCwqEpfcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 December 2015 at 22:56, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> wrote:
> Hi Jassi,
>
> thanks for your feedback.
>
> On Mon, Aug 10, 2015 at 1:05 AM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Jul 15, 2015 at 6:30 AM, Moritz Fischer
>> <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> +
>>> +static void xilinx_mbox_rx_data(struct mbox_chan *chan)
>>> +{
>>> +       struct xilinx_mbox *mbox = mbox_chan_to_xilinx_mbox(chan);
>>> +       u32 data;
>>> +
>>> +       if (xilinx_mbox_pending(mbox)) {
>>> +               data = readl_relaxed(mbox->mbox_base + MAILBOX_REG_RDDATA);
>>> +               mbox_chan_received_data(chan, (void *)data);
>>>
>> If RDDATA is a FIFO, then above seems wrong - you are assuming
>> messages are always going to be exactly 32-bits for every protocol.
>> Ideally you should empty the fifo fully, at least when RX has an
>> interrupt.
>
> From my understanding it's hard to tell how much actually is in the fifo,
> you can tell if it's full for send direction, or empty for read direction.
>
Simply read the whole FIFO and leave it to the client driver to parse
that data according to the protocol it drives.

> Maybe the STI / RTI can be setup in a smart way to work with multiple message
> sizes.
>>
>>> +
>>> +static int xilinx_mbox_irq_send_data(struct mbox_chan *chan, void *data)
>>> +{
>>> +       struct xilinx_mbox *mbox = mbox_chan_to_xilinx_mbox(chan);
>>> +       u32 *udata = data;
>>> +
>>> +       if (xilinx_mbox_full(mbox))
>>> +               return -EBUSY;
>>>
>> This check is redundant. last_tx_done already makes sure this is always true.
>
> Good to know. I'll fix it.
>>
>>> +       /* enable interrupt before send */
>>> +       xilinx_mbox_tx_intmask(mbox, true);
>>> +
>>> +       writel_relaxed(*udata, mbox->mbox_base + MAILBOX_REG_WRDATA);
>>> +
>> From status EMPTY and FULL, it seems WRDATA is a FIFO. So here also
>> you should expect messages to be <= fifo depth. And not assume exactly
>> 32bit messages always.
>
> How do I determine the message size?
>
Always expect any write request is exactly the size of FIFO depth.

> Doesn't
> drivers/mailbox/bcm2835-mailbox.c or
>
Well I did point it out
http://lists.infradead.org/pipermail/linux-rpi-kernel/2015-June/001902.html
 ... but developer assumes there will _never_ be need to pass a
message bigger than 32-bits. Sadly overlooking the possibility that
some protocol might have simple, say, 64-bits wide commands and
responses that could avoid using any Shared-Memory at all.

> mailbox-altera.c make the same assumption?
>
There are 2 registers, for CMD and PRT each, that make up 1 message.
It doesn't seem like a fifo.

>>
>>> +
>>> +static bool xilinx_mbox_last_tx_done(struct mbox_chan *chan)
>>> +{
>>> +       struct xilinx_mbox *mbox = mbox_chan_to_xilinx_mbox(chan);
>>> +
>>> +       /* return false if mailbox is full */
>>> +       return !xilinx_mbox_full(mbox);
>>>
>> Instead of FULL, I think it should check for stricter EMPTY status ...
>> mbox api submits only 1 message at a time.
>
> The EMPTY status applies to the receive direction only, I could check
> the STI status
> bit though I suppose.
>
I don't know the h/w but you get my idea. So whatever is in the next revision.

> [...]
>>> +
>>> +       mbox->irq = platform_get_irq(pdev, 0);
>>> +       /* if irq is present, we can use it, otherwise, poll */
>>> +       if (mbox->irq > 0) {
>>> +               mbox->controller.txdone_irq = true;
>>> +               mbox->controller.ops = &xilinx_mbox_irq_ops;
>>> +       } else {
>>> +               dev_info(&pdev->dev, "IRQ not found, fallback to polling.\n");
>>> +               mbox->controller.txdone_poll = true;
>>> +               mbox->controller.txpoll_period = MBOX_POLLING_MS;
>>> +               mbox->controller.ops = &xilinx_mbox_poll_ops;
>>> +
>>> +               setup_timer(&mbox->rxpoll_timer, xilinx_mbox_poll_rx,
>>> +                           (unsigned long)&mbox->chan);
>>>
>> I believe there is indeed some platform that doesn't have RX-Interrupt?
>>  If no, please remove this.
>>  If yes, you may want to get some hint from platform about the size of
>> messages and do mbox_chan_received_data() only upon reading those many
>> bytes.
>
> I'd be fine to drop the polling use case for the moment, on my
> platform I can wire up the IRQ.
> We can always add it back in in a follow up use case.
>

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

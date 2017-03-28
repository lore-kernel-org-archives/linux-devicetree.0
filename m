From: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] mailbox: Add iProc mailbox controller driver
Date: Tue, 28 Mar 2017 10:30:35 -0700
Message-ID: <0e8ac72a-6b2f-171d-41e7-7a6cefc4c7c4@broadcom.com>
References: <1485463082-27067-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485463082-27067-3-git-send-email-jonathan.richardson@broadcom.com>
 <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
 <09177a6f-0612-1e17-a12e-0b1969f5b2e1@broadcom.com>
 <CABb+yY1o7QTYLm3HGWNeFDPnfpL7AAJ6+R91Stn-gNvO7afxoA@mail.gmail.com>
 <22d07bb1-9e93-4ae5-7215-923bde9ebfe5@broadcom.com>
 <CABb+yY1kbFOKJPO95SRw995zt=fCoA+SkXgECOj774i_hJUCNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1kbFOKJPO95SRw995zt=fCoA+SkXgECOj774i_hJUCNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 17-03-15 10:30 AM, Jassi Brar wrote:
> On Fri, Mar 3, 2017 at 2:33 AM, Jonathan Richardson
> <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>
>> On 17-02-23 09:00 PM, Jassi Brar wrote:
>>> On Fri, Feb 24, 2017 at 12:29 AM, Jonathan Richardson
>>> <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>>> On 17-02-16 10:20 PM, Jassi Brar wrote:
>>>>> On Fri, Jan 27, 2017 at 2:08 AM, Jonathan Richardson
>>>>> <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>>>>
>>>>>> +static int iproc_mbox_send_data_m0(struct mbox_chan *chan, void *data)
>>>>>> +{
>>>>>> +       struct iproc_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
>>>>>> +       struct iproc_mbox_msg *msg = (struct iproc_mbox_msg *)data;
>>>>>> +               unsigned long flags;
>>>>>> +       int err = 0;
>>>>>> +       const int poll_period_us = 5;
>>>>>> +       const int max_retries = (MAX_M0_TIMEOUT_MS * 1000) / poll_period_us;
>>>>>> +
>>>>>> +       if (!msg)
>>>>>> +               return -EINVAL;
>>>>>> +
>>>>>> +       spin_lock_irqsave(&mbox->lock, flags);
>>>>>> +
>>>>>> +       dev_dbg(mbox->dev, "Send msg to M0: cmd=0x%x, param=0x%x, wait_ack=%d\n",
>>>>>> +               msg->cmd, msg->param, msg->wait_ack);
>>>>>> +
>>>>> prints should be outside the spinlocks.
>>>>>
>>>>>> +       writel(msg->cmd, mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
>>>>>> +       writel(msg->param, mbox->base + IPROC_CRMU_MAILBOX1_OFFSET);
>>>>>> +
>>>>>> +       if (msg->wait_ack) {
>>>>>> +               int retries;
>>>>>> +
>>>>> move poll_period_us and max_retries in here or just define' them
>>>>>
>>>>>> +               err = msg->reply_code = -ETIMEDOUT;
>>>>>> +               for (retries = 0; retries < max_retries; retries++) {
>>>>>> +                       u32 val = readl(
>>>>>> +                               mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
>>>>>> +                       if (val & M0_IPC_CMD_DONE_MASK) {
>>>>>> +                               /*
>>>>>> +                                * M0 replied - save reply code and
>>>>>> +                                * clear error.
>>>>>> +                                */
>>>>>> +                               msg->reply_code = (val &
>>>>>> +                                       M0_IPC_CMD_REPLY_MASK) >>
>>>>>> +                                       M0_IPC_CMD_REPLY_SHIFT;
>>>>>> +                               err = 0;
>>>>>> +                               break;
>>>>>> +                       }
>>>>>> +                       udelay(poll_period_us);
>>>>>>
>>>>> potentially 2ms inside spin_lock_irqsave. Alternative is to implement
>>>>> a simple 'peek_data' and call it for requests with 'wait_ack'
>>>> Hi Jassi. The M0 response is normally 25-30 us.
>>>>
>>> You hardcode the behaviour of your protocol in the controller driver.
>>> What if your next platform/protocol has commands that the remote/M0
>>> takes upto 10ms to respond (because they are not critical/trivial)?
>>>
> You overlooked this concern?
>
>>> If you don't have some h/w indicator (like irq or bit-flag) for
>>> tx-done and data-rx , you have to use ack-by-client and peek method.
>> There isn't any functionality not in the driver. We write the message to two registers and poll another to know when it's complete. Nothing can touch the registers again until the operation is complete. We can't even pass data back to the controller. We pass pointers to the M0 and it can write to the memory. The only data we sent back to the client is that status code from the polled register. When complete, data will already be written into the clients memory from the M0.
>>> Commands that don't get a response will be immediately followed by
>>> mbox_client_txdone(), while others would need to call peek_data() to
>>> poll for data-rx. Please note, if you implement the tx_prepare
>>> callback, you will know when to start peeking for incoming data.
>> The driver will need to block access to the registers if we remove the spinlock.
>> If a client sends a message that doesn't get a response and another client has
>> already sent a message that does which is pending, it still needs to be blocked.
>>
>> The framework queues messages on a per channel basis. We have several clients for
>> various drivers each with their own mbox channel. send_data in the controller could
>> return EBUSY if the channel is being used by another channel (ie- transaction pending).
>> If channel A sends a message, then client B sends one before A is complete, the
>> controller's send_data must return an error.
>>
> Many platforms have clients sharing channels.
Hi Jassi. Could you point me to one? I've looked at all of them and don't see any of them sharing channels.
> The right way to do is have a 'server/owner' client that accepts
> requests from various clients and serially queue them to mailbox. That
> way you can keep the controller driver free from quirks (like max wait
> time of 30us) of your present platform.
Do you mean 1 mailbox client with one mailbox channel that all the mbox client drivers share? I thought this would work when I suggested it previously but the client callbacks are necessary in all txdone modes. Client drivers that send the messages need the callbacks and this is only possible with multiple mbox clients. And a channel can only have 1 mbox client. Clients in multiple drivers need the callbacks to either know when to start polling, or be notified when the transaction is complete. It would be nice if multiple clients could use the same channel.

Thanks.
> thanks

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

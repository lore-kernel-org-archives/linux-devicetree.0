From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] mailbox: Add iProc mailbox controller driver
Date: Wed, 15 Mar 2017 23:00:50 +0530
Message-ID: <CABb+yY1kbFOKJPO95SRw995zt=fCoA+SkXgECOj774i_hJUCNg@mail.gmail.com>
References: <1485463082-27067-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485463082-27067-3-git-send-email-jonathan.richardson@broadcom.com>
 <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
 <09177a6f-0612-1e17-a12e-0b1969f5b2e1@broadcom.com> <CABb+yY1o7QTYLm3HGWNeFDPnfpL7AAJ6+R91Stn-gNvO7afxoA@mail.gmail.com>
 <22d07bb1-9e93-4ae5-7215-923bde9ebfe5@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22d07bb1-9e93-4ae5-7215-923bde9ebfe5-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 3, 2017 at 2:33 AM, Jonathan Richardson
<jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>
>
> On 17-02-23 09:00 PM, Jassi Brar wrote:
>> On Fri, Feb 24, 2017 at 12:29 AM, Jonathan Richardson
>> <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>>
>>> On 17-02-16 10:20 PM, Jassi Brar wrote:
>>>> On Fri, Jan 27, 2017 at 2:08 AM, Jonathan Richardson
>>>> <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>>>>
>>>>> +static int iproc_mbox_send_data_m0(struct mbox_chan *chan, void *dat=
a)
>>>>> +{
>>>>> +       struct iproc_mbox *mbox =3D dev_get_drvdata(chan->mbox->dev);
>>>>> +       struct iproc_mbox_msg *msg =3D (struct iproc_mbox_msg *)data;
>>>>> +               unsigned long flags;
>>>>> +       int err =3D 0;
>>>>> +       const int poll_period_us =3D 5;
>>>>> +       const int max_retries =3D (MAX_M0_TIMEOUT_MS * 1000) / poll_p=
eriod_us;
>>>>> +
>>>>> +       if (!msg)
>>>>> +               return -EINVAL;
>>>>> +
>>>>> +       spin_lock_irqsave(&mbox->lock, flags);
>>>>> +
>>>>> +       dev_dbg(mbox->dev, "Send msg to M0: cmd=3D0x%x, param=3D0x%x,=
 wait_ack=3D%d\n",
>>>>> +               msg->cmd, msg->param, msg->wait_ack);
>>>>> +
>>>> prints should be outside the spinlocks.
>>>>
>>>>> +       writel(msg->cmd, mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
>>>>> +       writel(msg->param, mbox->base + IPROC_CRMU_MAILBOX1_OFFSET);
>>>>> +
>>>>> +       if (msg->wait_ack) {
>>>>> +               int retries;
>>>>> +
>>>> move poll_period_us and max_retries in here or just define' them
>>>>
>>>>> +               err =3D msg->reply_code =3D -ETIMEDOUT;
>>>>> +               for (retries =3D 0; retries < max_retries; retries++)=
 {
>>>>> +                       u32 val =3D readl(
>>>>> +                               mbox->base + IPROC_CRMU_MAILBOX0_OFFS=
ET);
>>>>> +                       if (val & M0_IPC_CMD_DONE_MASK) {
>>>>> +                               /*
>>>>> +                                * M0 replied - save reply code and
>>>>> +                                * clear error.
>>>>> +                                */
>>>>> +                               msg->reply_code =3D (val &
>>>>> +                                       M0_IPC_CMD_REPLY_MASK) >>
>>>>> +                                       M0_IPC_CMD_REPLY_SHIFT;
>>>>> +                               err =3D 0;
>>>>> +                               break;
>>>>> +                       }
>>>>> +                       udelay(poll_period_us);
>>>>>
>>>> potentially 2ms inside spin_lock_irqsave. Alternative is to implement
>>>> a simple 'peek_data' and call it for requests with 'wait_ack'
>>> Hi Jassi. The M0 response is normally 25-30 us.
>>>
>> You hardcode the behaviour of your protocol in the controller driver.
>> What if your next platform/protocol has commands that the remote/M0
>> takes upto 10ms to respond (because they are not critical/trivial)?
>>
You overlooked this concern?

>> If you don't have some h/w indicator (like irq or bit-flag) for
>> tx-done and data-rx , you have to use ack-by-client and peek method.
> There isn't any functionality not in the driver. We write the message to =
two registers and poll another to know when it's complete. Nothing can touc=
h the registers again until the operation is complete. We can't even pass d=
ata back to the controller. We pass pointers to the M0 and it can write to =
the memory. The only data we sent back to the client is that status code fr=
om the polled register. When complete, data will already be written into th=
e clients memory from the M0.
>> Commands that don't get a response will be immediately followed by
>> mbox_client_txdone(), while others would need to call peek_data() to
>> poll for data-rx. Please note, if you implement the tx_prepare
>> callback, you will know when to start peeking for incoming data.
> The driver will need to block access to the registers if we remove the sp=
inlock.
> If a client sends a message that doesn't get a response and another clien=
t has
> already sent a message that does which is pending, it still needs to be b=
locked.
>
> The framework queues messages on a per channel basis. We have several cli=
ents for
> various drivers each with their own mbox channel. send_data in the contro=
ller could
> return EBUSY if the channel is being used by another channel (ie- transac=
tion pending).
> If channel A sends a message, then client B sends one before A is complet=
e, the
> controller's send_data must return an error.
>
Many platforms have clients sharing channels.
The right way to do is have a 'server/owner' client that accepts
requests from various clients and serially queue them to mailbox. That
way you can keep the controller driver free from quirks (like max wait
time of 30us) of your present platform.

thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

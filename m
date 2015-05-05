From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3 v7] mailbox: Enable BCM2835 mailbox support
Date: Tue, 5 May 2015 08:00:01 +0530
Message-ID: <CABb+yY2V5dXQ5fH3s2T4-j6-z68bOzaeUN9WQoNze2mc-quD+A@mail.gmail.com>
References: <1430254460-26754-1-git-send-email-eric@anholt.net>
	<1430327374-6562-1-git-send-email-eric@anholt.net>
	<CABb+yY0+Dd6RMJfmcqWrJfsSkPS8KjtpctJteoTZrj3QttJ71g@mail.gmail.com>
	<871tivq1rp.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871tivq1rp.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 5, 2015 at 6:27 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> On Wed, Apr 29, 2015 at 10:39 PM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
>>
>>> +
>>> +struct bcm2835_mbox {
>>> +       struct device *dev;
>>> +       void __iomem *regs;
>>> +       spinlock_t lock;
>>> +       struct mbox_controller controller;
>>> +};
>>> +
>>> +static struct bcm2835_mbox *mbox;
>>> +
>>> +static irqreturn_t bcm2835_mbox_irq(int irq, void *dev_id)
>>> +{
>>> +       struct device *dev = mbox->dev;
>>> +       struct mbox_chan *link = &mbox->controller.chans[0];
>>> +
>> I learn from Stephen's other post that the controller could have
>> multiple channels. In which case this driver is poorly setup. Actually
>> if the driver was designed properly there isn't anything special to be
>> done.
>>  Here you choose to waste 'dev_id' and hard-code dereferencing to channel-0
>
> There's only the one channel according to the docs.  I wish we wouldn't
> get derailed by speculation on the list when the documentation is
> available. :(
>
Can I have the pointer to the doc please, if its publicly available.

>>> +       while (!(readl(mbox->regs + MAIL0_STA) & ARM_MS_EMPTY)) {
>>> +               u32 msg = readl(mbox->regs + MAIL0_RD);
>>> +               dev_dbg(dev, "Reply 0x%08X\n", msg);
>>> +               mbox_chan_received_data(link, &msg);
>>> +       }
>>> +       return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int bcm2835_send_data(struct mbox_chan *link, void *data)
>>> +{
>>> +       int ret = 0;
>>> +       u32 msg = *(u32 *)data;
>>> +
>>> +       spin_lock(&mbox->lock);
>>> +       writel(msg, mbox->regs + MAIL1_WRT);
>>> +       dev_dbg(mbox->dev, "Request 0x%08X\n", msg);
>>> +end:
>>>
>> Did you compile check the driver for errors and warnings?
>
> At this point I'm so burned out on repainting this bikeshed that I
> missed a spot of the current color.
>
I have just rechecked the thread and I didn't find any revision that
had only nits picked. Subsystems even dictate how the files are named
and ordered in Makefile, and you have been insisting on hardcoding
values.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

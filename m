From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3 v5] mailbox: Enable BCM2835 mailbox support
Date: Tue, 28 Apr 2015 11:13:31 +0530
Message-ID: <CABb+yY2u_v1uSDrBgP2DRAOrDkXETfs_zmLACm=uRFALVYFjmA@mail.gmail.com>
References: <1430173644-19099-1-git-send-email-eric@anholt.net>
	<1430173644-19099-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430173644-19099-3-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 28, 2015 at 3:57 AM, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
>
> Implement BCM2835 mailbox support as a device registered with the
> general purpose mailbox framework. Implementation based on commits by
> Lubomir Rintel [1], Suman Anna and Jassi Brar [2] on which to base the
> implementation.
>
> [1] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-April/000528.html
> [2] http://lists.infradead.org/pipermail/linux-rpi-kernel/2013-May/000546.html
>
We could probably drop the history from changelog. Just talk about
what the controller is and any specifics of the driver.

> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> Signed-off-by: Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>
> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
How come it has my s-o-b?


> diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
> new file mode 100644
> index 0000000..6910c71
> --- /dev/null
> +++ b/drivers/mailbox/bcm2835-mailbox.c
> @@ -0,0 +1,220 @@
> +/*
> + *  Copyright (C) 2010 Broadcom
> + *  Copyright (C) 2013-2014 Lubomir Rintel
> + *  Copyright (C) 2013 Craig McGeachie
> + *
You may want to make it 2015


> +
> +/* Status register: FIFO state. */
> +#define ARM_MS_FULL            0x80000000
> +#define ARM_MS_EMPTY           0x40000000
>
nit:  BIT(31) and BIT(30)

> +
> +/* Configuration register: Enable interrupts. */
> +#define ARM_MC_IHAVEDATAIRQEN  0x00000001
>
nit: BIT(0)

> +
> +struct bcm2835_mbox {
> +       struct device *dev;
> +       void __iomem *regs;
> +       spinlock_t lock;
> +       bool started;
> +       struct mbox_controller controller;
> +};
> +
> +struct bcm2835_mbox *mbox;
> +
Bad omen. You assume any platform will ever have just one instance of
the mailbox controller. Which may come true, but still is a taboo to
think of.


> +static irqreturn_t bcm2835_mbox_irq(int irq, void *dev_id)
> +{
> +       struct device *dev = mbox->dev;
>
.... and you are wasting 'dev_id' here, which could have been 'mbox'


> +       struct mbox_chan *link = &mbox->controller.chans[0];
> +
> +       while (!(readl(mbox->regs + MAIL0_STA) & ARM_MS_EMPTY)) {
> +               u32 msg = readl(mbox->regs + MAIL0_RD);
> +
> +               if (!mbox->started) {
> +                       dev_err(dev, "Reply 0x%08x with no client attached\n",
> +                               msg);
>
This shouldn't happen unless the remote could send asynchronous
commands to Linux. And even if it does, we shouldn't be seeing them
before we are ready. Please move the "Enable the interrupt on data
reception" from probe to bcm2835_startup(), and disable interrupts in
bcm2835_shutdown()


> +static int bcm2835_send_data(struct mbox_chan *link, void *data)
> +{
> +       int ret = 0;
> +       u32 msg = *(u32 *)data;
> +
Sorry, this is seen as an abuse. Please pass pointer to a u32 and not
typecast the value.

> +       if (!mbox->started)
> +               return -ENODEV;
>
This 'started' flag is unnecessary. API won't call send_data() before
startup() or after shutdown().

> +       if (readl(mbox->regs + MAIL0_STA) & ARM_MS_FULL) {
> +               ret = -EBUSY;
> +               goto end;
> +       }
>
This check is unnecessary too. API would have already called
last_tx_done() already to make sure this never hits.

Cheers.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

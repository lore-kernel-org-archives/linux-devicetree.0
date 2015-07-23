From: Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] mailbox: Add support for ST's Mailbox IP
Date: Thu, 23 Jul 2015 20:23:26 +0300
Message-ID: <CALW4P+K5PqVxPehWcSX2-t_rENpsV_RB7TNeJ9sN-EdZUOXm4Q@mail.gmail.com>
References: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
	<1437134647-28298-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437134647-28298-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, Jul 17, 2015 at 3:04 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> ST's platforms currently support a maximum of 5 Mailboxes, one for
> each of the supported co-processors situated on the platform.  Each
> Mailbox is divided up into 4 instances which consist of 32 channels.
> Messages are passed between the application and co-processors using
> shared memory areas.  It is the Client's responsibility to manage
> these areas.
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/mailbox/Kconfig       |   7 +
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/mailbox-sti.c | 562 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 571 insertions(+)
>  create mode 100644 drivers/mailbox/mailbox-sti.c

[..]

> +static irqreturn_t sti_mbox_thread_handler(int irq, void *data)
> +{
> +       struct sti_mbox_device *mdev = data;
> +       struct sti_mbox_pdata *pdata = dev_get_platdata(mdev->dev);
> +       struct mbox_chan *chan;
> +       unsigned int instance;
> +
> +       for (instance = 0; instance < pdata->num_inst; instance++) {
> +keep_looking:
> +               chan = sti_mbox_irq_to_channel(mdev, instance);
> +               if (!chan)
> +                       continue;
> +
> +               mbox_chan_received_data(chan, NULL);
> +               sti_mbox_clear_irq(chan);
> +               sti_mbox_enable_channel(chan);
> +               goto keep_looking;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t sti_mbox_irq_handler(int irq, void *data)
> +{
> +       struct sti_mbox_device *mdev = data;
> +       struct sti_mbox_pdata *pdata = dev_get_platdata(mdev->dev);
> +       struct sti_channel *chan_info;
> +       struct mbox_chan *chan;
> +       unsigned int instance;
> +       int ret = IRQ_NONE;
> +
> +       for (instance = 0; instance < pdata->num_inst; instance++) {
> +               chan = sti_mbox_irq_to_channel(mdev, instance);
> +               if (!chan)
> +                       continue;
> +               chan_info = chan->con_priv;
> +
> +               if (!sti_mbox_channel_is_enabled(chan)) {
> +                       dev_warn(mdev->dev,
> +                                "Unexpected IRQ: %s\n"
> +                                "  instance: %d: channel: %d [enabled: %x]\n",
> +                                mdev->name, chan_info->instance,
> +                                chan_info->channel, mdev->enabled[instance]);
> +                       ret = IRQ_HANDLED;
> +                       continue;
> +               }
> +
> +               sti_mbox_disable_channel(chan);
> +               ret = IRQ_WAKE_THREAD;
> +       }
> +
> +       if (ret == IRQ_NONE)
> +               dev_err(mdev->dev, "Spurious IRQ - was a channel requested?\n");
> +
> +       return ret;
> +}

With such usage of ret variable can it happen that handling of last
but one channel/instance will set ret to IRQ_WAKE_THREAD and at the
same time handling of last channel/instance will set ret to
IRQ_HANDLED during iteration loop and finally generic subsystem will
not wake up thread handler because it will receive IRQ_HANDLED?
Just checking.


[..]

-- 
Thanks,
Alexey Klimov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

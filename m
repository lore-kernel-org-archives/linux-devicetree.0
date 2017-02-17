From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] mailbox: Add iProc mailbox controller driver
Date: Fri, 17 Feb 2017 11:50:26 +0530
Message-ID: <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
References: <1485463082-27067-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485463082-27067-3-git-send-email-jonathan.richardson@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485463082-27067-3-git-send-email-jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Richardson <jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 27, 2017 at 2:08 AM, Jonathan Richardson
<jonathan.richardson-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

> +static int iproc_mbox_send_data_m0(struct mbox_chan *chan, void *data)
> +{
> +       struct iproc_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
> +       struct iproc_mbox_msg *msg = (struct iproc_mbox_msg *)data;
> +               unsigned long flags;
> +       int err = 0;
> +       const int poll_period_us = 5;
> +       const int max_retries = (MAX_M0_TIMEOUT_MS * 1000) / poll_period_us;
> +
> +       if (!msg)
> +               return -EINVAL;
> +
> +       spin_lock_irqsave(&mbox->lock, flags);
> +
> +       dev_dbg(mbox->dev, "Send msg to M0: cmd=0x%x, param=0x%x, wait_ack=%d\n",
> +               msg->cmd, msg->param, msg->wait_ack);
> +
prints should be outside the spinlocks.

> +       writel(msg->cmd, mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
> +       writel(msg->param, mbox->base + IPROC_CRMU_MAILBOX1_OFFSET);
> +
> +       if (msg->wait_ack) {
> +               int retries;
> +
move poll_period_us and max_retries in here or just define' them

> +               err = msg->reply_code = -ETIMEDOUT;
> +               for (retries = 0; retries < max_retries; retries++) {
> +                       u32 val = readl(
> +                               mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
> +                       if (val & M0_IPC_CMD_DONE_MASK) {
> +                               /*
> +                                * M0 replied - save reply code and
> +                                * clear error.
> +                                */
> +                               msg->reply_code = (val &
> +                                       M0_IPC_CMD_REPLY_MASK) >>
> +                                       M0_IPC_CMD_REPLY_SHIFT;
> +                               err = 0;
> +                               break;
> +                       }
> +                       udelay(poll_period_us);
>
potentially 2ms inside spin_lock_irqsave. Alternative is to implement
a simple 'peek_data' and call it for requests with 'wait_ack'
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

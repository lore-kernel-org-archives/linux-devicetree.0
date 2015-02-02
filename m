From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] mailbox: Add Altera mailbox driver
Date: Mon, 2 Feb 2015 15:14:16 +0800
Message-ID: <CAFiDJ59p3x711f+vYnpTXevdKRCSnvVyQzSpSAbvc1BNw2dBVQ@mail.gmail.com>
References: <1419241498-3290-1-git-send-email-lftan@altera.com>
	<CABb+yY08a3c1Cwc+yTEJu=htejJDBB=GY30NGY75whQNMbCrgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY08a3c1Cwc+yTEJu=htejJDBB=GY30NGY75whQNMbCrgQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 2, 2015 at 3:04 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Dec 22, 2014 at 3:14 PM, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
> ...
>
>> diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
>> new file mode 100644
>> index 0000000..8019795
>> --- /dev/null
>> +++ b/drivers/mailbox/mailbox-altera.c
>> @@ -0,0 +1,385 @@
>> +/*
>> + * Copyright Altera Corporation (C) 2013-2014. All rights reserved
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DRIVER_NAME    "altera-mailbox"
>> +
>> +#define MAILBOX_CMD_REG                        0x00
>> +#define MAILBOX_PTR_REG                        0x04
>> +#define MAILBOX_STS_REG                        0x08
>> +#define MAILBOX_INTMASK_REG            0x0C
>> +
>> +#define INT_PENDING_MSK                        0x1
>> +#define INT_SPACE_MSK                  0x2
>> +
>> +#define STS_PENDING_MSK                        0x1
>> +#define STS_FULL_MSK                   0x2
>> +#define STS_FULL_OFT                   0x1
>> +
>> +#define MBOX_PENDING(status)   (((status) & STS_PENDING_MSK))
>> +#define MBOX_FULL(status)      (((status) & STS_FULL_MSK) >> STS_FULL_OFT)
>> +
>> +enum altera_mbox_msg {
>> +       MBOX_CMD = 0,
>> +       MBOX_PTR,
>> +};
>> +
>> +#define MBOX_POLLING_MS                1       /* polling interval 1ms */
>> +
> The intention is too aggressive - though poll won't be before next jiffy (>1ms).
> And if you are not expecting a reply, it should be even bigger. Say,
> 50ms default and 5ms when you expect RX?
Currently MBOX_POLLING_MS is used for RX polling and TX polling.
I think change to 5ms should be fine, 50ms is a bit too long. Do you
okay with this?
>
>> +struct altera_mbox {
>> +       bool is_sender;         /* 1-sender, 0-receiver */
>> +       bool intr_mode;
>> +       int irq;
>> +       void __iomem *mbox_base;
>> +       struct device *dev;
>> +       struct mbox_controller controller;
>> +
>> +       /* If the controller supports only RX polling mode */
>> +       struct timer_list rxpoll_timer;
>> +};
>> +
>> +static struct altera_mbox *mbox_chan_to_altera_mbox(struct mbox_chan *chan)
>> +{
>> +       if (!chan || !chan->con_priv)
>> +               return NULL;
>> +
>> +       return (struct altera_mbox *)chan->con_priv;
>> +}
>> +
>> +static inline int altera_mbox_full(struct altera_mbox *mbox)
>> +{
>> +       u32 status;
>> +
>> +       status = readl(mbox->mbox_base + MAILBOX_STS_REG);
>> +       return MBOX_FULL(status);
>> +}
>>
> s/readl/readl_relaxed  and s/writel/writel_relaxed everywhere
Noted.
>
>> +
>> +static inline int altera_mbox_pending(struct altera_mbox *mbox)
>> +{
>> +       u32 status;
>> +
>> +       status = readl(mbox->mbox_base + MAILBOX_STS_REG);
>> +       return MBOX_PENDING(status);
>> +}
>> +
>> +static void altera_mbox_rx_intmask(struct altera_mbox *mbox, bool enable)
>> +{
>> +       u32 mask;
>> +
>> +       mask = readl(mbox->mbox_base + MAILBOX_INTMASK_REG);
>> +       if (enable)
>> +               mask |= INT_PENDING_MSK;
>> +       else
>> +               mask &= ~INT_PENDING_MSK;
>> +       writel(mask, mbox->mbox_base + MAILBOX_INTMASK_REG);
>> +}
>> +
>> +static void altera_mbox_tx_intmask(struct altera_mbox *mbox, bool enable)
>> +{
>> +       u32 mask;
>> +
>> +       mask = readl(mbox->mbox_base + MAILBOX_INTMASK_REG);
>> +       if (enable)
>> +               mask |= INT_SPACE_MSK;
>> +       else
>> +               mask &= ~INT_SPACE_MSK;
>> +       writel(mask, mbox->mbox_base + MAILBOX_INTMASK_REG);
>> +}
>> +
>> +static bool altera_mbox_is_sender(struct altera_mbox *mbox)
>> +{
>> +       u32 reg;
>> +       /* Write a magic number to PTR register and read back this register.
>> +        * This register is read-write if it is a sender.
>> +        */
>> +       #define MBOX_MAGIC      0xA5A5AA55
>> +       writel(MBOX_MAGIC, mbox->mbox_base + MAILBOX_PTR_REG);
>> +       reg = readl(mbox->mbox_base + MAILBOX_PTR_REG);
>> +       if (reg == MBOX_MAGIC) {
>> +               /* Clear to 0 */
>> +               writel(0, mbox->mbox_base + MAILBOX_PTR_REG);
>> +               return true;
>> +       }
>> +       return false;
>> +}
>> +
>> +static void altera_mbox_rx_data(struct mbox_chan *chan)
>> +{
>> +       struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
>> +       u32 data[2];
>> +
>> +       if (altera_mbox_pending(mbox)) {
>> +               data[MBOX_PTR] = readl(mbox->mbox_base + MAILBOX_PTR_REG);
>> +               data[MBOX_CMD] = readl(mbox->mbox_base + MAILBOX_CMD_REG);
>> +               mbox_chan_received_data(chan, (void *)data);
>> +       }
>> +}
>> +
>> +static void altera_mbox_poll_rx(unsigned long data)
>> +{
>> +       struct mbox_chan *chan = (struct mbox_chan *)data;
>> +       struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
>> +
>> +       altera_mbox_rx_data(chan);
>> +
>> +       mod_timer(&mbox->rxpoll_timer,
>> +                 jiffies + msecs_to_jiffies(MBOX_POLLING_MS));
>> +}
>> +
>> +static irqreturn_t altera_mbox_tx_interrupt(int irq, void *p)
>> +{
>> +       struct mbox_chan *chan = (struct mbox_chan *)p;
>> +       struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
>> +
>> +       altera_mbox_tx_intmask(mbox, false);
>> +       mbox_chan_txdone(chan, 0);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t altera_mbox_rx_interrupt(int irq, void *p)
>> +{
>> +       struct mbox_chan *chan = (struct mbox_chan *)p;
>> +
>> +       altera_mbox_rx_data(chan);
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static int altera_mbox_startup_sender(struct mbox_chan *chan)
>> +{
>> +       int ret;
>> +       struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
>> +
>> +       if (mbox->intr_mode) {
>> +               ret = request_irq(mbox->irq, altera_mbox_tx_interrupt, 0,
>> +                                 DRIVER_NAME, chan);
>> +               if (unlikely(ret)) {
>> +                       dev_err(mbox->dev,
>> +                               "failed to register mailbox interrupt:%d\n",
>> +                               ret);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int altera_mbox_startup_receiver(struct mbox_chan *chan)
>> +{
>> +       int ret;
>> +       struct altera_mbox *mbox = mbox_chan_to_altera_mbox(chan);
>> +
>> +       if (mbox->intr_mode) {
>> +               ret = request_irq(mbox->irq, altera_mbox_rx_interrupt, 0,
>> +                                 DRIVER_NAME, chan);
>> +               if (unlikely(ret)) {
>> +                       dev_err(mbox->dev,
>> +                               "failed to register mailbox interrupt:%d\n",
>> +                               ret);
>> +                       return ret;
>>
> Is this really fatal?  Maybe continue using the timer scheme below?
Yes, can change to polling mode.

>
>> +               }
>> +               altera_mbox_rx_intmask(mbox, true);
>> +       } else {
>> +               /* Setup polling timer */
>> +               setup_timer(&mbox->rxpoll_timer, altera_mbox_poll_rx,
>> +                           (unsigned long)chan);
>> +               mod_timer(&mbox->rxpoll_timer,
>> +                         jiffies + msecs_to_jiffies(MBOX_POLLING_MS));
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>
Regards
Ley Foon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

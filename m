From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH (resend)] mailbox: Add Altera mailbox driver
Date: Mon, 15 Dec 2014 08:22:23 -0600
Message-ID: <548EEE9F.4030508@gmail.com>
References: <CAFiDJ58uQifY7th-mzvm2mjgJdw_MWmWFFhDPYT9TomOexiVNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFiDJ58uQifY7th-mzvm2mjgJdw_MWmWFFhDPYT9TomOexiVNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/15/14, 12:22 AM, Ley Foon Tan wrote:
> On Fri, Dec 12, 2014 at 10:38 PM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>> +
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/device.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/of.h>
>>> +#include <linux/mailbox_controller.h>
>>
>> Alphabetize the headers.
> Okay.
> 
> 
>>> +static int altera_mbox_startup_sender(struct mbox_chan *chan)
>>> +{
>>> +     int ret;
>>> +     struct altera_mbox *mbox = to_altera_mbox(chan);
>>> +
>>> +     if (mbox->intr_mode) {
>>> +             ret = request_irq(mbox->irq, altera_mbox_tx_interrupt, 0,
>>
>> Use devm_request_irq, since you didn't have and don't need use free_irq
>> in the shutdown function.
> We want to free_irq when it shutdown. That means nobody requests for
> that mailbox (or channel) and request_irq() again if someone requests
> for a mailbox.
> 

But you didn't have any free_irq in the shutdown function. Use
devm_request_irq here, so you don't have to add them.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

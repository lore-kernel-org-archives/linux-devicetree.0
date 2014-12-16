From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH (resend)] mailbox: Add Altera mailbox driver
Date: Tue, 16 Dec 2014 10:00:48 +0800
Message-ID: <CAFiDJ5_7u3hSAjxXOxDG_RwFOMA+bNeu8w3DYhVHUN9tC5ucsw@mail.gmail.com>
References: <CAFiDJ58uQifY7th-mzvm2mjgJdw_MWmWFFhDPYT9TomOexiVNw@mail.gmail.com>
	<548EEE9F.4030508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <548EEE9F.4030508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 15, 2014 at 10:22 PM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
> On 12/15/14, 12:22 AM, Ley Foon Tan wrote:
>> On Fri, Dec 12, 2014 at 10:38 PM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>>> +
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/mailbox_controller.h>
>>>
>>> Alphabetize the headers.
>> Okay.
>>
>>
>>>> +static int altera_mbox_startup_sender(struct mbox_chan *chan)
>>>> +{
>>>> +     int ret;
>>>> +     struct altera_mbox *mbox = to_altera_mbox(chan);
>>>> +
>>>> +     if (mbox->intr_mode) {
>>>> +             ret = request_irq(mbox->irq, altera_mbox_tx_interrupt, 0,
>>>
>>> Use devm_request_irq, since you didn't have and don't need use free_irq
>>> in the shutdown function.
>> We want to free_irq when it shutdown. That means nobody requests for
>> that mailbox (or channel) and request_irq() again if someone requests
>> for a mailbox.
>>
>
> But you didn't have any free_irq in the shutdown function. Use
> devm_request_irq here, so you don't have to add them.

Hi Dinh

free_irq() is in  altera_mbox_shutdown(). This function will be called
when user free/release the mailbox (channel).
But, devm_free_irq() only will be called when unload the module.

+static void altera_mbox_shutdown(struct mbox_chan *chan)
+{
+       struct altera_mbox *mbox = to_altera_mbox(chan);
+
+       if (WARN_ON(!mbox))
+               return;
+
+       if (mbox->intr_mode) {
+               /* Unmask all interrupt masks */
+               __raw_writel(~0, mbox->mbox_base + MAILBOX_INTMASK_REG);
+               free_irq(mbox->irq, chan);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

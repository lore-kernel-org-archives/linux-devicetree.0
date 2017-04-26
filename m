From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/7] pinctrl: aramda-37xx: Add irqchip support
Date: Wed, 26 Apr 2017 14:03:15 +0200
Message-ID: <CACRpkdYYRe4A+Zj+fDpC9SA1pgaVSgewYGB_vCNoWNRXWTtTGQ@mail.gmail.com>
References: <cover.65d0e6796fecf1fe6c5d07b981160b54dc9b4acd.1491405475.git-series.gregory.clement@free-electrons.com>
 <70ffe3343c13d01737bf74e5de4898d0c0be07a0.1491405475.git-series.gregory.clement@free-electrons.com>
 <CACRpkdZ=mVXBbVf1iHg8nQ6pYUkvpB+egH+stoMrkD8V_vaYpg@mail.gmail.com> <87zif38qu2.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87zif38qu2.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Victor Gu <xigu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Wilson Ding <dingwei-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hua Jing <jinghua-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 11:23 AM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>  On lun., avril 24 2017, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

>>> +               spin_lock_irqsave(&info->irq_lock, flags);
>>> +               status = readl_relaxed(info->base + IRQ_STATUS + 4 * i);
>>> +               /* Manage only the interrupt that was enabled */
>>> +               status &= readl_relaxed(info->base + IRQ_EN + 4 * i);
>>> +               spin_unlock_irqrestore(&info->irq_lock, flags);
>>> +               while (status) {
>>> +                       u32 hwirq = ffs(status) - 1;
>>> +                       u32 virq = irq_find_mapping(d, hwirq +
>>> +                                                    i * GPIO_PER_REG);
>>> +
>>> +                       generic_handle_irq(virq);
>>> +                       status &= ~BIT(hwirq);
>>> +               }
>>
>> You hae a problem here is a new IRQ appears while you are inside
>> of this loop. You need to re-read the status register for each iteration
>> (and &= with the IRQ_EN I guess).
>
> If a new IRQ appears during the loop, then the irq handler will be
> called again because the cause of this new IRQ won't have been acked
> yet. So I think we're fine here.

That *might* be true. It is true if the CPU gets a level IRQ from the
GPIO controller. But hardware dealing with edge IRQs can be very
quirky here, and just send a pulse on the line to the CPU if the
CPU-bound IRQ is also just edge triggered. And then that
pulse would potentially be missed while dealing with the current
IRQ in this handler. (And exactly this happened to us on other
hardware.)

But anyway: why let the irq handler be called again if you can avoid it?

You would avoid a double context switch by just checking it again
in the loop before exiting the handler. And that can be really nice
for latency-sensitive stuff.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] ARM: mediatek: Add EINT support to MTK pinctrl driver.
Date: Thu, 15 Jan 2015 18:30:12 +0100
Message-ID: <CACRpkdY7_A_rORDvDrGtV0aa6mJGj=Sr-k=KVGu_=0et-gNpiQ@mail.gmail.com>
References: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
	<1418772873-19747-5-git-send-email-hongzhou.yang@mediatek.com>
	<1418807365.6443.17.camel@mtksdaap41>
	<1420535817.17567.10.camel@mtksdaap41>
	<CACRpkdb2KJbjzFgTmDvHSw7jNAExxVtU3y4_fgyn6J8hcW5OrQ@mail.gmail.com>
	<1421202745.27675.148.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421202745.27675.148.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 3:32 AM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> Let's me describe my problem more clearly. On our SoC, if a pin support
> interrupt it will have 2 different numbers for it. For examples, here's
> a partial list for the gpio and EINT number mappings on mt8135:
>
>    gpio  EINT
>      0     49
>      1     48
>     ...........
>     36     97
>     37     19
>     ...........
>
> To control interrupt related function, we'll need EINT number to locate
> corresponding register bits. When interrupt occurs, the interrupt
> handler will know which EINT interrupt occurs. In irq_chip functions,
> only .irq_request_resources and .irq_release_resources use gpio number
> to set pinmux to EINT mode and all the others need EINT number.
>
> Because EINT number is used more frequently in interrupt related
> functions, it make sense to use EINT number as hwirq instead of gpio
> number. That means irq_domain will translate EINT number to virq.
> So what mtk_gpio_to_irq actually do is translate gpio number to EINT
> number and use irq domain to translate it to virq.

But the EINT is not a hardware number is it?

That sounds like an abuse of the irqdomain framework.

The purpose of that code is to map hardware IRQs to Linux
IRQs nothing else.

This sounds more like mapping a Linux IRQ (the EINT) to
another Linux IRQ (whatever the irqdomain allocates for
you).

Since the EINTs are already Linux IRQs, these should be used
directly.

I would solve this by just having some cross-reference table
for mapping GPIOs to EINTs without involving the irqdomain
at all.

struct eint_map {
    int gpio_offset;
    int eint;
};

But also check with the irqdomain people.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

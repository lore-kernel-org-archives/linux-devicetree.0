From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 4/5] ARM: mediatek: Add EINT support to MTK pinctrl
 driver.
Date: Fri, 16 Jan 2015 10:50:39 +0800
Message-ID: <1421376639.31355.169.camel@mtksdaap41>
References: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
	 <1418772873-19747-5-git-send-email-hongzhou.yang@mediatek.com>
	 <1418807365.6443.17.camel@mtksdaap41>
	 <1420535817.17567.10.camel@mtksdaap41>
	 <CACRpkdb2KJbjzFgTmDvHSw7jNAExxVtU3y4_fgyn6J8hcW5OrQ@mail.gmail.com>
	 <1421202745.27675.148.camel@mtksdaap41>
	 <CACRpkdY7_A_rORDvDrGtV0aa6mJGj=Sr-k=KVGu_=0et-gNpiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY7_A_rORDvDrGtV0aa6mJGj=Sr-k=KVGu_=0et-gNpiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-01-15 at 18:30 +0100, Linus Walleij wrote:
> On Wed, Jan 14, 2015 at 3:32 AM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > Let's me describe my problem more clearly. On our SoC, if a pin support
> > interrupt it will have 2 different numbers for it. For examples, here's
> > a partial list for the gpio and EINT number mappings on mt8135:
> >
> >    gpio  EINT
> >      0     49
> >      1     48
> >     ...........
> >     36     97
> >     37     19
> >     ...........
> >
> > To control interrupt related function, we'll need EINT number to locate
> > corresponding register bits. When interrupt occurs, the interrupt
> > handler will know which EINT interrupt occurs. In irq_chip functions,
> > only .irq_request_resources and .irq_release_resources use gpio number
> > to set pinmux to EINT mode and all the others need EINT number.
> >
> > Because EINT number is used more frequently in interrupt related
> > functions, it make sense to use EINT number as hwirq instead of gpio
> > number. That means irq_domain will translate EINT number to virq.
> > So what mtk_gpio_to_irq actually do is translate gpio number to EINT
> > number and use irq domain to translate it to virq.
> 
> But the EINT is not a hardware number is it?

It is a hardware number. eg, to mask irq for the gpio 0 above, we have
to set bit49 in EINT mask_set register. When this irq triggered, it is
reported using EINT status register bit49.

We can find out EINT number for a GPIO using mtk_desc_pin tables. In
drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h, for GPIO0, we can see its
EINT is 49 and must set to function 2 for EINT. I believe this is
similar to sunxi.

        MTK_PIN(
                PINCTRL_PIN(0, "MSDC0_DAT7"),
                "D21", "mt8135",
                MTK_EINT_FUNCTION(2, 49),
                MTK_FUNCTION(0, "GPIO0"),
                MTK_FUNCTION(1, "MSDC0_DAT7"),
                MTK_FUNCTION(2, "EINT49"),
                MTK_FUNCTION(3, "I2SOUT_DAT"),
                MTK_FUNCTION(4, "DAC_DAT_OUT"),
                MTK_FUNCTION(5, "PCM1_DO"),
                MTK_FUNCTION(6, "SPI1_MO"),
                MTK_FUNCTION(7, "NALE")
        ),

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

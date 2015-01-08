From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: versatile: add DT based PCI detection
Date: Thu, 8 Jan 2015 15:34:08 -0600
Message-ID: <CAL_JsqKN_4pvKH-jau6fFuLx86FD8BznDoiRFhBm6A2aW7d0yQ@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
 <1419967718-26909-4-git-send-email-robherring2@gmail.com> <CACRpkdYEHwXhw3nEPHp7+4rtzXyh9Qb2QCpsRMfopxNoaX3rLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYEHwXhw3nEPHp7+4rtzXyh9Qb2QCpsRMfopxNoaX3rLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 8, 2015 at 1:37 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Disable the Versatile PCI DT node when no PCI backplane is detected. This
>> will prevent the Versatile PCI driver from probing when PCI is not
>> populated.
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> (...)
>> +       /* Check if PCI backplane is detected */
>> +       val = __raw_readl(base + VERSATILE_SYS_PCICTL_OFFSET);
>
> I think this kind of random syscon register access should be handled
> using the mfd/syscon.c hub and looked up in some way to be used
> by the driver.

Perhaps, but I've not figured out how much of VExpress syscon can be
used for Versatile. I looked at it briefly, but it appeared to be more
work that I have time for ATM. We still have other accesses to system
registers in Versatile as well. So if we want to merge all this
anytime soon, the options are:

- this patch
- Create a versatilepb-pci.dts which includes versatilepb.dts and enables PCI
- Default to PCI enabled (for QEMU) in the dts and users have to
disable in their dts if they don't have a PCI backplane.

> I'm thinking along the pattern of adding code in drivers/*
> by the pattern of e.g.
> drivers/video/fbdev/amba-clcd-versatile.c
> i.e. an add-on that gets compiled-in only for those platform
> but still married to the main driver.

One difference here is the PCI driver is pretty much only ever going
to be for a single platform.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

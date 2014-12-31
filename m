From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM Versatile multi-platform support
Date: Wed, 31 Dec 2014 09:25:41 +0000
Message-ID: <CAFEAcA9pKdRNQ-fgKumQhjTjei-4NJ-OB1gSOxTCnCjShy10jw@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419967718-26909-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 December 2014 at 19:28, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This has been tested on QEMU. A previous version was tested on
> Versatile/AB by Linus Walleij. Linus reported a problem with the
> display panel detection. Investigation on h/w is needed still as I have
> not been able to identify the issue by inspection and the display
> detection seems to work correctly on QEMU.
>
> Linus had also mentioned to me that QEMU users may have some issue with
> removing non-DT code as the work flow has to change somewhat.

As long as you call out the requirement for a DT now in whatever
your equivalent of release notes is that should be fine. (Does
the kernel provide a useful message to serial in the absence of a
DT or does it now not have enough platform knowledge to do that?)

> Copying
> Peter Maydell here for comment (and there's rumors he may have actual PB
> h/w with PCI as well).

Will Deacon and Marc Zyngier are currently in possession of that h/w.
I'm sure they'd be delighted to pull it out of the cupboard and
give it a spin :-)

-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

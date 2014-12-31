From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: versatile: add DT based PCI detection
Date: Wed, 31 Dec 2014 16:23:30 +0100
Message-ID: <14512076.oz77HnzXre@wuerfel>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com> <13417872.31IhE1RbAx@wuerfel> <CAL_Jsq+iVWPsN9LXEMT6DmjS7MGsnmgJLgyb33N3me=OcCet6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+iVWPsN9LXEMT6DmjS7MGsnmgJLgyb33N3me=OcCet6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 30 December 2014 17:05:16 Rob Herring wrote:
> On Tue, Dec 30, 2014 at 3:37 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 30 December 2014 13:28:32 Rob Herring wrote:
> >> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> Disable the Versatile PCI DT node when no PCI backplane is detected. This
> >> will prevent the Versatile PCI driver from probing when PCI is not
> >> populated.
> >
> > Can you explain why the check is done in platform code instead of the PCI
> > driver probe function itself?
> 
> Because the register to check is not part of the PCI controller, but
> part of the system registers. There was no infrastructure for the
> system registers when I originally wrote this, but there's some syscon
> support now for VExpress that may be able to be used. I think it is
> cleaner if we can avoid syscon dependencies in drivers in general, but
> it is pretty much zero chance the Versatile PCI driver will ever be
> used on another platform.

Ok, I see. I guess ideally we would get a correct DTB file from the boot
loader, but that is of course completely unrealistic on versatile, both
on hardware and qemu.

Maybe we can just take your current approach for now, and add a comment
about the possibility of using syscon in the future to the function.

I'm also not completely sure if your code gets it right: the existing
driver writes '1' into this register in .preinit() and then reads the
same register back in .setup(). Your driver just reads the value but
never writes it.

I suspect that either the existing behavior is completely bogus because
the driver always reads what it write before, and then you can skip
the logic completely, or your new driver is broken because reading
the register without writing it first will result in undefined behavior
on real hardware.

> >> +     /* Check if PCI backplane is detected */
> >> +     val = __raw_readl(base + VERSATILE_SYS_PCICTL_OFFSET);
> >> +     if (val & 1)
> >> +             goto err;
> >
> > Using __raw_readl prevents this from working with big-endian kernels, so just
> > use readl here.
> 
> So does the fact that this is an ARM926, but yes there's not really
> any reason not to use readl.

Ok. I don't think there is anything preventing you from setting big-endian
mode on arm926 though, it's just that nobody ever has the need in practice,
and a lot of drivers are broken.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

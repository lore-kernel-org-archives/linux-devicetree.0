From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: versatile: add DT based PCI detection
Date: Wed, 31 Dec 2014 13:22:01 -0600
Message-ID: <CAL_JsqLBCeCc2VKvHAdG5bBJt=2qmX5BnosdGd_2n+Pb9BhuZQ@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
 <13417872.31IhE1RbAx@wuerfel> <CAL_Jsq+iVWPsN9LXEMT6DmjS7MGsnmgJLgyb33N3me=OcCet6g@mail.gmail.com>
 <14512076.oz77HnzXre@wuerfel> <CAFEAcA9=eoP4-F0Z8J171=DHE5JHVn7ahMnQrHQFz9SHePQHNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFEAcA9=eoP4-F0Z8J171=DHE5JHVn7ahMnQrHQFz9SHePQHNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 31, 2014 at 10:13 AM, Peter Maydell
<peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 31 December 2014 at 15:23, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Tuesday 30 December 2014 17:05:16 Rob Herring wrote:
>>> Because the register to check is not part of the PCI controller, but
>>> part of the system registers. There was no infrastructure for the
>>> system registers when I originally wrote this, but there's some syscon
>>> support now for VExpress that may be able to be used. I think it is
>>> cleaner if we can avoid syscon dependencies in drivers in general, but
>>> it is pretty much zero chance the Versatile PCI driver will ever be
>>> used on another platform.
>>
>> Ok, I see. I guess ideally we would get a correct DTB file from the boot
>> loader, but that is of course completely unrealistic on versatile, both
>> on hardware and qemu.
>
> Why would you want to get the bootloader to do this for you when
> the hardware provides a perfectly good mechanism for probing
> for the existence of the hardware? "Ask the hardware" is always
> going to be a more reliable and foolproof way to get the answer
> if you can do it -- device tree should just be for the cases where
> there is no way to probe. In any case the only way for the boot
> loader to determine the correct value to put into the device tree
> would be to read the register itself.

Only that it is nice to hide all the ugly bits in the
bootloader/firmware and DT already provides a standard way to enable
or disable h/w. This h/w is not probeable in any sort of standard way.

>> I suspect that either the existing behavior is completely bogus because
>> the driver always reads what it write before, and then you can skip
>> the logic completely, or your new driver is broken because reading
>> the register without writing it first will result in undefined behavior
>> on real hardware.
>
> The documentation describes this register as:
>
> # The SYS_PCICTL register at 0x10000044 enables the bridge to the PCI bus:
> #
> # * Setting bit 0 HIGH enables PCI bus accesses.
> # * Read returns a HIGH in bit 0 if a PCI board is present
> #   in the expansion backplane.
>
> ie the read and write behaviour is independent. So I suspect
> that this new driver's failure to write 1 means that it
> will break PCI on real hardware. (QEMU doesn't attempt to
> model this behaviour: SYS_PCICTL will always read-as-one,
> writes-ignored.)

>From Table 4.4, I came to the conclusion that the write wasn't really necessary:

SYS_PCICTL  0x10000044  Read only  -Read returns a HIGH in bit [0] if
a PCI board is present in the expansion backplane.

I'll add it back.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

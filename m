From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for controllers with
 big-endian regs / descriptors
Date: Tue, 21 Jan 2014 11:48:40 -0800
Message-ID: <CAGVrzcZ2arvg3yryHE5KcMz6f1Js2m1=TbWxwZzk12kyKq0tKg@mail.gmail.com>
References: <52DEA7CD.5070107@redhat.com> <Pine.LNX.4.44L0.1401211308040.1272-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401211308040.1272-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014/1/21 Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>:
> On Tue, 21 Jan 2014, Hans de Goede wrote:
>
>> Hi,
>>
>> On 01/21/2014 05:40 PM, Alan Stern wrote:
>> > On Tue, 21 Jan 2014, Hans de Goede wrote:
>> >
>> >> Note this commit uses the same devicetree booleans for this as the ones
>> >> already existing in the usb-ehci bindings.
>> >>
>> >> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> >
>> >> --- a/drivers/usb/host/Kconfig
>> >> +++ b/drivers/usb/host/Kconfig
>> >> @@ -512,6 +512,10 @@ config USB_CNS3XXX_OHCI
>> >>
>> >>   config USB_OHCI_HCD_PLATFORM
>> >>    tristate "Generic OHCI driver for a platform device"
>> >> +  # Always support LE, support BE on architectures which have readl_be
>> >> +  select USB_OHCI_LITTLE_ENDIAN
>> >> +  select USB_OHCI_BIG_ENDIAN_DESC if (AVR32 || MIPS || MICROBLAZE || SPARC || PPC32 || PPC64)
>> >> +  select USB_OHCI_BIG_ENDIAN_MMIO if (AVR32 || MIPS || MICROBLAZE || SPARC || PPC32 || PPC64)
>> >>    default n
>
>> > In any case, the style we have adopted is that these select lines go in
>> > the arch-specific defconfig, not here.
>>
>> Ok, so I should drop the Kconfig parts of both patches ?
>
> That's rigt.  They are likely to cause trouble, and if the selects were
> needed then they should already be present somewhere else.

Absolutely, they will actually break platforms. Since you added some
guards for when these properties are set, but proper support in the
kernel is not enabled, this is already catching misuses, and as such
is already an improvement.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

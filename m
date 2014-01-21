From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for controllers with
 big-endian regs / descriptors
Date: Tue, 21 Jan 2014 11:40:46 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401211116370.1272-100000@iolanthe.rowland.org>
References: <1390319315-8391-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390319315-8391-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Jan 2014, Hans de Goede wrote:

> Note this commit uses the same devicetree booleans for this as the ones
> already existing in the usb-ehci bindings.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -512,6 +512,10 @@ config USB_CNS3XXX_OHCI
>  
>  config USB_OHCI_HCD_PLATFORM
>  	tristate "Generic OHCI driver for a platform device"
> +	# Always support LE, support BE on architectures which have readl_be
> +	select USB_OHCI_LITTLE_ENDIAN
> +	select USB_OHCI_BIG_ENDIAN_DESC if (AVR32 || MIPS || MICROBLAZE || SPARC || PPC32 || PPC64)
> +	select USB_OHCI_BIG_ENDIAN_MMIO if (AVR32 || MIPS || MICROBLAZE || SPARC || PPC32 || PPC64)
>  	default n

The comment line above is slightly misleading.  USB_OHCI_LITTLE_ENDIAN
doesn't exactly mean to include support for little-endian controllers;  
it means include mixed-endian support if either
USB_OHCI_BIG_ENDIAN_DESC or USB_OHCI_BIG_ENDIAN_MMIO is set.  That is,
the driver determines at runtime whether a particular controller is
big-endian or little-endian, rather than choosing to support one or the
other at compile time.

In any case, the style we have adopted is that these select lines go in
the arch-specific defconfig, not here.  For example, check out the
occurrences of EHCI in arch/mips/Kconfig.  Also, I'm not sure how you
came up with that list of architectures for the two selects; it's hard
to say if they are right.  For instance, why did you include AVR32?

The changes to the driver itself look fine.

Similar comments apply to the ehci-platform patch.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 6/6] pci: Add support for creating a generic host_bridge from device tree
Date: Mon, 10 Mar 2014 20:28:32 +0100
Message-ID: <2669340.5Jm6AjVlSo@wuerfel>
References: <1394020137-1830-1-git-send-email-Liviu.Dudau@arm.com> <1469359.kil5iaOqdU@wuerfel> <CAMuHMdWzm1D83zquwuQVKwbqRdXmSw7u1ui7iZyC3VGdGhn0HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWzm1D83zquwuQVKwbqRdXmSw7u1ui7iZyC3VGdGhn0HA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 10 March 2014 20:16:25 Geert Uytterhoeven wrote:
> On Mon, Mar 10, 2014 at 7:59 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> arch/avr32/include/asm/io.h:#define IO_SPACE_LIMIT    0xffffffff
> >> arch/frv/include/asm/io.h:#define IO_SPACE_LIMIT      0xffffffff
> >
> > They have no MMU, and the code relies on the port number to match
> > both the virtual and the physical address. You could be right about
> > these, but I would guess that the code also needs some other
> > changes if we want to make it work on nommu kernels. It also depends
> > on whether the I/O bus address is the same as the CPU address, or
> > if it starts at bus address 0.
> 
> >> arch/m68k/include/asm/io_no.h:#define IO_SPACE_LIMIT 0xffffffff
> >
> > This looks like a mistake, it should be smaller
> 
> io_no.h is for nommu.

Ah, I missed that. In that case I assume it doesn't matter because
the only m68k with PCI is M54xx and that always has an MMU.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

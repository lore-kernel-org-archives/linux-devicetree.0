From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 4/7] of: configure the platform device dma parameters
Date: Thu, 29 May 2014 21:24:07 +0200
Message-ID: <4755790.VgRQTHz3K1@wuerfel>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com> <CACRpkdaD6ZLFu7-tOeDRvKCAC6X6_W84Vsqs1o-xUzUZOjyvFQ@mail.gmail.com> <53873F4A.9030303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53873F4A.9030303-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 29 May 2014 10:08:10 Santosh Shilimkar wrote:
> On Thursday 29 May 2014 10:01 AM, Linus Walleij wrote:
> > On Wed, May 28, 2014 at 4:04 PM, Santosh Shilimkar
> > <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> >> On Wednesday 28 May 2014 09:32 AM, Linus Walleij wrote:
> > 
> >>>> I suspect what you want is
> >>>>
> >>>>         dma-ranges = <0x80000000 0 0x80000000>;
> >>>>
> >>>> to translate dma_addr_t 0x80000000-0xffffffff to phys_addr_t 0x0-0x7fffffff
> >>>> rather than phys_addr_t 0x800000000-0x87fffffff.
> >>>
> >> Interesting. Where does the ROM address space resides on integrator then considering
> >> address 0 is used for DMA.
> > 
> > The ROM is at physical address 0x20000000, don't ask me
> > why 
> > 
> > The RAM is typically at 0x00000000-0x0fffffff, on up to four parallell
> > tiles, i.e. up to four completely independent CPUs are booted off the
> > same ROM and using a set of shared peripherals.
> > 
> The reason I asked the question because most of the ARM SOC I came across
> aren't using the RAM phys address 0 and thought was because of boot architecture
> with ROM occupying that address with reset vector starting at address 0.
> 
> That was one of the main reason we had description on max_*pfn on ARM w.r.t
> to other acrhes.
> 
> Will corner ARM guys to understand bit more about it in some conference 

If this is anything like the versatile express, the reason it works is probably
because there is another microcontroller in the system that does the bootstrap
and is able to load code into RAM before turning on the main CPU.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

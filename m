From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Wed, 14 May 2014 11:12:23 +0100
Message-ID: <20140514101223.518A6C4153D@trevor.secretlab.ca>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
	<536249D6.3020008@ti.com> <20140501132516.GG26756@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140501132516.GG26756-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 1 May 2014 14:25:16 +0100, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, May 01, 2014 at 09:19:18AM -0400, Santosh Shilimkar wrote:
> > Rob, Russell,
> > 
> > On Thursday 24 April 2014 11:30 AM, Santosh Shilimkar wrote:
> > > Here is an updated v3 of the series. Series introduces support for setting up
> > > dma parameters based on device tree properties like 'dma-ranges' and
> > > 'dma-coherent' and also update to ARM 32 bit port. Earlier version of the
> > > series can be found here [3], [2] and [1].
> > > 
> > > The 'dma-ranges' helps to take care of few DMAable system memory restrictions
> > > by use of dma_pfn_offset which we maintain now per device. Arch code then
> > > uses it for dma address translations for such cases. We update the
> > > dma_pfn_offset accordingly during DT the device creation process.The
> > > 'dma-coherent' property is used to setup arch's coherent dma_ops.
> > > 
> > > Hopefully with acks, tested-by this version can get into 3.16 queue. I will
> > > post a followup series for Keystone SOC which will use this infrastructure.
> > > Linus W also wants to use this for ARM integrator platform dma offset issue.
> > > 
> > > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > > Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > > Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> > > Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> > > 
> > > Grygorii Strashko (2):
> > >   of: introduce of_dma_get_range() helper
> > >   ARM: dma: Use dma_pfn_offset for dma address translation
> > > 
> > > Santosh Shilimkar (5):
> > >   device: introduce per device dma_pfn_offset
> > >   of: introduce of_dma_is_coherent() helper
> > >   of: configure the platform device dma parameters
> > >   ARM: dma: implement set_arch_dma_coherent_ops()
> > >   ARM: dma: use phys_addr_t in __dma_page_[cpu_to_dev/dev_to_cpu]
> > > 
> > >  arch/arm/include/asm/dma-mapping.h |   28 ++++++++++--
> > >  arch/arm/mm/dma-mapping.c          |    4 +-
> > >  drivers/of/address.c               |   87 ++++++++++++++++++++++++++++++++++++
> > >  drivers/of/platform.c              |   71 +++++++++++++++++++++++++++--
> > >  include/linux/device.h             |    2 +
> > >  include/linux/dma-mapping.h        |    7 +++
> > >  include/linux/of_address.h         |    8 ++++
> > >  include/linux/of_platform.h        |    6 +++
> > >  8 files changed, 204 insertions(+), 9 deletions(-)
> > > 
> > How do we go about merging this series ? There is a dependency
> > between the patches and hence the question.
> 
> I don't know anymore.  People today want to assert exclusive rights over
> parts of the kernel tree, which makes this kind of cross-patching rather
> impossible.

And you can tell those people to go-perch. (I have no idea what that
actually means. something my mother always says).

If everyone is okay then I would be fine with taking the whole series
through my tree, or you can put my ack on it and send it through the ARM tree.

g.
> 
> The only workable solution I can see is the long winded way to split the
> series up, merge the first set of dependencies in one merge window, and
> hold the rest back for the following merge window.  Not ideal, but it
> stops the arguments.
> 
> -- 
> FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
> improving, and getting towards what was expected from it.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

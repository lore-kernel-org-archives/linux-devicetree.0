From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA
 addressable memory size
Date: Mon, 5 Aug 2019 13:23:05 -0600
Message-ID: <CAL_Jsq+LjsRmFg-xaLgpVx3miXN3hid3aD+mgTW__j0SbEFYjQ@mail.gmail.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
 <20190731154752.16557-4-nsaenzjulienne@suse.de> <CAL_JsqKF5nh3hcdLTG5+6RU3_TnFrNX08vD6qZ8wawoA3WSRpA@mail.gmail.com>
 <2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, wahrenst@gmx.net, Marc Zyngier <marc.zyngier@arm.com>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux IOMMU <iommu@lists.linux-foundation.org>, linux-mm@kvack.org, Frank Rowand <frowand.list@gmail.com>, phill@raspberryi.org, Florian Fainelli <f.fainelli@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Matthias Brugger <mbrugger@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rp>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 10:03 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Rob,
> Thanks for the review!
>
> On Fri, 2019-08-02 at 11:17 -0600, Rob Herring wrote:
> > On Wed, Jul 31, 2019 at 9:48 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Some SoCs might have multiple interconnects each with their own DMA
> > > addressing limitations. This function parses the 'dma-ranges' on each of
> > > them and tries to guess the maximum SoC wide DMA addressable memory
> > > size.
> > >
> > > This is specially useful for arch code in order to properly setup CMA
> > > and memory zones.
> >
> > We already have a way to setup CMA in reserved-memory, so why is this
> > needed for that?
>
> Correct me if I'm wrong but I got the feeling you got the point of the patch
> later on.

No, for CMA I don't. Can't we already pass a size and location for CMA
region under /reserved-memory. The only advantage here is perhaps the
CMA range could be anywhere in the DMA zone vs. a fixed location.

> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > ---
> > >
> > >  drivers/of/fdt.c       | 72 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/of_fdt.h |  2 ++
> > >  2 files changed, 74 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index 9cdf14b9aaab..f2444c61a136 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -953,6 +953,78 @@ int __init early_init_dt_scan_chosen_stdout(void)
> > >  }
> > >  #endif
> > >
> > > +/**
> > > + * early_init_dt_dma_zone_size - Look at all 'dma-ranges' and provide the
> > > + * maximum common dmable memory size.
> > > + *
> > > + * Some devices might have multiple interconnects each with their own DMA
> > > + * addressing limitations. For example the Raspberry Pi 4 has the
> > > following:
> > > + *
> > > + * soc {
> > > + *     dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * v3dbus {
> > > + *     dma-ranges = <0x00000000  0x0 0x00000000  0x3c000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * scb {
> > > + *     dma-ranges = <0x0 0x00000000  0x0 0x00000000  0xfc000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * Here the area addressable by all devices is [0x00000000-0x3bffffff].
> > > Hence
> > > + * the function will write in 'data' a size of 0x3c000000.
> > > + *
> > > + * Note that the implementation assumes all interconnects have the same
> > > physical
> > > + * memory view and that the mapping always start at the beginning of RAM.
> >
> > Not really a valid assumption for general code.
>
> Fair enough. On my defence I settled on that assumption after grepping all dts
> and being unable to find a board that behaved otherwise.
>
> [...]
>
> > It's possible to have multiple levels of nodes and dma-ranges. You need to
> > handle that case too. Doing that and handling differing address translations
> > will be complicated.
>
> Understood.
>
> > IMO, I'd just do:
> >
> > if (of_fdt_machine_is_compatible(blob, "brcm,bcm2711"))
> >     dma_zone_size = XX;
> >
> > 2 lines of code is much easier to maintain than 10s of incomplete code
> > and is clearer who needs this. Maybe if we have dozens of SoCs with
> > this problem we should start parsing dma-ranges.
>
> FYI that's what arm32 is doing at the moment and was my first instinct. But it
> seems that arm64 has been able to survive so far without any machine specific
> code and I have the feeling Catalin and Will will not be happy about this
> solution. Am I wrong?

No doubt. I'm fine if the 2 lines live in drivers/of/.

Note that I'm trying to reduce the number of early_init_dt_scan_*
calls from arch code into the DT code so there's more commonality
across architectures in the early DT scans. So ideally, this can all
be handled under early_init_dt_scan() call.

Rob

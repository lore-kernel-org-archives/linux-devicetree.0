From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA
 addressable memory size
Date: Thu, 8 Aug 2019 09:02:30 -0600
Message-ID: <CAL_JsqJS6XBSc8DuK2sJApHtY4nCSFpLezf003YMD75THLHAqg@mail.gmail.com>
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
 <20190731154752.16557-4-nsaenzjulienne@suse.de> <CAL_JsqKF5nh3hcdLTG5+6RU3_TnFrNX08vD6qZ8wawoA3WSRpA@mail.gmail.com>
 <2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de> <CAL_Jsq+LjsRmFg-xaLgpVx3miXN3hid3aD+mgTW__j0SbEFYjQ@mail.gmail.com>
 <12eb3aba207c552e5eb727535e7c4f08673c4c80.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12eb3aba207c552e5eb727535e7c4f08673c4c80.camel@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, wahrenst@gmx.net, Marc Zyngier <marc.zyngier@arm.com>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux IOMMU <iommu@lists.linux-foundation.org>, linux-mm@kvack.org, Frank Rowand <frowand.list@gmail.com>, phill@raspberryi.org, Florian Fainelli <f.fainelli@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Matthias Brugger <mbrugger@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rp>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 12:12 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Rob,
>
> On Mon, 2019-08-05 at 13:23 -0600, Rob Herring wrote:
> > On Mon, Aug 5, 2019 at 10:03 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Hi Rob,
> > > Thanks for the review!
> > >
> > > On Fri, 2019-08-02 at 11:17 -0600, Rob Herring wrote:
> > > > On Wed, Jul 31, 2019 at 9:48 AM Nicolas Saenz Julienne
> > > > <nsaenzjulienne@suse.de> wrote:
> > > > > Some SoCs might have multiple interconnects each with their own DMA
> > > > > addressing limitations. This function parses the 'dma-ranges' on each of
> > > > > them and tries to guess the maximum SoC wide DMA addressable memory
> > > > > size.
> > > > >
> > > > > This is specially useful for arch code in order to properly setup CMA
> > > > > and memory zones.
> > > >
> > > > We already have a way to setup CMA in reserved-memory, so why is this
> > > > needed for that?
> > >
> > > Correct me if I'm wrong but I got the feeling you got the point of the patch
> > > later on.
> >
> > No, for CMA I don't. Can't we already pass a size and location for CMA
> > region under /reserved-memory. The only advantage here is perhaps the
> > CMA range could be anywhere in the DMA zone vs. a fixed location.
>
> Now I get it, sorry I wasn't aware of that interface.
>
> Still, I'm not convinced it matches RPi's use case as this would hard-code
> CMA's size. Most people won't care, but for the ones that do, it's nicer to
> change the value from the kernel command line than editing the dtb.

Sure, I fully agree and am not a fan of the CMA DT overlays I've seen.

> I get that
> if you need to, for example, reserve some memory for the video to work, it's
> silly not to hard-code it. Yet due to the board's nature and users base I say
> it's important to favor flexibility. It would also break compatibility with
> earlier versions of the board and diverge from the downstream kernel behaviour.
> Which is a bigger issue than it seems as most users don't always understand
> which kernel they are running and unknowingly copy configuration options from
> forums.
>
> As I also need to know the DMA addressing limitations to properly configure
> memory zones and dma-direct. Setting up the proper CMA constraints during the
> arch's init will be trivial anyway.

It was really just commentary on commit text as for CMA alone we have
a solution already. I agree on the need for zones.

>
> > > > IMO, I'd just do:
> > > >
> > > > if (of_fdt_machine_is_compatible(blob, "brcm,bcm2711"))
> > > >     dma_zone_size = XX;
> > > >
> > > > 2 lines of code is much easier to maintain than 10s of incomplete code
> > > > and is clearer who needs this. Maybe if we have dozens of SoCs with
> > > > this problem we should start parsing dma-ranges.
> > >
> > > FYI that's what arm32 is doing at the moment and was my first instinct. But
> > > it
> > > seems that arm64 has been able to survive so far without any machine
> > > specific
> > > code and I have the feeling Catalin and Will will not be happy about this
> > > solution. Am I wrong?
> >
> > No doubt. I'm fine if the 2 lines live in drivers/of/.
> >
> > Note that I'm trying to reduce the number of early_init_dt_scan_*
> > calls from arch code into the DT code so there's more commonality
> > across architectures in the early DT scans. So ideally, this can all
> > be handled under early_init_dt_scan() call.
>
> How does this look? (I'll split it in two patches and add a comment explaining
> why dt_dma_zone_size is needed)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index f2444c61a136..1395be40b722 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -30,6 +30,8 @@
>
>  #include "of_private.h"
>
> +u64 dt_dma_zone_size __ro_after_init;

Avoiding a call from arch code by just having a variable isn't really
better. I'd rather see a common, non DT specific variable that can be
adjusted. Something similar to initrd_start/end. Then the arch code
doesn't have to care what hardware description code adjusted the
value.

Rob

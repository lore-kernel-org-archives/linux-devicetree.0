From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 11/11] MIPS: Add multiplatform BMIPS target
Date: Wed, 26 Nov 2014 12:45:47 -0800
Message-ID: <CAJiQ=7DwhSySAa19OxfUDkvT4DLWaZ3uhPU2QJzQ6Gc7YCvDgg@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
 <11772640.IZcxoRkMEM@wuerfel> <CAJiQ=7BXW5iWm7t_62dpm8fDppG0JCiW+okVKhPYUKSWGQhd_Q@mail.gmail.com>
 <3146555.WCj2bhBSnP@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3146555.WCj2bhBSnP@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 24, 2014 at 1:39 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > As mentioned before, it seems like you are simply defining these all to zero,
>> > like most other platforms do too. Why not add this file as
>> > arch/mips/include/asm/mach-generic/war.h and delete all identical copies?
>>
>> Likewise - currently every existing MIPS machine type implements it this way.
>>
>> Perhaps a future patch series can generalize the way these definitions
>> are handled on MIPS?
>
> I'd like to hear what Ralf thinks about it, it's really his decision.
> What I was pointing out here are things that are still in the way of
> a real "multiplatform" implementation. None of these are really hard
> to do, but I don't know where you are heading with MIPS.

That probably depends on what types of platforms were going to be
supported by the multiplatform kernel.  For the case of war.h, about
2/3rds of arch/mips/include/asm/mach-*/war.h contain all zeroes...

> I think in case of the last one, it's really just a matter of moving the
> file, you could delete the other copies later.

...and so that's probably a good idea in general.

>> >> +OF_DECLARE_2(irqchip, mips_cpu_intc, "mti,cpu-interrupt-controller",
>> >> +          mips_cpu_irq_of_init);
>> >
>> > OF_DECLARE_2 really wasn't meant to be used directly. Can you move this
>> > code into drivers/irqchip and make it use IRQCHIP_DECLARE()?
>>
>> Perhaps arch/mips/kernel/irq_cpu.c could be moved under
>> drivers/irqchip in a future commit?  We'll probably have to change the
>> way arch/mips/ralink invokes it too.
>
> Possibly, but that seems unrelated. Moving this file is required
> in order to use IRQCHIP_DECLARE, which is defined in
> drivers/irqchip/irqchip.h.

arch/mips/kernel/irq_cpu.c is the actual irqchip driver containing
mips_cpu_irq_of_init().  It probably would not make sense to move
arch/mips/bmips/irq.c (platform IRQ stubs, not an irqchip driver)
under drivers/irqchip.

>> > Is this intended to become a generic MIPS boot interface? Better
>> > document it in Documentation/mips/
>>
>> Not sure yet.  It's currently limited to BCM3384.
>>
>> For V4 I can add an "Entry point for arch/mips/bmips" or even an
>> "Entry point for arch/mips" section to
>> Documentation/devicetree/booting-without-of.txt.  Any preferences?
>
> If the goal is being able to have a multiplatform kernel
> that can cover more than just BMIPS, I think this would have
> to be documented as the only way for MIPS multiplatform.
>
> If that isn't possible, most of my other comments here are
> moot, but then you shouldn't call it "multiplatform" but just
> "generic BMIPS" or something like that.

Currently my goal is to cover BMIPS only.  Although it's possible that
someday somebody develops a more hardware-independent implementation
that runs on other MIPS processor variants.

So, I can go ahead and rename it to "Generic BMIPS" if that clarifies
the intent.

>> >> diff --git a/arch/mips/include/asm/mach-bmips/dma-coherence.h b/arch/mips/include/asm/mach-bmips/dma-coherence.h
>> >> new file mode 100644
>> >> index 000000000000..5481a4d1bbbf
>> >> --- /dev/null
>> >> +++ b/arch/mips/include/asm/mach-bmips/dma-coherence.h
>> >> @@ -0,0 +1,45 @@
>> >> +#ifndef __ASM_MACH_BMIPS_DMA_COHERENCE_H
>> >> +#define __ASM_MACH_BMIPS_DMA_COHERENCE_H
>> >> +
>> >> +struct device;
>> >> +
>> >> +extern dma_addr_t plat_map_dma_mem(struct device *dev, void *addr, size_t size);
>> >> +extern dma_addr_t plat_map_dma_mem_page(struct device *dev, struct page *page);
>> >> +extern unsigned long plat_dma_addr_to_phys(struct device *dev,
>> >> +     dma_addr_t dma_addr);
>> >> +extern void plat_unmap_dma_mem(struct device *dev, dma_addr_t dma_addr,
>> >> +     size_t size, enum dma_data_direction direction);
>> >
>> > I think you could just add these to
>> > arch/mips/include/asm/mach-generic/dma-coherence.h and get rid of the
>> > header file, after adding a Kconfig symbol.
>>
>> Some platforms mix and match inline definitions versus externs in this file.
>>
>> Maybe Ralf can comment on whether we should move to an "all or nothing" model?
>
> To clarify where I was getting to here: In a generic multiplatform kernel,
> you would probably want to always look at the dma-ranges properties here,
> at least if there are one or more platforms built into the kernel that
> don't just have a flat mapping that the current mach-generic header
> provides.

For the BMIPS case:

plat_map_dma_mem* and plat_dma_addr_to_phys are just performing
remapping, so dma-ranges would work.

plat_unmap_dma_mem is used to perform an extra BMIPS-specific
cacheflush operation.


Not sure about something like this - I guess it would work with 4
ranges as long as bits 63:39 of daddr are 0:

phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
{
    long nid;
#ifdef CONFIG_PHYS48_TO_HT40
    /* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
     * Loongson-3's 48bit address space and embed it into 40bit */
    nid = (daddr >> 37) & 0x3;
    daddr = ((nid << 37) ^ daddr) | (nid << 44);
#endif
    return daddr;
}

dma-octeon.c also has a few different cases to handle, but it looks
like they are range remappings selected based on the machine type;
that might still be suitable for DT.

The other tests in that file (coherency, per-device DMA masks) might
be better off as DT properties.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 19/21] MIPS memblock: Add print out method of kernel
 virtual memory layout
Date: Mon, 19 Dec 2016 16:15:39 +0300
Message-ID: <20161219131539.GA2101@mobilestation>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <1482113266-13207-20-git-send-email-fancer.lancer@gmail.com>
 <db27f41e-4121-bb83-6533-6727c26b9c5b@imgtec.com>
 <20161219130236.GJ27950@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161219130236.GJ27950@jhogan-linux.le.imgtec.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Matt Redfearn <matt.redfearn@imgtec.com>, ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com, Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 19, 2016 at 01:02:37PM +0000, James Hogan <james.hogan@imgtec.com> wrote:
> Hi Matt,
> 
> On Mon, Dec 19, 2016 at 12:04:54PM +0000, Matt Redfearn wrote:
> > On 19/12/16 02:07, Serge Semin wrote:
> > > It's useful to have some printed map of the kernel virtual memory,
> > > at least for debugging purpose.
> > >
> > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > ---
> 
> > > @@ -106,6 +107,49 @@ static void __init zone_sizes_init(void)
> > >   }
> > >   
> > >   /*
> > > + * Print out kernel memory layout
> > > + */
> > > +#define MLK(b, t) b, t, ((t) - (b)) >> 10
> > > +#define MLM(b, t) b, t, ((t) - (b)) >> 20
> > > +#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
> > > +static void __init mem_print_kmap_info(void)
> > > +{
> > > +	pr_notice("Virtual kernel memory layout:\n"
> > > +		  "    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > > +		  "    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > > +#ifdef CONFIG_HIGHMEM
> > > +		  "    pkmap   : 0x%08lx - 0x%08lx   (%4ld MB)\n"
> > > +#endif
> > > +		  "    fixmap  : 0x%08lx - 0x%08lx   (%4ld kB)\n"
> > > +		  "      .text : 0x%p" " - 0x%p" "   (%4td kB)\n"
> > > +		  "      .data : 0x%p" " - 0x%p" "   (%4td kB)\n"
> > > +		  "      .init : 0x%p" " - 0x%p" "   (%4td kB)\n",
> > > +		MLM(PAGE_OFFSET, (unsigned long)high_memory),
> > > +		MLM(VMALLOC_START, VMALLOC_END),
> > > +#ifdef CONFIG_HIGHMEM
> > > +		MLM(PKMAP_BASE, (PKMAP_BASE) + (LAST_PKMAP)*(PAGE_SIZE)),
> > > +#endif
> > > +		MLK(FIXADDR_START, FIXADDR_TOP),
> > > +		MLK_ROUNDUP(_text, _etext),
> > > +		MLK_ROUNDUP(_sdata, _edata),
> > > +		MLK_ROUNDUP(__init_begin, __init_end));
> > 
> > Please drop printing the kernel addresses, or at least only do it if 
> > KASLR is not turned on, otherwise you're removing the advantage of 
> > KASLR, that critical kernel addresses cannot be determined easily from 
> > userspace.
> 
> According to Documentation/printk-formats.txt, this is what %pK is for.
> Better to use that instead?
> 
> Cheers
> James
> 

The function is called from the kernel directly, which is privileged
enough to do the printing. So I suppose Matt is right, to hide this
prints out unless debug is enabled.

Thanks,
-Sergey

> > 
> > It may be better to merge the functionality of show_kernel_relocation
> > http://lxr.free-electrons.com/source/arch/mips/kernel/relocate.c#L354
> > into this function, but only print it under the same conditions as 
> > currently, i.e.
> > #if defined(CONFIG_DEBUG_KERNEL) && defined(CONFIG_DEBUG_INFO)
> > http://lxr.free-electrons.com/source/arch/mips/kernel/setup.c#L530
> > 
> > Thanks,
> > Matt

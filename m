From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during
	boot (v2)
Date: Fri, 12 Nov 2010 00:27:04 -0800
Message-ID: <20101112002704.50c629e2@queued.net>
References: <20101111214546.4e573cad@queued.net> <reply-olpc-3-v2@mdm.bga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <reply-olpc-3-v2-kM9DGJe42AJBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Nov 2010 01:48:30 -0600
Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org> wrote:

> On Thu, 11 Nov 2010 around 21:45:46 -0800, Andres Salomon wrote:
> > diff --git a/arch/x86/platform/olpc/olpc_dt.c
> > b/arch/x86/platform/olpc/olpc_dt.c index b8c8ff9..0ab824d 100644
> > --- a/arch/x86/platform/olpc/olpc_dt.c
> > +++ b/arch/x86/platform/olpc/olpc_dt.c
> > @@ -126,14 +126,31 @@  static unsigned int prom_early_allocated
> > __initdata; 
> >  void * __init prom_early_alloc(unsigned long size)
> >  {
> > +	static u8 *mem = NULL;
> > +	static size_t free_mem = 0;
> 
> Static variables are implicitly 0 and NULL

That's true for global static variables; is it also true for static
variables that are local to a function?


> 
> >  	void *res;
> >  
> > -	res = alloc_bootmem(size);
> > -	if (res)
> > -		memset(res, 0, size);
> > -
> > -	prom_early_allocated += size;
> > +	if (free_mem < size) {
> > +		const size_t chunk_size = max(PAGE_SIZE, size);
> > +
> > +		/*
> > +		 * To mimimize the number of allocations, grab at
> > least 4k of
> > +		 * memory (that's an arbitrary choice that matches
> > PAGE_SIZE on
> > +		 * the platforms we care about, and minimizes
> > wasted bootmem)
> > +		 * and hand off chunks of it to callers.
> > +		 */
> > +		res = mem = alloc_bootmem(chunk_size);
> > +		if (!res)
> > +			return NULL;
> 
> Oops.  If alloc_bootmem fails, we loose mem but don't reset free_mem,
> so a later call (possibly for a smaller chunk) may return memory
> starting at NULL.

You're right, good catch.  Thanks!


> 
> I suggest just assinging res above and then add mem = res inside this
> if.
> 
> Oh, this is alloc_bootmem not alloc_bootmem_nopainc ... should it be?
> 

Currently, nothing in drivers/of/pdt.c actually checks alloc_bootmem
results.. so we're panicking whether we like it or not.  It would be
good to actually handle memory failures gracefully and not oops (the DT
certainly isn't essential to booting in OLPC's case), but that's a
separate patch (series).


> > +		prom_early_allocated += chunk_size;
> > +		memset(res, 0, chunk_size);
> > +		free_mem = chunk_size;
> > +	}
> >  
> > +	/* allocate from the local cache */
> > +	free_mem -= size;
> > +	res = mem;
> > +	mem += size;
> >  	return res;
> >  }
> >  
> 
> milton

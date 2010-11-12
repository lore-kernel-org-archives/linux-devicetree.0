From: Milton Miller <miltonm@bga.com>
Subject: Re: [PATCH 3/3] x86: OLPC: speed up device tree creation during boot (v2)
Date: Fri, 12 Nov 2010 01:48:30 -0600
Message-ID: <reply-olpc-3-v2@mdm.bga.com>
References: <20101111214546.4e573cad@queued.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101111214546.4e573cad@queued.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Nov 2010 around 21:45:46 -0800, Andres Salomon wrote:
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
> index b8c8ff9..0ab824d 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -126,14 +126,31 @@  static unsigned int prom_early_allocated __initdata;
>  
>  void * __init prom_early_alloc(unsigned long size)
>  {
> +	static u8 *mem = NULL;
> +	static size_t free_mem = 0;

Static variables are implicitly 0 and NULL

>  	void *res;
>  
> -	res = alloc_bootmem(size);
> -	if (res)
> -		memset(res, 0, size);
> -
> -	prom_early_allocated += size;
> +	if (free_mem < size) {
> +		const size_t chunk_size = max(PAGE_SIZE, size);
> +
> +		/*
> +		 * To mimimize the number of allocations, grab at least 4k of
> +		 * memory (that's an arbitrary choice that matches PAGE_SIZE on
> +		 * the platforms we care about, and minimizes wasted bootmem)
> +		 * and hand off chunks of it to callers.
> +		 */
> +		res = mem = alloc_bootmem(chunk_size);
> +		if (!res)
> +			return NULL;

Oops.  If alloc_bootmem fails, we loose mem but don't reset free_mem, so a
later call (possibly for a smaller chunk) may return memory starting
at NULL.

I suggest just assinging res above and then add mem = res inside this if.

Oh, this is alloc_bootmem not alloc_bootmem_nopainc ... should it be?

> +		prom_early_allocated += chunk_size;
> +		memset(res, 0, chunk_size);
> +		free_mem = chunk_size;
> +	}
>  
> +	/* allocate from the local cache */
> +	free_mem -= size;
> +	res = mem;
> +	mem += size;
>  	return res;
>  }
>  

milton

From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Tue, 10 Nov 2015 15:29:44 +1100
Message-ID: <1447129784.13889.25.camel@ellerman.id.au>
References: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442367036-15205-1-git-send-email-mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-09-15 at 18:30 -0700, Mitchel Humpherys wrote:

> Any overlap in the reserved memory regions (those specified in the
> reserved-memory DT node) is a bug.  These bugs might go undetected as
> long as the contested region isn't used simultaneously by multiple
> software agents, which makes such bugs hard to debug.  Fix this by
> printing a scary warning during boot if overlap is detected.
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 726ebe792813..62f467b8ccae 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -197,12 +198,52 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
>  	return -ENOENT;
>  }
>  
> +static int __init __rmem_cmp(const void *a, const void *b)
> +{
> +	const struct reserved_mem *ra = a, *rb = b;
> +
> +	return ra->base - rb->base;
> +}
> +
> +static void __init __rmem_check_for_overlap(void)
> +{
> +	int i;
> +
> +	if (reserved_mem_count < 2)
> +		return;
> +
> +	sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
> +	     __rmem_cmp, NULL);
> +	for (i = 0; i < reserved_mem_count - 1; i++) {
> +		struct reserved_mem *this, *next;
> +
> +		this = &reserved_mem[i];
> +		next = &reserved_mem[i + 1];
> +		if (!(this->base && next->base))
> +			continue;
> +		if (this->base + this->size > next->base) {
> +			phys_addr_t this_end, next_end;
> +
> +			this_end = this->base + this->size;
> +			next_end = next->base + next->size;
> +			WARN(1,
> +			     "Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
> +			     this->name, &this->base, &this_end,
> +			     next->name, &next->base, &next_end);

This is blowing up on some powerpc machines.

It's too early in boot to call WARN() on these systems.

Can we turn it into a pr_err() for now?

I'll send a patch?

cheers

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

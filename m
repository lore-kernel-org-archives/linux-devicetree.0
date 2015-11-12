From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Thu, 12 Nov 2015 19:06:25 +1100
Message-ID: <1447315585.31688.5.camel@ellerman.id.au>
References: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442367036-15205-1-git-send-email-mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

So on further inspection it seems this is really our problem.

The reserved_mem->base values are u64, so when the unsigned result of the
substraction is converted to int we may or may not get the right value. That
means the sort fails and the reserved mem check gives false positives.

eg:

  Reserved memory: OVERLAP DETECTED!
  ibm,slw-image@1ffe600000 (0x0000001ffe600000--0x0000001ffe700000) overlaps with ibm,firmware-allocs-memory@1000000000 (0x0000001000000000--0x0000001000dc0200)

Note there is no overlap:

  0x0000001ffe600000--0x0000001ffe700000
  vs
  0x0000001000000000--0x0000001000dc0200

cheers

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

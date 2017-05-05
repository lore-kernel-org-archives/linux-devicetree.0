From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: fix sparse warning in of_pci_range_parser_one
Date: Thu, 4 May 2017 22:16:03 -0700
Message-ID: <590C0A93.4080000@gmail.com>
References: <20170504180035.12834-1-robh@kernel.org>
 <20170504180035.12834-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504180035.12834-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/04/17 11:00, Rob Herring wrote:
> sparse gives the following warning for 'pci_space':
> 
> ../drivers/of/address.c:266:26: warning: incorrect type in assignment (different base types)
> ../drivers/of/address.c:266:26:    expected unsigned int [unsigned] [usertype] pci_space
> ../drivers/of/address.c:266:26:    got restricted __be32 const [usertype] <noident>
> 
> It appears that pci_space is only ever accessed on powerpc, so the endian
> swap is often not needed.
> 
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/address.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 02b2903fe9d2..72914cdfce2a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -263,7 +263,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>  	if (!parser->range || parser->range + parser->np > parser->end)
>  		return NULL;
>  
> -	range->pci_space = parser->range[0];
> +	range->pci_space = be32_to_cpup(parser->range);
>  	range->flags = of_bus_pci_get_flags(parser->range);
>  	range->pci_addr = of_read_number(parser->range + 1, ns);
>  	range->cpu_addr = of_translate_address(parser->node,
> 

Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

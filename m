From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Mon, 13 Oct 2014 12:16:11 +0100
Message-ID: <20141013111611.GC15326@leverpostej>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413021710-32264-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 11, 2014 at 11:01:50AM +0100, Josh Wu wrote:
> From: Josh Wu <Josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> 
> If there is no PMECC lookup table stored in ROM, or lookup table offset is
> not specified, PMECC driver should build it in DDR by itself.
> 
> That make the PMECC driver work for some board which doesn't has PMECC
> lookup table in ROM.
> 
> The PMECC use the BCH algorithm, so based on the build_gf_tables()
> function in lib/bch.c, we can build the Galois Field lookup table.
> 
> For more information can refer to section 5.4 of PMECC controller
> application note:
> 	http://www.atmel.com/images/doc11127.pdf
> 
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> v1 -> v2:
>   make create_lookup_table() static.
> 
> v2 -> v3:
>   rewrite the build_gf_tables() function based on lib/bch.c.
>   add error handling in create_lookup_table().
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  6 +-
>  drivers/mtd/nand/atmel_nand.c                      | 81 ++++++++++++++++++++--
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  4 ++
>  3 files changed, 85 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 6edc3b6..1fe6dde 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -5,7 +5,9 @@ Required properties:
>  - reg : should specify localbus address and size used for the chip,
>  	and hardware ECC controller if available.
>  	If the hardware ECC is PMECC, it should contain address and size for
> -	PMECC, PMECC Error Location controller and ROM which has lookup tables.
> +	PMECC and PMECC Error Location controller.
> +	The PMECC lookup table address and size in ROM is optional. If not
> +	specified, driver will build it in runtime.
>  - atmel,nand-addr-offset : offset for the address latch.
>  - atmel,nand-cmd-offset : offset for the command latch.
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
> @@ -27,7 +29,7 @@ Optional properties:
>    are: 512, 1024.
>  - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM
>    for different sector size. First one is for sector size 512, the next is for
> -  sector size 1024.
> +  sector size 1024. If not specified, driver will build the table in runtime.

I'm not sure we need to mention this in the binding.

That said, if we can build this dynamically, can't we always do so, and
never need this property?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

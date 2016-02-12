From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/5] mtd: atmel_nand: Support 32-bit ECC strength
Date: Fri, 12 Feb 2016 10:30:15 -0800
Message-ID: <20160212183015.GP19540@google.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
 <1455098187-9442-5-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455098187-9442-5-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 10, 2016 at 10:56:26AM +0100, Romain Izard wrote:
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt |  3 ++-
>  drivers/mtd/nand/atmel_nand.c                        | 19 +++++++++++++++++--
>  drivers/mtd/nand/atmel_nand_ecc.h                    |  1 +
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index e1887b7d7e53..d53aba98fbc9 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -27,7 +27,8 @@ Optional properties:
>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
>    capable of BCH encoding and decoding, on devices where it is present.
>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
> -  Controller. Supported values are: 2, 4, 8, 12, 24.
> +  Controller. Supported values are: 2, 4, 8, 12, 24. If the compatible string

Looks like you could be using the common 'nand-ecc-strength' binding
here.

> +  is "atmel,sama5d2-nand", 32 is also valid.
>  - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
>    are: 512, 1024.

And 'nand-ecc-step-size' here.

>  - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM

Of course we can't break backward compatibility, but it'd be nice if you
made sure this worked with the generic bindings.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

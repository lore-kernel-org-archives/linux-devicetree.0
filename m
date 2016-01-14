From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/5] mtd: atmel_nand: Support PMECC on SAMA5D2
Date: Wed, 13 Jan 2016 19:12:52 -0600
Message-ID: <20160114011252.GA29778@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-4-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452702857-2240-4-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 05:34:15PM +0100, Romain Izard wrote:
> Starting with the SAMA5D2, there is a new revision of the Atmel PMECC
> controller that can correct 32 bits in each sector. This controller is
> not 100% compatible with the previous revision that corrected a maximum
> of 24 bits by sector, as some register addresses overlap.
> 
> Using information from the device tree, we can configure the driver to
> work with both versions.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  7 +++++--
>  drivers/mtd/nand/atmel_nand.c                      | 23 +++++++++++++++++++++-
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  8 ++++++--
>  3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 89b0db9801b0..90887b430f03 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -1,7 +1,10 @@
>  Atmel NAND flash
>  
>  Required properties:
> -- compatible : should be "atmel,at91rm9200-nand" or "atmel,sama5d4-nand".
> +- compatible: The possible values are:
> +	"atmel,at91rm9200-nand"
> +	"atmel,sama5d2-nand"
> +	"atmel,sama5d4-nand"
>  - reg : should specify localbus address and size used for the chip,
>  	and hardware ECC controller if available.
>  	If the hardware ECC is PMECC, it should contain address and size for
> @@ -22,7 +25,7 @@ Optional properties:
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>    "soft_bch".
>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
> -  Only supported by at91sam9x5 or later sam9 product.
> +  Supported by AT91SAM9x5 or later SAM9 chips, and SAMA5 chips.

What compatible string would AT91SAM9x5 be?

>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
>    Controller. Supported values are: 2, 4, 8, 12, 24.
>  - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

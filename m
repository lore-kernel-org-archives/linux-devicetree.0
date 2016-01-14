From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/5] mtd: atmel_nand: Support variable RB_EDGE
 interrupts
Date: Wed, 13 Jan 2016 19:19:24 -0600
Message-ID: <20160114011924.GA31786@rob-hp-laptop>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-3-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452702857-2240-3-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 05:34:14PM +0100, Romain Izard wrote:
> The NFC controller used to accelerate the NAND transfers on SAMA5 chips
> can use either RB_EDGE0 or RB_EDGE3 as its ready/busy interrupt bit.
> 
> Use the controller's compatible string to select the correct bit.
> 
> Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Wenyou Yang <Wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
>  drivers/mtd/nand/atmel_nand.c                      | 39 +++++++++++++++++-----
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  5 ++-
>  3 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index 7d4c8eb775a5..89b0db9801b0 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -34,7 +34,7 @@ Optional properties:
>  - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
>  - Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
>    - Required properties:
> -    - compatible : "atmel,sama5d3-nfc".
> +    - compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
>      - reg : should specify the address and size used for NFC command registers,
>              NFC registers and NFC Sram. NFC Sram address and size can be absent
>              if don't want to use it.

For the binding: 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

[...]

> @@ -2352,6 +2360,12 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	priv = of_match_device(atmel_nand_nfc_match, &pdev->dev)->data;

Use of_device_get_match_data

> +	if (NULL == priv)
> +		return -ENODEV;
> +
> +	nfc->rb_edge = priv->rb_edge;
> +
>  	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
>  	nfc_readl(nfc->hsmc_regs, SR);	/* clear the NFC_SR */
>  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: gpmi: add a new DT property to use the
 datasheet's minimum required ECC
Date: Tue, 5 Nov 2013 12:07:29 -0800
Message-ID: <20131105200729.GT20061@ld-irv-0074.broadcom.com>
References: <1382929517-22606-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382929517-22606-1-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 28, 2013 at 11:05:17AM +0800, Huang Shijie wrote:
> In default way, we use the ecc_strength/ecc_step size calculated by ourselves
> and use all the OOB area.
> 
> This patch adds a new property : "fsl,use-minimum-ecc"
> 
> If we enable it, we will firstly try to use the datasheet's minimum required
> ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> in the nand_chip{}). So we may have free space in the OOB area by using the
> minimum ECC, and we may support JFFS2 with some SLC NANDs, such as Micron's
> SLC NAND.
> 
> If we fail to use the minimum ECC, we will use the legacy method to calculate
> the ecc_strength and ecc_step size.
> 
> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v1 --> v2:
> 	based on David's patch to fix the regression.
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.txt          |    6 ++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
>  2 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> index 551b2a1..4297795 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -17,6 +17,12 @@ Required properties:
>  Optional properties:
>    - nand-on-flash-bbt: boolean to enable on flash bbt option if not
>                         present false
> +  - fsl,use-minimum-ecc: By enabling this boolean property, the gpmi will try
> +                       to use the datasheet's minimum required ECC provided by
> +                       the MTD layer (the ecc_strength_ds/ecc_step_ds fields
> +                       in the nand_chip{}). So we may have free space in the OOB
> +                       area by using the minimum ECC, and we may support JFFS2
> +                       with some SLC NANDs, such as Micron's SLC NAND.

This description still uses Linux-isms/MTD-isms (ecc_strength_ds,
ecc_step_ds, nand_chip{}, JFFS2). I would personally write this as
something like the following:

  - fsl,use-minimum-ecc: Protect this NAND flash with the minimum ECC
			 strength required. The required ECC strength is
			 automatically discoverable for some flash
			 (e.g., according to the ONFI standard).
			 However, note that if this strength is not
			 discoverable, the software may choose an
			 implementation-defined ECC scheme.

Is that enough weaseling? Any comments from the DT folks, or shall we
simply take this binding without review?

>  
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.

...

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Date: Fri, 25 Mar 2016 15:45:20 +0100
Message-ID: <20160325154520.199b0863@bbrezillon>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Graham Moore <grmoore@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, 24 Mar 2016 21:24:37 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> changed in revision 5.1") supported the new encoding of the "n_banks"
> bits of the "features" register, but there is an unfortunate case
> that is not covered by that commit.
> 
> Panasonic (its System LSI division is now Socionext) bought several
> versions of this IP.  The IP released for Panasonic around Feb. 2012
> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
> While the one released around Nov. 2012 is also revision 5, but it
> uses the new encoding (1 << n_banks).
> 
> The revision register cannot distinguish these two incompatible
> hardware.  I guess this IP series is not well-organized.  I could not
> find any alternative but giving max_banks from DT property.

Hm, shouldn't that be addressed with a new compatible instead of adding
a extra property?

> 
> This commit works around the problem by allowing DT to set the
> max_banks forcibly.  Of course, this DT property can be optional if
> the auto detection based on the hardware registers works well.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++
>  drivers/mtd/nand/denali.c                             | 3 ++-
>  drivers/mtd/nand/denali_dt.c                          | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 785b825..78c250d 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -7,6 +7,10 @@ Required properties:
>    - interrupts : The interrupt number.
>    - dma-mask : DMA bit mask
>  
> +Optional properties:
> +  - max-banks : Maximum number of banks supported by hardware.  If not
> +    specified, it is determined based on the "features" register of hardware.
> +

You might want to prefix that with "denali,".

>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 30bf5f6..e18b569 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1353,7 +1353,8 @@ static void denali_hw_init(struct denali_nand_info *denali)
>  	 */
>  	denali->bbtskipbytes = ioread32(denali->flash_reg +
>  						SPARE_AREA_SKIP_BYTES);
> -	detect_max_banks(denali);
> +	if (!denali->max_banks)
> +		detect_max_banks(denali);
>  	denali_nand_reset(denali);
>  	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
>  	iowrite32(CHIP_EN_DONT_CARE__FLAG,
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index 0cb1e8d..be55db8 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -85,6 +85,9 @@ static int denali_dt_probe(struct platform_device *ofdev)
>  		denali->dev->dma_mask = NULL;
>  	}
>  
> +	of_property_read_u32(ofdev->dev.of_node, "max-banks",
> +			     &denali->max_banks);
> +
>  	dt->clk = devm_clk_get(&ofdev->dev, NULL);
>  	if (IS_ERR(dt->clk)) {
>  		dev_err(&ofdev->dev, "no clk available\n");



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

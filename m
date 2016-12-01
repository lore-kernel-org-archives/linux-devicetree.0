From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 39/39] mtd: nand: denali_dt: add compatible strings for
 UniPhier SoC variants
Date: Thu, 1 Dec 2016 10:05:11 -0600
Message-ID: <20161201160511.ahlibszokg547wxk@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480183585-592-40-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 27, 2016 at 03:06:25AM +0900, Masahiro Yamada wrote:
> Add two compatible strings for UniPhier SoCs.  The revision register
> on both shows revision 5.0, but they are different hardware.
> 
> Features:
>  - DMA engine with 64 bit physical address support
>  - 1024 byte ECC step size
>  - 8 / 16 / 24 bit ECC strength
>  - The n_banks format depends on SoC
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        | 10 +++++--
>  drivers/mtd/nand/denali_dt.c                       | 33 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 51fe195..cea46e2 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -1,13 +1,19 @@
>  * Denali NAND controller
>  
>  Required properties:
> -  - compatible : should be "denali,denali-nand-dt"
> +  - compatible : should be one of the following:
> +      "denali,denali-nand-dt"

There are multiple things wrong with this string. denali,denali is 
redundant is one. It's also fairly useless as this IP has several 
versions and numerous configuration options IIRC. This should be 
deprecated IMO.

> +      "denali,denali-nand-uniphier-v5a"
> +      "denali,denali-nand-uniphier-v5b"

Use your vendor prefix, not denali. The 2nd denali can probably be 
dropped because it is not likely you have another kind of nand 
controller in the SoC.

>    - reg : should contain registers location and length for data and reg.
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
>  
>  Optional properties:
> -  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to 512.
> +  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
> +      512  for "denali,denali-nand-dt"
> +      1024 for "denali,denali-nand-uniphier-v5a"
> +      1024 for "denali,denali-nand-uniphier-v5b"
>      see nand.txt for details.
>    - nand-ecc-strength: see nand.txt for details
>    - nand-ecc-maximize: see nand.txt for details

From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2] dt-bindings: nand: denali: reduce the register space
 in the example
Date: Fri, 22 Sep 2017 12:06:32 +0200
Message-ID: <20170922120632.74bbdd64@bbrezillon>
References: <1506059903-15552-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506059903-15552-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Oleksij Rempel <o.rempel@pengutronix.de>, Dinh Nguyen <dinguyen@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Sep 2017 14:58:23 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This example allocates much more than needed for address regions.
> 
> As for "denali_reg", as you see in drivers/mtd/nand/denali.h, all
> registers fit in 0x1000.
> 
> As for "nand_data", this IP is generally configured to use Indexed
> Addressing mode, where there are only two registers in the address
> translation module (CTRL: 0x00, DATA: 0x10).  Altera SOCFPGA is
> also this case.  So, 0x20 is enough.
> 

Applied.

Thanks,

Boris

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v2:
>   - Add a little more explanation for rationale of this patch
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 504291d..0ee8edb 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -29,7 +29,7 @@ nand: nand@ff900000 {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	compatible = "altr,socfpga-denali-nand";
> -	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
> +	reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
>  	reg-names = "nand_data", "denali_reg";
>  	interrupts = <0 144 4>;
>  };

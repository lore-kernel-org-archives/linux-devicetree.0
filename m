From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
Date: Tue, 18 Oct 2016 11:39:13 -0500
Message-ID: <20161018163913.7z337iyc53atp4yd@rob-hp-laptop>
References: <1476723427-13243-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476723427-13243-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Milton Miller <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 17, 2016 at 06:57:07PM +0200, Cédric Le Goater wrote:
> This driver adds mtd support for spi-nor attached to either or both of
> the Firmware Memory Controller or the SPI Flash Controller (AST2400
> only).
> 
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
> 
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
> 
> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
> 
> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/aspeed-smc.txt         |  86 +++
>  drivers/mtd/spi-nor/Kconfig                        |  12 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c                   | 746 +++++++++++++++++++++
>  4 files changed, 845 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
> 
> diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> new file mode 100644
> index 000000000000..f6bfa7761205
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
> @@ -0,0 +1,86 @@
> +* Aspeed Static Memory controller
> +* Aspeed SPI Flash Controller
> +
> +The Static memory controller in the ast2400 supports 5 chip selects each
> +can be attached to NAND, parallel NOR, or SPI NOR attached flash.  The
> +Firmware Memory Controller in the ast2500 supports 3 chip selects, two of
> +which are always in SPI-NOR mode and the third can be SPI-NOR or parallel
> +flash.  The SPI flash controller in the ast2400 supports one of 2 chip
> +selects selected by pinmux.  The two SPI flash controllers in the ast2500
> +each support two chip selects.
> +
> +Required properties:
> +  - compatible : Should be one of
> +	"aspeed,ast2400-fmc" for the AST2400 Static Memory Controller
> +	"aspeed,ast2400-smc" for the AST2400 SPI Flash Controller
> +	"aspeed,ast2500-fmc" for the AST2500 Firmware SPI Memory Controller
> +	"aspeed,ast2500-smc" for the AST2500 SPI Flash Controllers
> +  - reg : the first contains the control register location and length,
> +          the second contains the memory window mapping address and length
> +  - clocks : The APB clock input to the controller
> +  - #address-cells : must be 1 corresponding to chip select child binding
> +  - #size-cells : must be 0 corresponding to chip select child binding
> +
> +Optional properties:
> +  - aspeed,fmc-has-dma : controller supports DMA transfers

The compatible should imply this.

> +  - interrupts : Should contain the interrupt for the dma device if an fmc
> +
> +Child node required properties:

Need to say what the child nodes are.

> +  - reg : must contain chip select number in first cell of address, must
> +	  be 1 tuple long
> +  - compatible : may contain "vendor,part", must include "jedec,spi-nor"
> +		when attached to SPI flash (see spi-nor.txt binding).
> +
> +Child node optional properties:
> +  - label           - (optional) name to assign to mtd, default os assigned
> +
> +Child node optional properties for SPI mode (may be ignored):
> +  - spi-max-frequency - (optional) max frequency of spi bus
> +  - spi-cpol        - (optional) Empty property indicating device requires
> +			inverse clock polarity (CPOL) mode (boolean)
> +  - spi-cpha        - (optional) Empty property indicating device requires
> +			shifted clock phase (CPHA) mode (boolean)
> +  - spi-tx-bus-width - (optional) The bus width(number of data wires) that
> +                        used for MOSI. Defaults to 1 if not present.
> +  - spi-rx-bus-width - (optional) The bus width(number of data wires) that
> +                        used for MOSI. Defaults to 1 if not present.
> +
> +Grandchild node optional properties:
> + - see mtd/partiton.txt for partitioning bindings and mtd naming
> +
> +
> +Example:
> +
> +fmc: fmc@1e620000 {
> +	compatible = "aspeed,ast2400-fmc";
> +	reg = < 0x1e620000 0x94
> +		0x20000000 0x02000000
> +		0x22000000 0x02000000 >;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	flash@0 {
> +		reg = < 0 >;
> +		compatible = "jedec,spi-nor" ;
> +		label = "bmc";

label isn't really a defined property here. Belongs in jedec,spi-nor 
binding if you want to add it.

> +		/* spi-max-frequency = <>; */
> +		/* m25p,fast-read; */
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		boot@0 {

Use the newer style with all partitions under a 'partitions' node.

> +			label = "boot-loader";
> +			reg = < 0 0x8000 >

Missing ';'

> +		}
> +		image@8000 {
> +			label = "kernel-image";
> +			reg = < 0x8000 0x1f8000 >

ditto

> +		}
> +	};
> +	flash@1 {
> +		reg = < 1 >;
> +		compatible = "jedec,spi-nor" ;
> +		label = "alt";
> +		/* spi-max-frequency = <>; */
> +		status = "fail";
> +		/* m25p,fast-read; */
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

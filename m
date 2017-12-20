From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: mtd: add Marvell NAND controller
 documentation
Date: Wed, 20 Dec 2017 15:05:11 -0600
Message-ID: <20171220210511.ty2e7mkiktvn4een@rob-hp-laptop>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-2-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219132942.27433-2-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ezequiel
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 02:29:38PM +0100, Miquel Raynal wrote:
> Document the legacy and the new bindings for Marvell NAND controller.
> 
> The pxa3xx_nand.c driver does only support legacy bindings, which are
> incomplete and inaccurate. A rework of this controller (called
> marvell_nand.c) does support both.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/mtd/marvell-nand.txt       | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> new file mode 100644
> index 000000000000..aa6a1ed045b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> @@ -0,0 +1,123 @@
> +Marvell NAND Flash Controller (NFC)
> +
> +Required properties:
> +- compatible: can be one of the following:
> +    * "marvell,armada-8k-nand-controller"
> +    * "marvell,armada370-nand-controller"
> +    * "marvell,pxa3xx-nand-controller"
> +    * "marvell,armada-8k-nand" (deprecated)
> +    * "marvell,armada370-nand" (deprecated)
> +    * "marvell,pxa3xx-nand" (deprecated)
> +  Compatibles marked deprecated support only the old bindings described
> +  at the bottom.
> +- reg: NAND flash controller memory area.
> +- #address-cells: shall be set to 1. Encode the NAND CS.
> +- #size-cells: shall be set to 0.
> +- interrupts: shall define the NAND controller interrupt.
> +- clocks: shall reference the NAND controller clock.
> +- marvell,system-controller: Set to retrieve the syscon node that handles
> +  NAND controller related registers (only required with the
> +  "marvell,armada-8k-nand[-controller]" compatibles).
> +
> +Optional properties:
> +- label: see partition.txt. New platforms shall omit this property.
> +- dmas: shall reference DMA channel associated to the NAND controller.
> +  This property is only used with "marvell,pxa3xx-nand[-controller]"
> +  compatible strings.
> +- dma-names: shall be "rxtx".
> +  This property is only used with "marvell,pxa3xx-nand[-controller]"
> +  compatible strings.
> +
> +Optional children nodes:
> +Children nodes represent the available NAND chips.
> +
> +Required properties:
> +- reg: shall contain the native Chip Select ids (0-3)
> +- marvell,rb: shall contain the native Ready/Busy ids (0-1)

We already have at least 2 other <vendor>,rb properties. Let's not add a 
3rd and make a common one instead.

> +
> +Optional properties:
> +- marvell,nand-keep-config: orders the driver not to take the timings
> +  from the core and leaving them completely untouched. Bootloader
> +  timings will then be used.
> +- label: MTD name.
> +- nand-on-flash-bbt: see nand.txt.
> +- nand-ecc-mode: see nand.txt. Will use hardware ECC if not specified.
> +- nand-ecc-algo: see nand.txt. This property may be added when using
> +  hardware ECC for clarification but will be ignored by the driver
> +  because ECC mode is chosen depending on the page size and the strength
> +  required by the NAND chip. This value may be overwritten with
> +  nand-ecc-strength property.

If not used, then drop it.

> +- nand-ecc-strength: see nand.txt.
> +- nand-ecc-step-size: see nand.txt. This has no effect and will be
> +  ignored by the driver when using hardware ECC because Marvell's NAND
> +  flash controller does use fixed strength (1-bit for Hamming, 16-bit
> +  for BCH), so the step size will shrink or grow in order to fit the
> +  required strength. Step sizes are not completely random for all and
> +  follow certain patterns described in AN-379, "Marvell SoC NFC ECC".

Same here.

> +
> +See Documentation/devicetree/bindings/mtd/nand.txt for more details on
> +generic bindings.
> +
> +
> +Example:
> +nand_controller: nand-controller@d0000 {
> +	compatible = "marvell,armada370-nand-controller";
> +	reg = <0xd0000 0x54>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&coredivclk 0>;
> +
> +	nand@0 {
> +		reg = <0>;
> +		label = "main-storage";
> +		marvell,rb = <0>;
> +		nand-ecc-mode = "hw";
> +		marvell,nand-keep-config;
> +		nand-on-flash-bbt;
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "Rootfs";
> +				reg = <0x00000000 0x40000000>;
> +			};
> +		};
> +	};
> +};
> +
> +
> +Note on legacy bindings: One can find, in not-updated device trees,
> +bindings slightly differents than described above with other properties

s/differents/different/

> +described below as well as the partitions node at the root of a so
> +called "nand" node (without clear controller/chip separation).
> +
> +Legacy properties:
> +- marvell,nand-enable-arbiter: To enable the arbiter, all boards blindly
> +  used it, this bit was set by the bootloader for many boards and even if
> +  it is marked reserved in several datasheets, it might be needed to set
> +  it (otherwise it is harmless) so whether or not this property is set,
> +  the bit is selected by the driver.
> +- num-cs: Number of chip-select lines to use, all boards blindly set 1
> +  to this and for a reason, other values would have failed. The value of
> +  this property is ignored.
> +
> +Example:
> +
> +	nand0: nand@43100000 {
> +		compatible = "marvell,pxa3xx-nand";
> +		reg = <0x43100000 90>;
> +		interrupts = <45>;
> +		dmas = <&pdma 97 0>;
> +		dma-names = "rxtx";
> +		#address-cells = <1>;
> +		marvell,nand-keep-config;
> +		marvell,nand-enable-arbiter;
> +		num-cs = <1>;
> +		/* Partitions (optional) */
> +       };
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

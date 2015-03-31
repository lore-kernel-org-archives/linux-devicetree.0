From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH_V2 1/2] dt-bindings: binding for jz4780-{nand,bch}
Date: Mon, 30 Mar 2015 18:59:42 -0700
Message-ID: <20150331015942.GS32500@ld-irv-0074>
References: <1425902299-53967-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1425902299-53967-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425902299-53967-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Steve deRosier <derosier@gmail.com>, dehrenberg@google.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 09, 2015 at 11:58:18AM +0000, Zubair Lutfullah Kakakhel wrote:
> From: Alex Smith <alex.smith@imgtec.com>
> 
> Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs,
> as well as the hardware BCH controller, used by the jz4780_{nand,bch}
> drivers.
> 
> Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> ---
> V1 - > V2
> Rebase to 4.0-rc3
> ---
>  .../bindings/mtd/ingenic,jz4780-nand.txt           | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> new file mode 100644
> index 0000000..6f2e128
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
> @@ -0,0 +1,57 @@
> +* Ingenic JZ4780 NAND/BCH
> +
> +This file documents the device tree bindings for NAND flash devices on the
> +JZ4780. NAND devices are connected to the NEMC controller (described in
> +memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
> +be children of the NEMC node.
> +
> +Required NAND device properties:
> +- compatible: Should be set to "ingenic,jz4780-nand".
> +- reg: For each bank with a NAND chip attached, should specify a bank number,
> +  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
> +
> +Optional NAND device properties:
> +- ingenic,bch-device: To make use of the hardware BCH controller, this property
> +  must contain a phandle for the BCH controller node. The required properties
> +  for this node are described below. If this is not specified, software BCH
> +  will be used instead.
> +- ingenic,ecc-size: ECC block size in bytes.
> +- ingenic,ecc-strength: ECC strength (max number of correctable bits).

Can you use the generic nand-ecc-step-size and nand-ecc-strength
properties instead of defining new ones?

> +- ingenic,busy-gpio: GPIO specifier for the busy pin.
> +- ingenic,wp-gpio: GPIO specifier for the write protect pin.

The gipo.txt binding document recommends naming properties *-gpios, not
*-gpio. Also, these look like they are exposing the actualy R/B and WP#
pins as gpios, correct? If so, then I think it'd be good to give them
generic names, not 'ingenic,' names. That way, we might consider
supporting reusable code that handles them. And I see that sunxi-nand
already uses a generic name for the R/B pin: rb-gpios.

So these might work:

  rb-gpios
  wp-gpios


BTW, generic GPIO WP# handling was discussed a few months ago, though I
didn't see any patches yet:

http://lists.infradead.org/pipermail/linux-mtd/2015-January/057256.html

I see that your driver is just using this to disable write-protection
permanently, but I've seen cases where it helps to keep write-protection
enabled whenever you're not writing to the NAND.

> +
> +Example:
> +
> +nemc: nemc@13410000 {
> +	...
> +
> +	nand: nand@1 {
> +		compatible = "ingenic,jz4780-nand";
> +		reg = <1 0 0x1000000>;	/* Bank 1 */
> +
> +		ingenic,bch-device = <&bch>;
> +		ingenic,ecc-size = <1024>;
> +		ingenic,ecc-strength = <24>;
> +
> +		ingenic,busy-gpio = <&gpa 20 GPIO_ACTIVE_LOW>;
> +		ingenic,wp-gpio = <&gpf 22 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +The BCH controller is a separate SoC component used for error correction on
> +NAND devices. The following is a description of the device properties for a
> +BCH controller.
> +
> +Required BCH properties:
> +- compatible: Should be set to "ingenic,jz4780-bch".
> +- reg: Should specify the BCH controller registers location and length.
> +- clocks: Clock for the BCH controller.
> +
> +Example:
> +
> +bch: bch@134d0000 {
> +	compatible = "ingenic,jz4780-bch";
> +	reg = <0x134d0000 0x10000>;
> +
> +	clocks = <&cgu JZ4780_CLK_BCH>;
> +};

Brian

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-binding: mtd: add NPCM FIU controller
Date: Wed, 19 Dec 2018 09:54:10 -0600
Message-ID: <20181219155410.GA3925@bogus>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
 <20181203091456.454030-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203091456.454030-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, linux-mtd@lists.infradead.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 11:14:55AM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Flash Interface Unit(FIU) SPI-NOR controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/npcm-fiu.txt | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/npcm-fiu.txt b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> new file mode 100644
> index 000000000000..9746cb5b1ced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> @@ -0,0 +1,64 @@
> +* Nuvoton FLASH Interface Unit (FIU) SPI Controller
> +
> +NPCM FIU supports single, dual and quad communication interface.
> +
> +The NPCM7XX supports three FIU modules,
> +FIU0 and FIUx supports two chip selects,
> +FIU3 support four chip select.
> +
> +Required properties:
> +  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
> +  - #address-cells : should be 1.
> +  - #size-cells : should be 0.
> +  - reg : the first contains the register location and length,
> +          the second contains the memory mapping address and length
> +  - reg-names: Should contain the reg names "control" and "memory"
> +  - clocks : phandle of F reference clock.
> +
> +Required properties in case the pins can be muxed:
> +  - pinctrl-names : a pinctrl state named "default" must be defined.
> +  - pinctrl-0 : phandle referencing pin configuration of the device.
> +
> +Optional property:
> +  - spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.

Needs a vendor prefix. Unless this is some standard SPI thing (which 
I've never heard of).

> +
> +The SPI device must be a child of the FIU node and must have a
> +compatible property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Required property:
> +- reg: chip select number.
> +
> +Optional property:
> +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description.
> +
> +Aliases:
> +- All the FIU controller nodes should be represented in the aliases node using
> +  the following format 'fiu{n}' where n is a unique number for the alias.
> +  In the NPCM7XX BMC:
> +  		fiu0 represent fiu 0 controller
> +  		fiu1 represent fiu 3 controller
> +  		fiu2 represent fiu x controller

Please don't make up your own aliases. Use 'spiX' if anything, but 
really, why do you need aliases in the first place?

> +
> +Example:
> +fiu3: fiu@c00000000 {

spi@...

> +	compatible = "nuvoton,npcm750-fiu";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clk NPCM7XX_CLK_AHB>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi3_pins>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		spi-rx-bus-width = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0>;
> +		partition@0 {
> +			label = "flash_data";
> +			reg = <0x0 0x800000>;
> +		};
> +	};
> +};
> +
> -- 
> 2.14.1
> 

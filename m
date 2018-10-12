From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Date: Fri, 12 Oct 2018 15:32:29 -0500
Message-ID: <20181012203229.GA9657@bogus>
References: <1538732520-2800-1-git-send-email-christophe.kerello@st.com>
 <1538732520-2800-2-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538732520-2800-2-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 05, 2018 at 11:41:58AM +0200, christophe.kerello@st.com wrote:
> From: Christophe Kerello <christophe.kerello@st.com>
> 
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 NAND controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> new file mode 100644
> index 0000000..b620176
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
> @@ -0,0 +1,59 @@
> +STMicroelectronics Flexible Memory Controller 2 (FMC2)
> +NAND Interface
> +
> +Required properties:
> +- compatible: Should be one of:
> +              * st,stm32mp15-fmc2
> +- reg: NAND flash controller memory areas.
> +       First region contains the register location.
> +       Regions 2 to 4 respectively contain the data, command,
> +       and address space for CS0.
> +       Regions 5 to 7 contain the same areas for CS1.
> +- interrupts: The interrupt number
> +- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
> +- clocks: Use common clock framework

How many? 'common clock framework' is a Linux thing, not part of 
bindings.

> +
> +Optional properties:
> +- resets: Reference to a reset controller asserting the FMC controller
> +- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
> +- dma-names: Must be "tx", "rx" and "ecc"
> +
> +Optional children nodes:
> +Children nodes represent the available NAND chips.
> +
> +Optional properties:
> +- nand-on-flash-bbt: see nand.txt
> +- nand-ecc-strength: see nand.txt
> +- nand-ecc-step-size: see nand.txt
> +
> +The following ECC strength and step size are currently supported:
> + - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
> + - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
> + - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8) (default)
> +
> +Example:
> +
> +	fmc: nand-controller@58002000 {
> +		compatible = "st,stm32mp15-fmc2";
> +		reg = <0x58002000 0x1000>,
> +		      <0x80000000 0x1000>,
> +		      <0x88010000 0x1000>,
> +		      <0x88020000 0x1000>,
> +		      <0x81000000 0x1000>,
> +		      <0x89010000 0x1000>,
> +		      <0x89020000 0x1000>;
> +		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&rcc FMC_K>;
> +		resets = <&rcc FMC_R>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fmc_pins_a>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-on-flash-bbt;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> -- 
> 1.9.1
> 

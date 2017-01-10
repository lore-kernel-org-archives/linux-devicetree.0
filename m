From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding documentation
Date: Mon, 9 Jan 2017 23:36:05 -0600
Message-ID: <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, michals@xilinx.com, kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote:
> This patch adds the dts binding document for arasan nand flash
> controller.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
> Changes in v7:
> - Corrected the acronyms those should be in caps 
> changes in v6:
> - Removed num-cs property
> - Separated nandchip from nand controller
> changes in v5:
> - None
> Changes in v4:
> - Added num-cs property
> - Added clock support
> Changes in v3:
> - None
> Changes in v2:
> - None
> ---
>  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> new file mode 100644
> index 0000000..f20adfc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> @@ -0,0 +1,38 @@
> +Arasan NAND Flash Controller with ONFI 3.1 support
> +
> +Required properties:
> +- compatible: Should be "arasan,nfc-v3p10"

Needs a note that it must also have an SoC specific compatible string.

> +- reg: Memory map for module access
> +- interrupt-parent: Interrupt controller the interrupt is routed through
> +- interrupts: Should contain the interrupt for the device
> +- clock-name: List of input clocks - "clk_sys", "clk_flash"

clk_ is redundant.

> +	      (See clock bindings for details)
> +- clocks: Clock phandles (see clock bindings for details)
> +
> +Optional properties:
> +- arasan,has-mdma: Enables DMA support
> +
> +For NAND partition information please refer the below file
> +Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +	nand0: nand@ff100000 {
> +		compatible = "arasan,nfc-v3p10"
> +		reg = <0x0 0xff100000 0x1000>;
> +		clock-name = "clk_sys", "clk_flash"
> +		clocks = <&misc_clk &misc_clk>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <0 14 4>;
> +		arasan,has-mdma;
> +		#address-cells = <1>;
> +		#size-cells = <0>
> +
> +		nand@0 {
> +			reg = <0>
> +			partition@0 {
> +				label = "filesystem";
> +				reg = <0x0 0x0 0x1000000>;
> +			};
> +			(...)
> +		};
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

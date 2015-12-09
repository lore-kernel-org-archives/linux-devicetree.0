From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH linux-next 4/5] Documentation: atmel-quadspi: add binding
 file for Atmel QSPI driver
Date: Tue, 8 Dec 2015 21:16:23 -0600
Message-ID: <20151209031623.GA2826@rob-hp-laptop>
References: <cover.1449494420.git.cyrille.pitchen@atmel.com>
 <caec561f882521b3896530404ecb2bbad9950435.1449494420.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <caec561f882521b3896530404ecb2bbad9950435.1449494420.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com, marex@denx.de, vigneshr@ti.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 03:09:13PM +0100, Cyrille Pitchen wrote:
> This patch documents the DT bindings for the driver of the Atmel QSPI
> controller embedded inside sama5d2x SoCs.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/mtd/atmel-quadspi.txt      | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> new file mode 100644
> index 000000000000..e81f20f9faf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
> @@ -0,0 +1,32 @@
> +* Atmel Quad Serial Peripheral Interface (QSPI)
> +
> +Required properties:
> +- compatible:     Should be "atmel,sama5d2-qspi".
> +- reg:            Should contain the locations and lengths of the base registers
> +                  and the mapped memory.
> +- reg-names:      Should contain the resource reg names:
> +                  - qspi_base: configuration register address space
> +                  - qspi_mmap: memory mapped address space
> +- interrupts:     Should contain the interrupt for the device.
> +- clocks:         The phandle of the clock needed by the QSPI controller.
> +- #address-cells: Should be <1>.
> +- #size-cells:    Should be <0>.
> +
> +Example:
> +
> +spi@f0020000 {
> +	compatible = "atmel,sama5d2-qspi";
> +	reg = <0xf0020000 0x100>, <0xd0000000 0x8000000>;
> +	reg-names = "qpsi_base", "qspi_mmap";
> +	interrupts = <52 IRQ_TYPE_LEVEL_HIGH 7>;
> +	clocks = <&spi0_clk>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi0_default>;
> +	status = "okay";
> +
> +	m25p80@0 {
> +		...
> +	};
> +};
> -- 
> 1.8.2.2
> 

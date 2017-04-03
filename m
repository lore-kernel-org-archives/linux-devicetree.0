From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Mon, 3 Apr 2017 11:57:35 -0500
Message-ID: <20170403165735.sopfhlxzefkzrbfh@rob-hp-laptop>
References: <1490979724-10905-1-git-send-email-ludovic.Barre@st.com>
 <1490979724-10905-2-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490979724-10905-2-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 31, 2017 at 07:02:03PM +0200, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch adds documentation of device tree bindings for the STM32
> QSPI controller.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> new file mode 100644
> index 0000000..95a8ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> @@ -0,0 +1,45 @@
> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
> +
> +Required properties:
> +- compatible: should be "st,stm32f469-qspi"
> +- reg: contains the register location and length.
> +  (optional) the memory mapping address and length

Why optional? Either the h/w has it or doesn't. If some chips don't, 
they should have a different compatible string.

> +- reg-names: list of the names corresponding to the previous register
> +  Should contain "qspi" to register location
> +  (optional) "qspi_mm" if read in memory map mode (improve read throughput)
> +- interrupts: should contain the interrupt for the device
> +- clocks: the phandle of the clock needed by the QSPI controller
> +- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
> +
> +Optional properties:
> +- resets: must contain the phandle to the reset controller.
> +
> +A spi flash must be a child of the nor_flash node and could have some
> +properties. Also see jedec,spi-nor.txt.
> +
> +Required properties:
> +- reg: chip-Select number (QSPI controller may connect 2 nor flashes)
> +- spi-max-frequency: max frequency of spi bus
> +
> +Optional property:
> +- spi-rx-bus-width: the bus width (number of data wires)

Just "see ../spi/spi-bus.txt" for the description

> +
> +Example:
> +
> +qspi: qspi@a0001000 {

spi@...

> +	compatible = "st,stm32f469-qspi";
> +	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
> +	reg-names = "qspi", "qspi_mm";
> +	interrupts = <91>;
> +	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
> +	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_qspi0>;
> +
> +	flash@0 {
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <108000000>;
> +		...
> +	};
> +};
> -- 
> 2.7.4
> 

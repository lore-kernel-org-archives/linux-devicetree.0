From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: edac: arm-dmc520.txt
Date: Thu, 23 May 2019 17:58:41 +0100
Message-ID: <20190523165841.GD7523@lakrids.cambridge.arm.com>
References: <CY1PR0401MB1244062C1738B09D6100F202860A0@CY1PR0401MB1244.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CY1PR0401MB1244062C1738B09D6100F202860A0@CY1PR0401MB1244.namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lei Wang <leiwang_git@outlook.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lewan@microsoft.com" <lewan@microsoft.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 16, 2019 at 02:35:47AM +0000, Lei Wang wrote:
> From: Lei Wang <leiwang_git@outlook.com>
> 
> This is the device tree bindings for new EDAC driver dmc520_edac.c.
> 
> Signed-off-by: Lei Wang <leiwang_git@outlook.com>
> ---
>  .../devicetree/bindings/edac/arm-dmc520.txt        | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> new file mode 100644
> index 0000000..71e7aa3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> @@ -0,0 +1,26 @@
> +* ARM DMC-520 EDAC node
> +
> +Required properties:
> +- compatible		: "brcm,dmc-520", "arm,dmc-520".
> +- reg			: Address range of the DMC-520 registers.
> +- interrupts		: DMC-520 interrupt numbers. The example below specifies
> +			  two interrupt lines for dram_ecc_errc_int and
> +			  dram_ecc_errd_int.
> +- interrupt-config	: This is an array of interrupt masks. For each of the
> +			  above interrupt line, add one interrupt mask element to
> +			  it. That is, there is a 1:1 mapping from each interrupt
> +			  line to an interrupt mask. An interrupt mask can represent
> +			  multiple interrupts being enabled. Refer to interrupt_control
> +			  register in DMC-520 TRM for interrupt mapping. In the example
> +			  below, the interrupt configuration enables dram_ecc_errc_int
> +			  and dram_ecc_errd_int. And each interrupt is connected to
> +			  a separate interrupt line.

Generally we use interrupt-names to distinguish interrupts.

Do you really have arbitary subsets of lines muxed together?

Thanks,
Mark.

> +
> +Example:
> +
> +dmc0: dmc@200000 {
> +	compatible = "brcm,dmc-520", "arm,dmc-520";
> +	reg = <0x200000 0x80000>;
> +	interrupts = <0x0 0x349 0x4>, <0x0 0x34B 0x4>;
> +	interrupt-config = <0x4>, <0x8>;
> +};
> -- 
> 2.7.4
> 

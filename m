From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: edac: arm-dmc520.txt
Date: Thu, 23 May 2019 17:31:44 +0100
Message-ID: <279a6f66-c889-791b-09b0-9769e5e0aa87@arm.com>
References: <CY1PR0401MB1244062C1738B09D6100F202860A0@CY1PR0401MB1244.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY1PR0401MB1244062C1738B09D6100F202860A0@CY1PR0401MB1244.namprd04.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lei Wang <leiwang_git@outlook.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "lewan@microsoft.com" <lewan@microsoft.com>
List-Id: devicetree@vger.kernel.org

Hi Lei,

On 16/05/2019 03:35, Lei Wang wrote:
> From: Lei Wang <leiwang_git@outlook.com>
> 
> This is the device tree bindings for new EDAC driver dmc520_edac.c.

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
> +			  multiple interrupts being enabled.

Cunning!


> +			  Refer to interrupt_control
> +			  register in DMC-520 TRM for interrupt mapping. In the example
> +			  below, the interrupt configuration enables dram_ecc_errc_int
> +			  and dram_ecc_errd_int. And each interrupt is connected to
> +			  a separate interrupt line.
> +
> +Example:
> +
> +dmc0: dmc@200000 {
> +	compatible = "brcm,dmc-520", "arm,dmc-520";
> +	reg = <0x200000 0x80000>;
> +	interrupts = <0x0 0x349 0x4>, <0x0 0x34B 0x4>;
> +	interrupt-config = <0x4>, <0x8>;
> +};
> 

For what its worth:
Acked-by: James Morse <james.morse@arm.com>


Thanks,

James

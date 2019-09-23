From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v6 1/2] dt-bindings: edac: arm-dmc520.txt
Date: Mon, 23 Sep 2019 18:10:15 +0200
Message-ID: <20190923161015.GI15355@zn.tnic>
References: <BY5PR04MB6599EAA659A53B2331CB812586890@BY5PR04MB6599.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BY5PR04MB6599EAA659A53B2331CB812586890@BY5PR04MB6599.namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lei Wang <leiwang_git@outlook.com>
Cc: "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>, "scott.branden@broadcom.com" <scott.branden@broadcom.com>, "yuqing.shen@broadcom.com" <yuqing.shen@broadcom.com>, "ray.jui@broadcom.com" <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 06:37:00PM +0000, Lei Wang wrote:
> This is the device tree bindings for new EDAC driver dmc520_edac.c.
> 
> Signed-off-by: Lei Wang <leiwang_git@outlook.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> 
> ---
>     No change in v6.
> ---
>  .../devicetree/bindings/edac/arm-dmc520.txt   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> new file mode 100644
> index 000000000000..71e7aa32971a
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

Still needs a DT person ACK.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Return-Path: <SRS0=pUvx=O2=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 06/17] arm64: dts: renesas: r8a774c0: Add MSIOF nodes
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f6834dd2-7a2d-5ca9-0961-2c992ce22002@cogentembedded.com>
Date: Mon, 17 Dec 2018 19:26:54 +0300
MIME-Version: 1.0
In-Reply-To: <1544780260-27590-7-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

On 12/14/2018 12:37 PM, Fabrizio Castro wrote:

> Add the device nodes for all MSIOF SPI controllers on RZ/G2E SoC.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 62 +++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 9532d29..9bd66b1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -855,6 +855,68 @@
>  			status = "disabled";
>  		};
>  
> +		msiof0: spi@e6e90000 {
> +			compatible = "renesas,msiof-r8a774c0",
> +				     "renesas,rcar-gen3-msiof";
> +			reg = <0 0xe6e90000 0 0x0064>;

   Do we really need the leading zeros in the size cells?

> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 211>;
> +			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
> +			       <&dmac2 0x41>, <&dmac2 0x40>;
> +			dma-names = "tx", "rx", "tx", "rx";
> +			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
> +			resets = <&cpg 211>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
[...]

   Same question for the other instances of MSIOF.

MBR, Sergei

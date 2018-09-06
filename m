Return-Path: <SRS0=WxUd=LU=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add CMT support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <61a54423-d59e-ce71-a226-992b96bc084c@cogentembedded.com>
Message-ID: <b42dc7d9-77e6-005f-c4b1-f944a9c8cc18@cogentembedded.com>
Date: Thu, 6 Sep 2018 21:43:36 +0300
MIME-Version: 1.0
In-Reply-To: <61a54423-d59e-ce71-a226-992b96bc084c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 09/06/2018 08:02 PM, Sergei Shtylyov wrote:

> Describe CMTs in the R8A779{7|8}0 device trees.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'renesas-devel-20180906-v4.19-rc2' branch of
> Simon Horman's 'renesas.git' repo.
> 
> The R8A779{7|8}0 CMT DT binding updates have been posted yesterday...
> 
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   66 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   66 ++++++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -239,6 +239,72 @@
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
>  
> +		cmt0: timer@e60f0000 {
> +			compatible = "renesas,r8a77980-cmt0",
> +				     "renesas,rcar-gen3-cmt0";
> +			reg = <0 0xe60f0000 0 0x1004>;
> +			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 303>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> +			status = "disabled";
> +		};

  "resets"! I forgot about them again... :-(

MBR, Sergei

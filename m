Return-Path: <SRS0=JUtF=N6=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d3d1703e-6da8-7732-aaf2-3fd195e028ca@linaro.org>
Date: Mon, 19 Nov 2018 10:36:26 +0100
MIME-Version: 1.0
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On 26/10/2018 10:25, Biju Das wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
> 
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> are working fine.The clocksource_switch asynchronous test is failing due
> to inconsistency-check failure on "arch_sys_counter".
> 
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
> 
> Has any one noticed this issue?

Were you able to narrow down the issue?

> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1ec6aaa..d62febd0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -401,6 +401,76 @@
>  			reg = <0 0xe6060000 0 0x50c>;
>  		};
>  
> +		cmt0: timer@e60f0000 {
> +			compatible = "renesas,r8a7796-cmt0",
> +				     "renesas,rcar-gen3-cmt0";
> +			reg = <0 0xe60f0000 0 0x1004>;
> +			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 303>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 303>;
> +			status = "disabled";
> +		};
> +
> +		cmt1: timer@e6130000 {
> +			compatible = "renesas,r8a7796-cmt1",
> +				     "renesas,rcar-gen3-cmt1";
> +			reg = <0 0xe6130000 0 0x1004>;
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 302>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 302>;
> +			status = "disabled";
> +		};
> +
> +		cmt2: timer@e6140000 {
> +			compatible = "renesas,r8a7796-cmt1",
> +				     "renesas,rcar-gen3-cmt1";
> +			reg = <0 0xe6140000 0 0x1004>;
> +			interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 301>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 301>;
> +			status = "disabled";
> +		};
> +
> +		cmt3: timer@e6148000 {
> +			compatible = "renesas,r8a7796-cmt1",
> +				     "renesas,rcar-gen3-cmt1";
> +			reg = <0 0xe6148000 0 0x1004>;
> +			interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 300>;
> +			clock-names = "fck";
> +			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +			resets = <&cpg 300>;
> +			status = "disabled";
> +		};
> +
>  		cpg: clock-controller@e6150000 {
>  			compatible = "renesas,r8a7796-cpg-mssr";
>  			reg = <0 0xe6150000 0 0x1000>;
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

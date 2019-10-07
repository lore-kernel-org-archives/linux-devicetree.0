From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v2 2/2] arm64: dts: ls1028a: Update the DT node definition for
 dpclk
Date: Mon, 7 Oct 2019 20:35:14 +0800
Message-ID: <20191007123512.GM7150@dragon>
References: <20190920083419.5092-1-wen.he_1@nxp.com>
 <20190920083419.5092-2-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920083419.5092-2-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: linux-devel@linux.nxdi.nxp.com, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 04:34:19PM +0800, Wen He wrote:
> Update DT node name clock-controller to clock-display,

The node name clock-controller is so good, and I do not understand why
you need to change it.

Shawn

> also change
> the property #clock-cells value to zero.
> 
> This update according the feedback of the Display output interface
> clock driver upstream.
> 
> Link: https://lore.kernel.org/patchwork/patch/1113832/
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 51fa8f57fdac..db1e186352d8 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -79,10 +79,10 @@
>  		clock-output-names = "phy_27m";
>  	};
>  
> -	dpclk: clock-controller@f1f0000 {
> +	dpclk: clock-display@f1f0000 {
>  		compatible = "fsl,ls1028a-plldig";
>  		reg = <0x0 0xf1f0000 0x0 0xffff>;
> -		#clock-cells = <1>;
> +		#clock-cells = <0>;
>  		clocks = <&osc_27m>;
>  	};
>  
> @@ -665,7 +665,7 @@
>  		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
>  			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "DE", "SE";
> -		clocks = <&dpclk 0>, <&clockgen 2 2>, <&clockgen 2 2>,
> +		clocks = <&dpclk>, <&clockgen 2 2>, <&clockgen 2 2>,
>  			 <&clockgen 2 2>;
>  		clock-names = "pxlclk", "mclk", "aclk", "pclk";
>  		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> -- 
> 2.17.1
> 

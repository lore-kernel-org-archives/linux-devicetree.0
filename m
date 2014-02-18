From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND v11 1/2] ARM: dts: vf610: Add eDMA node
Date: Tue, 18 Feb 2014 11:45:48 +0800
Message-ID: <20140218034546.GE15716@S2101-09.ap.freescale.net>
References: <1392689832-17011-1-git-send-email-b35083@freescale.com>
 <1392689832-17011-2-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392689832-17011-2-git-send-email-b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 10:17:11AM +0800, Jingchang Lu wrote:
> Signed-off-by: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Applied, thanks.

Shawn

> ---
> no changes in v10 ~ v11.
> 
> changes in v9:
>  remove include/dt-bindings/dma/vf610-edma.h, the request source ID
>  is the same as SoC's reference manual.
> 
> changes in v8:
>  describe dmamux info in edma node to avoid confusion.
>  change eDMA requst source macro definitions.
> 
>  changes in v7:
>  fix dmamux2 and dmamux3 register number.
> 
>  no changes in v2 ~ v6.
> 
>  arch/arm/boot/dts/vf610.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610.dtsi b/arch/arm/boot/dts/vf610.dtsi
> index 48dbfe5..8febb29f 100644
> --- a/arch/arm/boot/dts/vf610.dtsi
> +++ b/arch/arm/boot/dts/vf610.dtsi
> @@ -88,6 +88,21 @@
>  				arm,tag-latency = <2 2 2>;
>  			};
>  
> +			edma0: dma-controller@40018000 {
> +				#dma-cells = <2>;
> +				compatible = "fsl,vf610-edma";
> +				reg = <0x40018000 0x2000>,
> +					<0x40024000 0x1000>,
> +					<0x40025000 0x1000>;
> +				interrupts = <0 8 IRQ_TYPE_LEVEL_HIGH>,
> +						<0 9 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "edma-tx", "edma-err";
> +				dma-channels = <32>;
> +				clock-names = "dmamux0", "dmamux1";
> +				clocks = <&clks VF610_CLK_DMAMUX0>,
> +					<&clks VF610_CLK_DMAMUX1>;
> +			};
> +
>  			uart0: serial@40027000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x40027000 0x1000>;
> @@ -263,6 +278,21 @@
>  			reg = <0x40080000 0x80000>;
>  			ranges;
>  
> +			edma1: dma-controller@40098000 {
> +				#dma-cells = <2>;
> +				compatible = "fsl,vf610-edma";
> +				reg = <0x40098000 0x2000>,
> +					<0x400a1000 0x1000>,
> +					<0x400a2000 0x1000>;
> +				interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>,
> +						<0 11 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "edma-tx", "edma-err";
> +				dma-channels = <32>;
> +				clock-names = "dmamux0", "dmamux1";
> +				clocks = <&clks VF610_CLK_DMAMUX2>,
> +					<&clks VF610_CLK_DMAMUX3>;
> +			};
> +
>  			uart4: serial@400a9000 {
>  				compatible = "fsl,vf610-lpuart";
>  				reg = <0x400a9000 0x1000>;
> -- 
> 1.8.0
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

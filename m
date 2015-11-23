From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: vf610: fix clock definition for SAI2
Date: Mon, 23 Nov 2015 11:04:05 +0800
Message-ID: <20151123030405.GC13744@tiger>
References: <1445141122-14183-1-git-send-email-stefan@agner.ch>
 <1445141122-14183-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445141122-14183-2-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, zidan.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 17, 2015 at 09:05:21PM -0700, Stefan Agner wrote:
> So far, only the bus clock has been assigned, but in reality the
> SAI IP has for clock inputs. The driver has been updated to

s/for/four

Will fix it up when applying.

Shawn

> make use of the additional clock inputs by c3ecef21c3f2 ("ASoC:
> fsl_sai: add sai master mode support"). Due to a bug in the
> clock tree, the audio clock has been enabled none the less by
> the specified bus clock (see "ARM: imx: clk-vf610: fix SAI
> clock tree"), which made master mode even without the proper
> clock assigned working.
> 
> This patch completes the clock definition for SAI2. On Vybrid,
> only two MCLK out of the four options are available (the first
> being the bus clock itself). See chapter 8.10.1.2.3 of the
> Vybrid Reference manual ("SAI transmitter and receiver options
> for MCLK selection"). Note: The audio clocks are only required
> in master mode.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 6865137..c2a4d1c 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -178,8 +178,10 @@
>  				compatible = "fsl,vf610-sai";
>  				reg = <0x40031000 0x1000>;
>  				interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clks VF610_CLK_SAI2>;
> -				clock-names = "sai";
> +				clocks = <&clks VF610_CLK_SAI2>,
> +					<&clks VF610_CLK_SAI2_DIV>,
> +					<&clks 0>, <&clks 0>;
> +				clock-names = "bus", "mclk1", "mclk2", "mclk3";
>  				dma-names = "tx", "rx";
>  				dmas = <&edma0 0 21>,
>  					<&edma0 0 20>;
> -- 
> 2.6.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1028a: fix watchdog device node
Date: Fri, 17 May 2019 10:37:30 +0800
Message-ID: <20190517023728.GA15856@dragon>
References: <20190509070657.18281-1-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190509070657.18281-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: leoyang.li@nxp.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Ying-22455 <ying.zhang22455@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 09, 2019 at 03:06:57PM +0800, Chuanhua Han wrote:
> ls1028a platform uses sp805 watchdog, and use 1/16 platform clock as
> timer clock, this patch fix device tree node.
> 
> Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index b04581249f0b..1510b1858246 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -285,13 +285,18 @@
>  			#interrupt-cells = <2>;
>  		};
>  
> -		wdog0: watchdog@23c0000 {
> -			compatible = "fsl,ls1028a-wdt", "fsl,imx21-wdt";
> -			reg = <0x0 0x23c0000 0x0 0x10000>;
> -			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clockgen 4 1>;
> -			big-endian;
> -			status = "disabled";
> +		cluster1_core0_watchdog: wdt@c000000 {

Keep 'watchdog' as the node name, and keep nodes sort in unit-address.

Shawn

> +			compatible = "arm,sp805", "arm,primecell";
> +			reg = <0x0 0xc000000 0x0 0x1000>;
> +			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
> +			clock-names = "apb_pclk", "wdog_clk";
> +		};
> +
> +		cluster1_core1_watchdog: wdt@c010000 {
> +			compatible = "arm,sp805", "arm,primecell";
> +			reg = <0x0 0xc010000 0x0 0x1000>;
> +			clocks = <&clockgen 4 15>, <&clockgen 4 15>;
> +			clock-names = "apb_pclk", "wdog_clk";
>  		};
>  
>  		sata: sata@3200000 {
> -- 
> 2.17.1
> 

From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: ls1088a: Fix incorrect I2C clock divider
Date: Mon, 12 Aug 2019 16:17:24 +0200
Message-ID: <20190812141722.GJ27041@X250>
References: <20190806084223.23543-1-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190806084223.23543-1-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 04:42:20PM +0800, Chuanhua Han wrote:
> Ls1088a platform, the i2c input clock is actually platform pll CLK / 8
> (this is the hardware connection), other clock divider can not get the
> correct i2c clock, resulting in the output of SCL pin clock is not
> accurate.
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

@Leo, looks good?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 20f5ebd..30b760e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -324,7 +324,7 @@
>  			#size-cells = <0>;
>  			reg = <0x0 0x2000000 0x0 0x10000>;
>  			interrupts = <0 34 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clockgen 4 3>;
> +			clocks = <&clockgen 4 7>;
>  			status = "disabled";
>  		};
>  
> @@ -334,7 +334,7 @@
>  			#size-cells = <0>;
>  			reg = <0x0 0x2010000 0x0 0x10000>;
>  			interrupts = <0 34 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clockgen 4 3>;
> +			clocks = <&clockgen 4 7>;
>  			status = "disabled";
>  		};
>  
> @@ -344,7 +344,7 @@
>  			#size-cells = <0>;
>  			reg = <0x0 0x2020000 0x0 0x10000>;
>  			interrupts = <0 35 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clockgen 4 3>;
> +			clocks = <&clockgen 4 7>;
>  			status = "disabled";
>  		};
>  
> @@ -354,7 +354,7 @@
>  			#size-cells = <0>;
>  			reg = <0x0 0x2030000 0x0 0x10000>;
>  			interrupts = <0 35 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clockgen 4 3>;
> +			clocks = <&clockgen 4 7>;
>  			status = "disabled";
>  		};
>  
> -- 
> 2.9.5
> 

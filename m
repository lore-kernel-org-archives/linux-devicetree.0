From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 3/4] arm64: dts: hisilicon: Source SoC clock for UART6
Date: Thu, 29 Nov 2018 15:22:38 +0000
Message-ID: <5C00043E.2070607@hisilicon.com>
References: <20180921060103.21370-1-manivannan.sadhasivam@linaro.org>
 <20180921060103.21370-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921060103.21370-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On 2018/9/21 7:01, Manivannan Sadhasivam wrote:
> Remove fixed clock and source SoC clock for UART6 for
> HiSilicon Hi3670 SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> index 8a0ee4b08886..34a2f0dbc6f7 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> @@ -187,17 +187,12 @@
>  			#clock-cells = <1>;
>  		};
>  
> -		uart6_clk: clk_19_2M {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <19200000>;
> -		};
> -
>  		uart6: serial@fff32000 {
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfff32000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&uart6_clk &uart6_clk>;
> +			clocks = <&crg_ctrl HI3670_CLK_UART6>,
> +				 <&crg_ctrl HI3670_PCLK>;
>  			clock-names = "uartclk", "apb_pclk";
>  			status = "disabled";
>  		};
> 

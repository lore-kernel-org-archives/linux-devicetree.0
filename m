From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 6/8 v2] arm64: dts: hi3660: Add dma to uart nodes
Date: Sat, 5 Jan 2019 09:19:04 +0530
Message-ID: <20190105034904.GD2477@Mani-XPS-13-9360>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <1546635388-13795-7-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546635388-13795-7-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi John,

On Fri, Jan 04, 2019 at 12:56:26PM -0800, John Stultz wrote:
> Try to add DMA support to the uart nodes following
> the assignments made in the dts from the victoria vendor kernel
> here:
> https://consumer.huawei.com/en/opensource/detail/?siteCode=worldwide&keywords=p10&fileType=openSourceSoftware&pageSize=10&curPage=1
> 
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 20ae40d..aaa2b04 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -466,6 +466,8 @@
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf02000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-names = "rx", "tx";
> +			dmas =  <&dma0 0 &dma0 1>;

Usage of DMA channel 0 contradicts with the description provided in
patch, "dma: k3dma: Add support to dma_avail_chan".

Thanks,
Mani

>  			clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
>  				 <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "uartclk", "apb_pclk";
> @@ -478,6 +480,8 @@
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf00000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-names = "rx", "tx";
> +			dmas =  <&dma0 2 &dma0 3>;
>  			clocks = <&crg_ctrl HI3660_CLK_GATE_UART1>,
>  				 <&crg_ctrl HI3660_CLK_GATE_UART1>;
>  			clock-names = "uartclk", "apb_pclk";
> @@ -490,6 +494,8 @@
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf03000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-names = "rx", "tx";
> +			dmas =  <&dma0 4 &dma0 5>;
>  			clocks = <&crg_ctrl HI3660_CLK_GATE_UART2>,
>  				 <&crg_ctrl HI3660_PCLK>;
>  			clock-names = "uartclk", "apb_pclk";
> @@ -514,6 +520,8 @@
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf01000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-names = "rx", "tx";
> +			dmas =  <&dma0 6 &dma0 7>;
>  			clocks = <&crg_ctrl HI3660_CLK_GATE_UART4>,
>  				 <&crg_ctrl HI3660_CLK_GATE_UART4>;
>  			clock-names = "uartclk", "apb_pclk";
> @@ -526,6 +534,8 @@
>  			compatible = "arm,pl011", "arm,primecell";
>  			reg = <0x0 0xfdf05000 0x0 0x1000>;
>  			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-names = "rx", "tx";
> +			dmas =  <&dma0 8 &dma0 9>;
>  			clocks = <&crg_ctrl HI3660_CLK_GATE_UART5>,
>  				 <&crg_ctrl HI3660_CLK_GATE_UART5>;
>  			clock-names = "uartclk", "apb_pclk";
> -- 
> 2.7.4
> 

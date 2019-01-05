From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 7/8 v2] arm64: dts: hi3660: Add hisi asp dma device
Date: Sat, 5 Jan 2019 09:20:18 +0530
Message-ID: <20190105035018.GE2477@Mani-XPS-13-9360>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <1546635388-13795-8-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546635388-13795-8-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Youlin Wang <wwx575822@notesmail.huawei.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 04, 2019 at 12:56:27PM -0800, John Stultz wrote:
> From: Youlin Wang <wwx575822@notesmail.huawei.com>
> 
> Add asp-dma device to hi3660 dts
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
> Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
> Signed-off-by: Tanglei Han <hantanglei@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> v2: Removed undocumented bindings
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index aaa2b04..df4e96d 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -569,6 +569,16 @@
>  			dma-type = "hi3660_dma";
>  		};
>  
> +		asp_dmac: dma-controller@e804b000 {
> +			compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
> +			reg = <0x0 0xe804b000 0x0 0x1000>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +			dma-requests = <32>;
> +			interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "asp_dma_irq";
> +		};
> +
>  		rtc0: rtc@fff04000 {
>  			compatible = "arm,pl031", "arm,primecell";
>  			reg = <0x0 0Xfff04000 0x0 0x1000>;
> -- 
> 2.7.4
> 

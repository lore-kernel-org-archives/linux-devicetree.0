From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH][RESEND] arm64: dts: hikey: Add DMA entries for Bluetooth
 UART
Date: Fri, 1 Feb 2019 16:37:43 +0000
Message-ID: <87f70896-70b4-48c9-f189-fd8e387f2dcc@hisilicon.com>
References: <1548275437-6022-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548275437-6022-1-git-send-email-john.stultz@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ryan Grachek <ryan@edited.us>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi John,

On 1/23/2019 8:30 PM, John Stultz wrote:
> Add dma0 references for bluetooth uart to enable dma
> for bt transfers.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index aec9e37..fa15a08 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -319,6 +319,8 @@
>  			clock-names = "uartclk", "apb_pclk";
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&uart1_pmx_func &uart1_cfg_func1 &uart1_cfg_func2>;
> +			dmas = <&dma0 8 &dma0 9>;
> +			dma-names = "rx", "tx";
>  			status = "disabled";
>  		};
>  
> 

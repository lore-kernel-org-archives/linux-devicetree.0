From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 16/17] arm64: dts: qcom: qcs404: Use BAM DMA for
 serial uart2
Date: Mon, 5 Nov 2018 11:12:29 -0800
Message-ID: <20181105191229.GU2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-17-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-17-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> We can use BAM DAM for serial UART data transfers, so add it
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 88e04a0ee67f..23a16b7c43b6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -273,6 +273,8 @@
>  			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp1_dma 5>, <&blsp1_dma 4>;
> +			dma-names = "rx", "tx";
>  			status = "okay";
>  		};
>  
> -- 
> 2.14.4
> 

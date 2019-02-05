From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: Fix MSI IRQ type
Date: Tue, 5 Feb 2019 10:13:26 -0800
Message-ID: <20190205181326.GA23363@builder>
References: <20190124130047.8071-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124130047.8071-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 24 Jan 05:00 PST 2019, Niklas Cassel wrote:

> The databook clearly states that the MSI IRQ (msi_ctrl_int) is a level
> triggered interrupt.
> 
> The msi_ctrl_int will be high for as long as any MSI status bit is set,
> thus the IRQ type should be set to IRQ_TYPE_LEVEL_HIGH, causing the
> IRQ handler to keep getting called, as long as any MSI status bit is set.
> 
> A git grep shows that ipq4019 is the only SoC using snps,dw-pcie that has
> configured this IRQ incorrectly.
> 
> Not having the correct IRQ type defined will cause us to lose interrupts,
> which in turn causes timeouts in the PCIe endpoint drivers.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 19635f91e2c4..48b3cb474ba0 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -398,7 +398,7 @@
>  			ranges = <0x81000000 0 0x40200000 0x40200000 0 0x00100000
>  				  0x82000000 0 0x40300000 0x40300000 0 0x400000>;
>  
> -			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "msi";
>  			#interrupt-cells = <1>;
>  			interrupt-map-mask = <0 0 0 0x7>;
> -- 
> 2.20.1
> 

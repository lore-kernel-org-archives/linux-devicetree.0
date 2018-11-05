From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 11/17] arm64: dts: qcom: pms405: add gpios
Date: Mon, 5 Nov 2018 11:08:02 -0800
Message-ID: <20181105190802.GQ2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-12-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-12-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> Add the GPIOs present on PMS405 chip.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index cdb4547c998b..18410d9f0f8f 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -17,5 +17,21 @@
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
>  		};
> +
> +		pms405_gpios: gpios@c000 {
> +			compatible = "qcom,pms405-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0 0xc1 0 IRQ_TYPE_NONE>,
> +				<0 0xc2 0 IRQ_TYPE_NONE>,
> +				<0 0xc3 0 IRQ_TYPE_NONE>,
> +				<0 0xc4 0 IRQ_TYPE_NONE>,
> +				<0 0xc5 0 IRQ_TYPE_NONE>,
> +				<0 0xc6 0 IRQ_TYPE_NONE>,
> +				<0 0xc7 0 IRQ_TYPE_NONE>,
> +				<0 0xca 0 IRQ_TYPE_NONE>,
> +				<0 0xcb 0 IRQ_TYPE_NONE>;

Is there a reason why gpio 1, 8 and 9 are omitted from this list?

Regards,
Bjorn

> +		};
>  	};
>  };
> -- 
> 2.14.4
> 

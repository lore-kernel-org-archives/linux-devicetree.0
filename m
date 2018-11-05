From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 10/17] arm64: dts: qcom: pms405: add rtc node
Date: Mon, 5 Nov 2018 11:04:40 -0800
Message-ID: <20181105190440.GP2523@minitux>
References: <20181105154529.7614-1-vkoul@kernel.org>
 <20181105154529.7614-11-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105154529.7614-11-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 05 Nov 07:45 PST 2018, Vinod Koul wrote:

> RTC is found on PMIC PMS405 and is same as other PMIC used, so add the
> rtc node with compatible as qcom,pm8941-rtc
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index 8a585180f102..cdb4547c998b 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -11,5 +11,11 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		rtc@6000 {
> +			compatible = "qcom,pm8941-rtc";
> +			reg = <0x6000>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> +		};
>  	};
>  };
> -- 
> 2.14.4
> 

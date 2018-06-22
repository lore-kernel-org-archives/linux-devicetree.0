From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: sdm845: Add rpmh-clk node
Date: Fri, 22 Jun 2018 10:05:01 -0700
Message-ID: <20180622170501.GF10336@builder>
References: <20180618215051.156270-1-dianders@chromium.org>
 <20180618215051.156270-2-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618215051.156270-2-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: andy.gross@linaro.org, sboyd@kernel.org, tdas@codeaurora.org, rplsssn@codeaurora.org, ilina@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Jun 14:50 PDT 2018, Douglas Anderson wrote:

> This adds the rpmh-clk node to sdm845 based on the examples in the
> bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> NOTE: to apply this patch cleanly, apply it atop:
>   arm64: dts: qcom: sdm845: Add I2C, SPI, and UART9 nodes
>   https://patchwork.kernel.org/patch/10462691/
> 
> Changes in v2: None
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 43a182fb42c9..00722b533a92 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  
> @@ -1001,6 +1002,11 @@
>  					  <SLEEP_TCS   3>,
>  					  <WAKE_TCS    3>,
>  					  <CONTROL_TCS 1>;
> +
> +			rpmhcc: clock-controller {
> +				compatible = "qcom,sdm845-rpmh-clk";
> +				#clock-cells = <1>;
> +			};
>  		};
>  
>  		intc: interrupt-controller@17a00000 {
> -- 
> 2.18.0.rc1.244.gcf134e6275-goog
> 

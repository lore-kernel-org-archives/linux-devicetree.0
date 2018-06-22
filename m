From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: sdm845: Add rpmh-rsc node
Date: Fri, 22 Jun 2018 10:04:02 -0700
Message-ID: <20180622170402.GE10336@builder>
References: <20180618215051.156270-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180618215051.156270-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: andy.gross@linaro.org, tdas@codeaurora.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, Will Deacon <will.deacon@arm.com>, ilina@codeaurora.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, rplsssn@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon 18 Jun 14:50 PDT 2018, Douglas Anderson wrote:

> This adds the rpmh-rsc node to sdm845 based on the examples in the
> bindings.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes in v2:
> - Fixed ordering of tcs-config as per Lina.
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index cd308b84bed7..43a182fb42c9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -984,6 +985,24 @@
>  			#mbox-cells = <1>;
>  		};
>  
> +		apps_rsc: rsc@179c0000 {
> +			label = "apps_rsc";
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x179c0000 0x10000>,
> +			      <0x179d0000 0x10000>,
> +			      <0x179e0000 0x10000>;
> +			reg-names = "drv-0", "drv-1", "drv-2";
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS  2>,
> +					  <SLEEP_TCS   3>,
> +					  <WAKE_TCS    3>,
> +					  <CONTROL_TCS 1>;
> +		};
> +
>  		intc: interrupt-controller@17a00000 {
>  			compatible = "arm,gic-v3";
>  			#address-cells = <1>;
> -- 
> 2.18.0.rc1.244.gcf134e6275-goog
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add rpmcc node
Date: Thu, 31 Jan 2019 03:11:13 +0100
Message-ID: <20190131021113.GA11855@centauri.lan>
References: <20190125181422.21434-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125181422.21434-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 10:14:22AM -0800, Bjorn Andersson wrote:
> Add the rpm clock controller node, to provide the low-noise baseband
> clock for the USB PHYs, among other things.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index b3be39e088db..d90decd00f5c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -3,6 +3,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> @@ -225,6 +226,11 @@
>  		rpm_requests: glink-channel {
>  			compatible = "qcom,rpm-qcs404";
>  			qcom,glink-channels = "rpm_requests";
> +
> +			rpmcc: clock-controller {
> +				compatible = "qcom,rpmcc-qcs404";
> +				#clock-cells = <1>;
> +			};
>  		};
>  	};
>  
> -- 
> 2.18.0
> 

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>

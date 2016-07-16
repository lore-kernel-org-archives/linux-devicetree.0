From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] arm: dts: apq8064: Add thermal zones, tsens and
 qfprom nodes
Date: Sat, 16 Jul 2016 15:10:32 -0500
Message-ID: <20160716201032.GA15946@rob-hp-laptop>
References: <1468306374-24153-1-git-send-email-rnayak@codeaurora.org>
 <1468306374-24153-3-git-send-email-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468306374-24153-3-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 12:22:51PM +0530, Rajendra Nayak wrote:
> TSENS is part of GCC, hence add TSENS properties as part of GCC node.
> Also add thermal zones and qfprom nodes.
> Update GCC bindings doc to mention the possibility of optional TSENS
> properties that can be part of GCC node.
> 
> Acked-by: Eduardo Valentin <edubezval@gmail.com>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |  18 ++++
>  arch/arm/boot/dts/qcom-apq8064.dtsi                | 119 +++++++++++++++++++++
>  2 files changed, 137 insertions(+)

[...]

> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 906bb81..e54c215 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -86,6 +86,108 @@
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpu-thermal0 {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +
> +			thermal-sensors = <&gcc 7>;
> +			coefficients = <1199 0>;
> +
> +			trips {
> +				cpu_alert0: trip@0 {

Compile this with W=1 and fix the warings.

> +					temperature = <75000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};

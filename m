From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: dts: msm8916: remove bogus argument to the cpu
 clock
Date: Fri, 2 Nov 2018 22:29:11 -0700
Message-ID: <20181103052911.GC1785@tuxbook-pro>
References: <20181103005734.15545-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181103005734.15545-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 02 Nov 17:57 PDT 2018, Niklas Cassel wrote:

> The apcs node has #clock-cells = <0>, which means that those who
> references it should specify 0 arguments.
> 
> The apcs reference in the cpu node incorrectly specifies an argument,
> remove this bogus argument.
> 
> Fixes: 65afdf458360 ("arm64: dts: qcom: msm8916: Add CPU frequency scaling support")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index d302d8d639a1..e4bfd47178b1 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -111,7 +111,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SPC>;
> -			clocks = <&apcs 0>;
> +			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  		};
> @@ -123,7 +123,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SPC>;
> -			clocks = <&apcs 0>;
> +			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  		};
> @@ -135,7 +135,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SPC>;
> -			clocks = <&apcs 0>;
> +			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  		};
> @@ -147,7 +147,7 @@
>  			next-level-cache = <&L2_0>;
>  			enable-method = "psci";
>  			cpu-idle-states = <&CPU_SPC>;
> -			clocks = <&apcs 0>;
> +			clocks = <&apcs>;
>  			operating-points-v2 = <&cpu_opp_table>;
>  			#cooling-cells = <2>;
>  		};
> -- 
> 2.19.1
> 

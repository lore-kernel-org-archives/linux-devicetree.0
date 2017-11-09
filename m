From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: msm8916-pins: remove assignments
 to bias-disable
Date: Thu, 9 Nov 2017 08:50:01 -0800
Message-ID: <20171109165001.GA28761@minitux>
References: <20171101175335.22123-1-damien.riegel@savoirfairelinux.com>
 <20171101175335.22123-3-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171101175335.22123-3-damien.riegel@savoirfairelinux.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Wed 01 Nov 10:53 PDT 2017, Damien Riegel wrote:

> Drop assignments to bias-disable as the documentation [1] states that
> this property doesn't take a value. Other occurrences of this property
> respect that.
> 
> [1] Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> index 4cb0b5834143..c67ad8ed8b60 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
> @@ -278,7 +278,7 @@
>  		pinconf {
>  			pins = "gpio6", "gpio7";
>  			drive-strength = <16>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> @@ -290,7 +290,7 @@
>  		pinconf {
>  			pins = "gpio6", "gpio7";
>  			drive-strength = <2>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> @@ -302,7 +302,7 @@
>  		pinconf {
>  			pins = "gpio14", "gpio15";
>  			drive-strength = <16>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> @@ -314,7 +314,7 @@
>  		pinconf {
>  			pins = "gpio14", "gpio15";
>  			drive-strength = <2>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> @@ -326,7 +326,7 @@
>  		pinconf {
>  			pins = "gpio22", "gpio23";
>  			drive-strength = <16>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> @@ -338,7 +338,7 @@
>  		pinconf {
>  			pins = "gpio22", "gpio23";
>  			drive-strength = <2>;
> -			bias-disable = <0>;
> +			bias-disable;
>  		};
>  	};
>  
> -- 
> 2.15.0
> 

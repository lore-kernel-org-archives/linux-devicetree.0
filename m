From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Tue, 29 Jan 2019 22:58:47 +0100
Message-ID: <32b8136d-3acb-66e9-948c-ee8903b91401@linaro.org>
References: <20190125232954.26166-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125232954.26166-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-Id: devicetree@vger.kernel.org

On 1/26/19 00:29, Bjorn Andersson wrote:
> PMS405 S5 was upstreamed without a voltage and PMS405 L3 is outside the
> acceptable range, causing PCIe to fail. Fix these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 579ddaf4f5fa..072061aa1b79 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -72,8 +72,8 @@
>  		};
>  
>  		vreg_s5_1p35: s5 {
> -			regulator-min-microvolt = <>;
> -			regulator-max-microvolt = <>;
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
>  		};
>  
>  		vreg_l1_1p3: l1 {
> @@ -87,7 +87,7 @@
>  		};
>  
>  		vreg_l3_1p05: l3 {
> -			regulator-min-microvolt = <976000>;
> +			regulator-min-microvolt = <1050000>;


the linear range for this regulator is
 - REGULATOR_LINEAR_RANGE(312000, 0, 127, 8000),

meaning that 1050000 is actually not a valid selectable value (ie, after
applying the above constrains 1056000 would be selected instead)

In order for a driver to be able to successfully request min = 1050000,
regulator-min-microvolt should be set to 1048000 (and 1056000 would be
applied)

the question is, should this property contain only hardware achievable
values? or should drivers only request hardware achievable values? the
way the constrains are implemented it has to be one of the two (I think
the former would be more intuitive - ie if the dts
regulator-min-microvolt is a valid value)

>  			regulator-max-microvolt = <1160000>;
>  		};
>  
> 

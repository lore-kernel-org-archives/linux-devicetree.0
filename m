From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: msm8998: thermal: split address space
 into two
Date: Thu, 22 Nov 2018 12:23:36 -0800
Message-ID: <20181122202315.GN1921@tuxbook-pro>
References: <cover.1542911304.git.amit.kucheria@linaro.org>
 <565873e4dd152df24c86d091327687f4aa3505e2.1542911304.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565873e4dd152df24c86d091327687f4aa3505e2.1542911304.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu 22 Nov 10:32 PST 2018, Amit Kucheria wrote:

> We added support to split the register address space for
> tsens into TM and SROT regions in 'Commit 5b1283984fa3 ("thermal: tsens:
> Add support to split up register address space into two")'.
> 
> Split up the tsens address space for msm8998 since it has a similar
> register layout to other versions of the IP to allow for better code
> sharing.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> (Compile-tested only, since I don't have the hardware)

You do have hardware, it's available in our conmux.

Regards,
Bjorn

>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 78227cce16db..eb4f6f77969f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -577,17 +577,18 @@
>  			cell-index = <0>;
>  		};
>  
> -		tsens0: thermal@10aa000 {
> +		tsens0: thermal@10ab000 {
>  			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
> -			reg = <0x10aa000 0x2000>;
> -
> +			reg = <0x10ab000 0x1000>, /* TM */
> +			      <0x10aa000 0x1000>; /* SROT */
>  			#qcom,sensors = <12>;
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> -		tsens1: thermal@10ad000 {
> +		tsens1: thermal@10ae000 {
>  			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
> -			reg = <0x10ad000 0x2000>;
> +			reg = <0x10ae000 0x1000>, /* TM */
> +			      <0x10ad000 0x1000>; /* SROT */
>  
>  			#qcom,sensors = <8>;
>  			#thermal-sensor-cells = <1>;
> -- 
> 2.17.1
> 

From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 02/11] arm/arm64: dts: msm8974/msm8916: thermal: Add
 "qcom,sensors" property
Date: Mon, 3 Sep 2018 13:03:30 -0700
Message-ID: <20180903200330.GM3456@tuxbook-pro>
References: <cover.1535462942.git.amit.kucheria@linaro.org>
 <e894c837385b6a2e120eddb779a359bb08b7c847.1535462942.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e894c837385b6a2e120eddb779a359bb08b7c847.1535462942.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 28 Aug 06:38 PDT 2018, Amit Kucheria wrote:

> This new property allows the number of sensors to be configured from DT
> instead of being hardcoded in platform data. Use it.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Please split in arm and arm64.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 56dbbf788d15..3c4b81c29798 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -433,6 +433,7 @@
>  			      <0xfc4a8000 0x1000>; /* SROT */
>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
> +			#qcom,sensors = <11>;
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 6a277fce3333..be27d8dc9e6b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -767,6 +767,7 @@
>  			      <0x4a8000 0x1000>; /* SROT */
>  			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
>  			nvmem-cell-names = "calib", "calib_sel";
> +			#qcom,sensors = <5>;
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> -- 
> 2.17.1
> 

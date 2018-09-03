From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: Add reg-names for all tsens
 nodes
Date: Mon, 3 Sep 2018 13:34:05 -0700
Message-ID: <20180903203405.GT3456@tuxbook-pro>
References: <cover.1535462942.git.amit.kucheria@linaro.org>
 <c49d9f13b3d6849604ae3eb00a92b80948ef1534.1535462942.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c49d9f13b3d6849604ae3eb00a92b80948ef1534.1535462942.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 28 Aug 06:38 PDT 2018, Amit Kucheria wrote:

> Instead of showing up as thermal-sensor@<addr>, the nodes will show up as
> tsens0_tm, tsen1_tm, tsens1_srot, etc. in /proc/iomem making it easier to
> read.
> 
> IOW,
> 
> 0c222000-0c2221fe : thermal-sensor@c263000
> 0c223000-0c2231fe : thermal-sensor@c265000
> 0c263000-0c2631fe : thermal-sensor@c263000
> 0c265000-0c2651fe : thermal-sensor@c265000
> 
> becomes
> 
> 0c222000-0c2221fe : tsens0_srot
> 0c223000-0c2231fe : tsens1_srot
> 0c263000-0c2631fe : tsens0_tm
> 0c265000-0c2651fe : tsens1_tm
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
>  4 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 3c4b81c29798..64c9f81ddd90 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -431,6 +431,7 @@
>  			compatible = "qcom,msm8974-tsens";
>  			reg = <0xfc4a9000 0x1000>, /* TM */
>  			      <0xfc4a8000 0x1000>; /* SROT */
> +			reg-names = "tsens_tm", "tsens_srot";

While the iomem output seems more convenient this way, these register
names are a contract between the DT binding and the particular tsens
instance.

As such this is a good idea, but with the names should not include the
instance information. They should be "tm", "srot".

>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
>  			#qcom,sensors = <11>;
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0c9a2aa6a1b5..f1a36d6829cf 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -966,6 +966,7 @@
>  			compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
>  			reg = <0xc263000 0x1ff>, /* TM */
>  			      <0xc222000 0x1ff>; /* SROT */
> +			reg-names = "tsens0_tm", "tsens0_srot";
>  			#qcom,sensors = <13>;
>  			#thermal-sensor-cells = <1>;
>  		};
> @@ -974,6 +975,7 @@
>  			compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
>  			reg = <0xc265000 0x1ff>, /* TM */
>  			      <0xc223000 0x1ff>; /* SROT */
> +			reg-names = "tsens1_tm", "tsens1_srot";

And I do recognize that in this case iomem won't show which one is
tsens0 and which is tsens1...


As with previous patches, please split arm and arm64 in separate
patches.

Regards,
Bjorn

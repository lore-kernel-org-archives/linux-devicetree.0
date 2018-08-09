From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v1 09/10] arm64: dts: qcom: Add reg-names for all tsens
 nodes
Date: Thu, 9 Aug 2018 14:05:11 -0700
Message-ID: <20180809210511.GQ160295@google.com>
References: <cover.1533815718.git.amit.kucheria@linaro.org>
 <188c07144d98bfbe2bbbb7d1f2941acdcf4e6682.1533815718.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <188c07144d98bfbe2bbbb7d1f2941acdcf4e6682.1533815718.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 09, 2018 at 06:02:41PM +0530, Amit Kucheria wrote:
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
>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
>  			#qcom,sensors = <11>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index abf84df5a7bc..4e6a5e462a91 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -778,6 +778,7 @@
>  			compatible = "qcom,msm8916-tsens";
>  			reg = <0x4a9000 0x1000>, /* TM */
>  			      <0x4a8000 0x1000>; /* SROT */
> +			reg-names = "tsens_tm", "tsens_srot";
>  			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
>  			nvmem-cell-names = "calib", "calib_sel";
>  			#qcom,sensors = <5>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index c2dca3a30091..7e5982daa2ed 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -969,6 +969,7 @@
>  			compatible = "qcom,msm8996-tsens";
>  			reg = <0x4a9000 0x1000>, /* TM */
>  			      <0x4a8000 0x1000>; /* SROT */
> +			reg-names = "tsens0_tm", "tsens0_srot";
>  			#qcom,sensors = <13>;
>  			#thermal-sensor-cells = <1>;
>  		};
> @@ -977,6 +978,7 @@
>  			compatible = "qcom,msm8996-tsens";
>  			reg = <0x4ad000 0x1000>, /* TM */
>  			      <0x4ac000 0x1000>; /* SROT */
> +			reg-names = "tsens1_tm", "tsens1_srot";
>  			#qcom,sensors = <8>;
>  			#thermal-sensor-cells = <1>;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index f722785df26b..efd5d7abd1cd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1531,6 +1531,7 @@
>  			compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
>  			reg = <0xc263000 0x1ff>, /* TM */
>  			      <0xc222000 0x1ff>; /* SROT */
> +			reg-names = "tsens0_tm", "tsens0_srot";
>  			#qcom,sensors = <13>;
>  			#thermal-sensor-cells = <1>;
>  		};
> @@ -1539,6 +1540,7 @@
>  			compatible = "qcom,sdm845-tsens", "qcom,tsens-v2";
>  			reg = <0xc265000 0x1ff>, /* TM */
>  			      <0xc223000 0x1ff>; /* SROT */
> +			reg-names = "tsens1_tm", "tsens1_srot";
>  			#qcom,sensors = <8>;
>  			#thermal-sensor-cells = <1>;
>  		};

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

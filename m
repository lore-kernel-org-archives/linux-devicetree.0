From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: Rename smmu nodes
Date: Tue, 25 Jun 2019 13:44:51 +0530
Message-ID: <CAFp+6iH3z2_2ZaNYjP7q7504+khgVNiozuKHq3BVLrEwQBz5sg@mail.gmail.com>
References: <20190619001602.4890-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619001602.4890-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 5:46 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Node names shouldn't include a vendor prefix and should whenever
> possible use a generic identifier. Resolve this by renaming the smmu
> nodes "iommu".

The bindings too say so :)
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Updated commit message to talk about vendor prefix rather than qcom,
>
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2ecd9d775d61..c934e00434c7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1163,7 +1163,7 @@
>                         };
>                 };
>
> -               vfe_smmu: arm,smmu@da0000 {
> +               vfe_smmu: iommu@da0000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xda0000 0x10000>;
>
> @@ -1314,7 +1314,7 @@
>                         };
>                 };
>
> -               adreno_smmu: arm,smmu@b40000 {
> +               adreno_smmu: iommu@b40000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xb40000 0x10000>;
>
> @@ -1331,7 +1331,7 @@
>                         power-domains = <&mmcc GPU_GDSC>;
>                 };
>
> -               mdp_smmu: arm,smmu@d00000 {
> +               mdp_smmu: iommu@d00000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xd00000 0x10000>;
>
> @@ -1347,7 +1347,7 @@
>                         power-domains = <&mmcc MDSS_GDSC>;
>                 };
>
> -               lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
> +               lpass_q6_smmu: iommu@1600000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0x1600000 0x20000>;
>                         #iommu-cells = <1>;
> --
> 2.18.0
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

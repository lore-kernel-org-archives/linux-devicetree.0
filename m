From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8996: Add VFE SMMU node
Date: Mon, 19 Nov 2018 16:38:10 +0530
Message-ID: <CAFp+6iG3bRoyFtfd60SO9t=upjcH+fQm1NAOMTvMpYnk5dHjFw@mail.gmail.com>
References: <1542619537-24038-1-git-send-email-todor.tomov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542619537-24038-1-git-send-email-todor.tomov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: todor.tomov@linaro.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Todor,

On Mon, Nov 19, 2018 at 2:57 PM Todor Tomov <todor.tomov@linaro.org> wrote:
>
> Add VFE SMMU node.
>
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> ---
>
> This patch depends on patchset:
> https://lore.kernel.org/patchwork/cover/1013166/
>
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 13bb964..a4d087e5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -950,6 +950,23 @@
>                         };
>                 };
>
> +               vfe_smmu: arm,smmu@da0000 {
> +                       compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> +                       reg = <0xda0000 0x10000>;
> +
> +                       #global-interrupts = <1>;
> +                       interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&mmcc MMAGIC_CAMSS_GDSC>;
> +                       clocks = <&mmcc SMMU_VFE_AHB_CLK>,
> +                                <&mmcc SMMU_VFE_AXI_CLK>;
> +                       clock-names = "iface",
> +                                     "bus";
> +                       #iommu-cells = <1>;
> +                       status = "ok";

No point of adding this status here.
Rest looks good to me.

Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best regards
Vivek

> +               };
> +
>                 agnoc@0 {
>                         power-domains = <&gcc AGGRE0_NOC_GDSC>;
>                         compatible = "simple-pm-bus";
> --
> 2.7.4
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

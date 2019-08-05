From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/1] arm64: dts: sdm845: Add device node for Last level
 cache controller
Date: Mon, 5 Aug 2019 12:05:49 +0530
Message-ID: <CAFp+6iGF50aoGUumGFPuNTDsV-F5c1y_qSvqqcLuzapRzH7HVA@mail.gmail.com>
References: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710112924.17724-1-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, robh+dt <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Wed, Jul 10, 2019 at 5:09 PM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>
> Last level cache (aka. system cache) controller provides control
> over the last level cache present on SDM845. This cache lies after
> the memory noc, right before the DDR.
>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 4babff5f19b5..314241a99290 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1275,6 +1275,13 @@
>                         };
>                 };
>
> +               cache-controller@1100000 {
> +                       compatible = "qcom,sdm845-llcc";
> +                       reg = <0 0x1100000 0 0x200000>, <0 0x1300000 0 0x50000>;
> +                       reg-names = "llcc_base", "llcc_broadcast_base";
> +                       interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
> +               };

Gentle ping. Are you planning to pick this?

Thanks
Vivek
[snip]

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

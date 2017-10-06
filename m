From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Shrink mdp address length for msm8916
Date: Fri, 6 Oct 2017 14:08:39 -0400
Message-ID: <CAF6AEGurDDN3fmifwX6wVhba=xfo5Gihd7Ex-rDO8qCT1sGm-g@mail.gmail.com>
References: <20171006155751.31261-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171006155751.31261-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 6, 2017 at 11:57 AM, Craig Tatlor <ctatlor97@gmail.com> wrote:
> This shrinks the address size down to 89000 from its previous 90000
> which was mistakenly pulled from downstream.
>
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index dc3817593e14..47262757b09e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -814,7 +814,7 @@
>
>                         mdp: mdp@1a01000 {
>                                 compatible = "qcom,mdp5";
> -                               reg = <0x1a01000 0x90000>;
> +                               reg = <0x1a01000 0x89000>;
>                                 reg-names = "mdp_phys";
>
>                                 interrupt-parent = <&mdss>;
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

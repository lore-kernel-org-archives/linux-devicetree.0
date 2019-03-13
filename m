From: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v1 4/4] arm64: dts: sdm845: Add zap shader
 region for GPU
Date: Wed, 13 Mar 2019 11:42:14 -0400
Message-ID: <CAF6AEGt74Hs+VMgMOMAyFw9FGk5mrY2NU07JUh=OKSOhj-h6CA@mail.gmail.com>
References: <1552414422-9568-1-git-send-email-jcrouse@codeaurora.org> <1552414422-9568-5-git-send-email-jcrouse@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552414422-9568-5-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jordan Crouse <jcrouse@codeaurora.org>
Cc: freedreno <freedreno@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 12, 2019 at 2:14 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Some Adreno GPU targets require a special zap shader to bring the GPU
> out of secure mode. Define a region to allocate and store the zap
> shader.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fed7a29..526456d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -100,6 +100,11 @@
>                         no-map;
>                 };
>
> +               zap_shader_region: memory@8c415000 {
> +                       reg = <0 0x8c415000 0 0x2000>;
> +                       no-map;
> +               };
> +
>                 mpss_region: memory@8e000000 {
>                         reg = <0 0x8e000000 0 0x7800000>;
>                         no-map;
> @@ -109,6 +114,8 @@
>                         reg = <0 0x96500000 0 0x200000>;
>                         no-map;
>                 };
> +
> +

I guess we don't really need this hunk..

other than that, the series lgtm

BR,
-R

>         };
>
>         cpus {
> @@ -1514,6 +1521,10 @@
>
>                         qcom,gmu = <&gmu>;
>
> +                       zap-shader {
> +                               memory-region = <&zap_shader_region>;
> +                       };
> +
>                         gpu_opp_table: opp-table {
>                                 compatible = "operating-points-v2";
>
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

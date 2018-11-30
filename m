From: Alexandre Courbot <acourbot@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: sdm845: add video nodes
Date: Fri, 30 Nov 2018 15:39:48 +0900
Message-ID: <CAPBb6MU6b01OEfJ=dHF7Y2E1MeNNR3TTVJDo_SyaNURJVoU2ww@mail.gmail.com>
References: <1543410642-6475-1-git-send-email-mgottam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543410642-6475-1-git-send-email-mgottam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mgottam@codeaurora.org
Cc: Andy Gross <andy.gross@linaro.org>, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, vgarodia@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 10:12 PM Malathi Gottam <mgottam@codeaurora.org> wrote:
>
> This adds video nodes to sdm845 based on the examples
> in the bindings.
>
> Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0c9a2aa..4c9d6a4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -84,6 +84,11 @@
>                         reg = <0 0x86200000 0 0x2d00000>;
>                         no-map;
>                 };
> +
> +               venus_region: memory@95800000 {
> +                       reg = <0x0 0x95800000 0x0 0x500000>;

This patch depends on the firmware loader being fixed to not expect a
6MB area size. I think you can do it as follows:

1) Record the reserved area size in the venus_core structure during
venus_load_fw(),
2) Use that area size in place of VENUS_FW_MEM_SIZE everywhere else in the code.

That way we don't put any artificial limitation on the expected
firmware size, or on the reserved area in the DT matching a hardcoded
size.

Once you have this, the driver should work no matter what the size of
the reserved area is, provided the firmware first into it.

> +                       no-map;
> +               };
>         };
>
>         cpus {
> @@ -1103,5 +1108,35 @@
>                                 status = "disabled";
>                         };
>                 };
> +
> +               video-codec@aa00000 {
> +                       compatible = "qcom,sdm845-venus";
> +                       reg = <0x0aa00000 0xff000>;
> +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&videocc VENUS_GDSC>;
> +                       clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +                                <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
> +                       clock-names = "core", "iface", "bus";
> +                       iommus = <&apps_smmu 0x10a0 0x8>,
> +                                <&apps_smmu 0x10b0 0x0>;
> +                       memory-region = <&venus_region>;
> +
> +                       video-core0 {
> +                               compatible = "venus-decoder";
> +                               clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +                                        <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +                               clock-names = "core", "bus";
> +                               power-domains = <&videocc VCODEC0_GDSC>;
> +                       };
> +
> +                       video-core1 {
> +                               compatible = "venus-encoder";
> +                               clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
> +                                        <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
> +                               clock-names = "core", "bus";
> +                               power-domains = <&videocc VCODEC1_GDSC>;
> +                       };

We should probably have status = "disabled" here and enable this node
on a per-board basis?

Also, shouldn't we define the firmware subnode here too?

Cheers,
Alex.
> --
> 1.9.1
>

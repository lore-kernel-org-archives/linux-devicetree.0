From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Date: Tue, 22 Jan 2019 16:28:04 -0800
Message-ID: <CAD=FV=XuA0Sm0fXfaHtib7+rji1s3s_SmjHc6d_DbEQ1LROq+A@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org> <20190122055112.30943-11-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-11-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jan 21, 2019 at 9:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> From: Sibi Sankar <sibis@codeaurora.org>
>
> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v2:
> - Picked up Sibi's patch
> - Fixed reg to work with address/size-cells as 2
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 58 ++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 5cc2615461da..78df5f1bce2d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1617,6 +1617,64 @@
>                         clock-names = "xo";
>                 };
>
> +               mss_pil: remoteproc@4080000 {
> +                       compatible = "qcom,sdm845-mss-pil";
> +                       reg = <0 0x04080000 0 0x408>, <0 0x04180000 0 0x48>;
> +                       reg-names = "qdsp6", "rmb";
> +
> +                       interrupts-extended =
> +                               <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "wdog", "fatal", "ready",
> +                                         "handover", "stop-ack",
> +                                         "shutdown-ack";
> +
> +                       clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> +                                <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
> +                                <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +                                <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +                                <&gcc GCC_MSS_MFAB_AXIS_CLK>,
> +                                <&gcc GCC_PRNG_AHB_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "bus", "mem", "gpll0_mss",
> +                                     "snoc_axi", "mnoc_axi", "prng", "xo";
> +
> +                       qcom,smem-states = <&modem_smp2p_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
> +                                <&pdc_reset PDC_MODEM_SYNC_RESET>;
> +                       reset-names = "mss_restart", "pdc_reset";
> +
> +                       qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> +
> +                       power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
> +                                       <&rpmhpd SDM845_CX>,
> +                                       <&rpmhpd SDM845_MX>,
> +                                       <&rpmhpd SDM845_MSS>;
> +                       power-domain-names = "load_state", "cx", "mx", "mss";
> +
> +                       mba {
> +                               memory-region = <&mba_region>;
> +                       };
> +
> +                       mpss {
> +                               memory-region = <&mpss_region>;
> +                       };
> +
> +                       glink-edge {
> +                               interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
> +                               label = "modem";
> +                               qcom,remote-pid = <1>;
> +                               mboxes = <&apss_shared 12>;
> +                       };
> +               };
> +
>                 sdhc_2: sdhci@8804000 {

Can you please sort by unit address now that you have a device tree
that has more stuff?

-Doug

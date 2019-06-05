From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add Truly display
Date: Wed, 5 Jun 2019 10:56:49 +0530
Message-ID: <CAFp+6iH_pNPVs5QA2fa87ZoVngEFJ362sDivAWzzWPC6K0S5mA@mail.gmail.com>
References: <20190513210747.22429-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513210747.22429-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 2:39 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Bring in the Truly display and enable the DSI channels to make the
> mdss/gpu probe, even though we're lacking LABIB, preventing us from
> seeing anything on the screen.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Looks good to me and work well too with a wip lab-ibb driver change.

Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>

>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 79 +++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 02b8357c8ce8..83198a19ff57 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -352,6 +352,77 @@
>         status = "okay";
>  };
>
> +&dsi0 {
> +       status = "okay";
> +       vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +       qcom,dual-dsi-mode;
> +       qcom,master-dsi;
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&truly_in_0>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +
> +       panel@0 {
> +               compatible = "truly,nt35597-2K-display";
> +               reg = <0>;
> +               vdda-supply = <&vreg_l14a_1p88>;
> +
> +               reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +               mode-gpios = <&tlmm 52 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               truly_in_0: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               truly_in_1: endpoint {
> +                                       remote-endpoint = <&dsi1_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi0_phy {
> +       status = "okay";
> +       vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
> +&dsi1 {
> +       status = "okay";
> +       vdda-supply = <&vdda_mipi_dsi1_1p2>;
> +
> +       qcom,dual-dsi-mode;
> +
> +       ports {
> +               port@1 {
> +                       endpoint {
> +                               remote-endpoint = <&truly_in_1>;
> +                               data-lanes = <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi1_phy {
> +       status = "okay";
> +       vdds-supply = <&vdda_mipi_dsi1_pll>;
> +};
> +
>  &gcc {
>         protected-clocks = <GCC_QSPI_CORE_CLK>,
>                            <GCC_QSPI_CORE_CLK_SRC>,
> @@ -365,6 +436,14 @@
>         clock-frequency = <400000>;
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_mdp {
> +       status = "okay";
> +};
> +
>  &qupv3_id_1 {
>         status = "okay";
>  };
> --
> 2.18.0
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

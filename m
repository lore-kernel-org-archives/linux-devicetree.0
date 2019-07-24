From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
Date: Wed, 24 Jul 2019 10:51:38 +0530
Message-ID: <CAHLCerNWnjSYEqDOEdSzULLvTHkMxVMiEL2BaCY9R4eDF_uBrg@mail.gmail.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-6-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724044906.12007-6-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Unit address is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 1ebbd568dfd7..9b27b8346ba1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
>  };
>
>  &pm8998_adc {
> -       adc-chan@ADC5_AMUX_THM1_100K_PU {
> +       adc-chan@4d {
>                 reg = <ADC5_AMUX_THM1_100K_PU>;
>                 label = "sdm_temp";
>         };
>
> -       adc-chan@ADC5_AMUX_THM2_100K_PU {
> +       adc-chan@4e {
>                 reg = <ADC5_AMUX_THM2_100K_PU>;
>                 label = "quiet_temp";
>         };
>
> -       adc-chan@ADC5_AMUX_THM3_100K_PU {
> +       adc-chan@4f {
>                 reg = <ADC5_AMUX_THM3_100K_PU>;
>                 label = "lte_temp_1";
>         };
>
> -       adc-chan@ADC5_AMUX_THM4_100K_PU {
> +       adc-chan@50 {
>                 reg = <ADC5_AMUX_THM4_100K_PU>;
>                 label = "lte_temp_2";
>         };
>
> -       adc-chan@ADC5_AMUX_THM5_100K_PU {
> +       adc-chan@51 {
>                 reg = <ADC5_AMUX_THM5_100K_PU>;
>                 label = "charger_temp";
>         };
> --
> 2.20.1
>

From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: pms405: add unit name adc nodes
Date: Thu, 1 Aug 2019 15:33:00 +0530
Message-ID: <CAP245DX5thWe-+mTH-oNeNRa_LRNX=oLvtNhQ=vt7Ukb6wrF9Q@mail.gmail.com>
References: <20190801095049.13855-1-vkoul@kernel.org> <20190801095049.13855-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801095049.13855-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 1, 2019 at 3:22 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> The adc nodes have reg property but were missing the unit name, so add
> that to fix these warnings:
>
> arch/arm64/boot/dts/qcom/pms405.dtsi:91.12-94.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/ref_gnd: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:96.14-99.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vref_1p25: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:101.19-104.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vph_pwr: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:106.13-109.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/die_temp: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:111.27-116.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor1: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:118.27-123.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor3: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:125.22-130.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/xo_temp: node has a reg or ranges property, but no unit name
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index 14240fedd916..a28386900a3b 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -88,41 +88,41 @@
>                         #size-cells = <0>;
>                         #io-channel-cells = <1>;
>
> -                       ref_gnd {
> +                       ref_gnd@0 {
>                                 reg = <ADC5_REF_GND>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       vref_1p25 {
> +                       vref_1p25@1 {
>                                 reg = <ADC5_1P25VREF>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pon_1: vph_pwr {
> +                       pon_1: vph_pwr@131 {
>                                 reg = <ADC5_VPH_PWR>;
>                                 qcom,pre-scaling = <1 3>;
>                         };
>
> -                       die_temp {
> +                       die_temp@6 {
>                                 reg = <ADC5_DIE_TEMP>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pa_therm1: thermistor1 {
> +                       pa_therm1: thermistor1@77 {
>                                 reg = <ADC5_AMUX_THM1_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pa_therm3: thermistor3 {
> +                       pa_therm3: thermistor3@79 {
>                                 reg = <ADC5_AMUX_THM3_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       xo_therm: xo_temp {
> +                       xo_therm: xo_temp@76 {
>                                 reg = <ADC5_XO_THERM_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
> --
> 2.20.1
>

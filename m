From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm845: remove macro from unit name
Date: Wed, 24 Jul 2019 10:51:21 +0530
Message-ID: <CAHLCerP-9dNG30enhb779=FGFLUZCR2EdjDQEXjt0jkQPvaJtA@mail.gmail.com>
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-5-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724044906.12007-5-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 10:20 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> Unit name is supposed to be a number, using a macro with hex value is
> not recommended, so add the value in unit name.
>
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading "0x"
> arch/arm64/boot/dts/qcom/pm8998.dtsi:81.18-84.6: Warning (unit_address_format): /soc/spmi@c440000/pmic@0/adc@3100/adc-chan@0x06: unit name should not have leading 0s
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index 051a52df80f9..dc2ce23cde05 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -78,7 +78,7 @@
>                         #size-cells = <0>;
>                         #io-channel-cells = <1>;
>
> -                       adc-chan@ADC5_DIE_TEMP {
> +                       adc-chan@6 {
>                                 reg = <ADC5_DIE_TEMP>;
>                                 label = "die_temp";
>                         };
> --
> 2.20.1
>

From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 12/18] arm64: dts: qcom: pms405: add gpios
Date: Thu, 8 Nov 2018 15:42:02 -0600
Message-ID: <CAL_JsqJSszvQ0QC0LLT4ho+xMgiMJRVJyrM93OgH21Neu6xMqw@mail.gmail.com>
References: <20181108184009.18430-1-vkoul@kernel.org> <20181108184009.18430-13-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108184009.18430-13-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 12:41 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Add the GPIOs present on PMS405 chip.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index 2b275bbdafa3..85a3228abaf9 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -10,6 +10,25 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> +               pms405_gpios: gpios@c000 {

gpio@...

> +                       compatible = "qcom,pms405-gpio";
> +                       reg = <0xc000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> +                               <0 0xc1 0 IRQ_TYPE_NONE>,
> +                               <0 0xc2 0 IRQ_TYPE_NONE>,
> +                               <0 0xc3 0 IRQ_TYPE_NONE>,
> +                               <0 0xc4 0 IRQ_TYPE_NONE>,
> +                               <0 0xc5 0 IRQ_TYPE_NONE>,
> +                               <0 0xc6 0 IRQ_TYPE_NONE>,
> +                               <0 0xc7 0 IRQ_TYPE_NONE>,
> +                               <0 0xc8 0 IRQ_TYPE_NONE>,
> +                               <0 0xc9 0 IRQ_TYPE_NONE>,
> +                               <0 0xca 0 IRQ_TYPE_NONE>,
> +                               <0 0xcb 0 IRQ_TYPE_NONE>;
> +               };
> +
>                 rtc@6000 {
>                         compatible = "qcom,pm8941-rtc";
>                         reg = <0x6000>;
> --
> 2.14.4
>

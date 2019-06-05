From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Wed, 5 Jun 2019 22:41:28 +0200
Message-ID: <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org> <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
>
> Add initial device tree support for the Qualcomm IPQ6018 SoC and
> CP01 evaluation board.
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>
> +       clocks {
> +               sleep_clk: sleep_clk {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <32000>;
> +                       #clock-cells = <0>;
> +               };
> +
Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
>From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
declares them at 32000 Hz. Since you probably have access to the BOM and
datasheets. Can you please confirm what's the real clock frequency for
the IPQ6018.
(And maybe also for the sleep_clk of the IPQ4018 as well?).

Cheers,
Christian

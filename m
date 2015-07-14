From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 5/5] arm64: dts: mt8173: add timer node
Date: Tue, 14 Jul 2015 12:26:18 +0800
Message-ID: <CAGS+omAQ7bKD4Jqwm=hv=D_aMxXpT4dKgzU4QqntnLEa0Fup-g@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1436779969-18610-6-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436779969-18610-6-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> From: Daniel Kurtz <djkurtz@chromium.org>
>
> Add device node to enable GPT timer. This timer will be
> used as sched clock source.
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

This binding needs documentation.

> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 0696f8f..04bdd8f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -219,6 +219,15 @@
>                         reg = <0 0x10007000 0 0x100>;
>                 };
>
> +               timer: timer@10008000 {
> +                       compatible = "mediatek,mt8173-timer",
> +                                    "mediatek,mt6577-timer";
> +                       reg = <0 0x10008000 0 0x1000>;
> +                       interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
> +                       clocks = <&infracfg CLK_INFRA_CLK_13M>,
> +                                <&topckgen CLK_TOP_RTC_SEL>;

Why two clocks?  The driver only uses one.
Please use a clock-names property.

Thanks,
-Dan

> +               };
> +
>                 pwrap: pwrap@1000d000 {
>                         compatible = "mediatek,mt8173-pwrap";
>                         reg = <0 0x1000d000 0 0x1000>;
> --
> 1.8.1.1.dirty
>

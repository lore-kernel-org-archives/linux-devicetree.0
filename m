From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] Add sysirq device node for mt6592, also correct the
 timer interrupt.
Date: Wed, 7 Jan 2015 14:12:51 +0100
Message-ID: <CABuKBeJFa=70ZRKhq9_2dZRTPGsFBqNtUCSkUkUPYrZD8HTmYg@mail.gmail.com>
References: <1420533751-23999-1-git-send-email-howard.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420533751-23999-1-git-send-email-howard.chen@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Howard Chen <howard.chen@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Howard,

2015-01-06 9:42 GMT+01:00 Howard Chen <howard.chen@linaro.org>:
> Signed-off-by: Howard Chen <howard.chen@linaro.org>
> ---
>  arch/arm/boot/dts/mt6592.dtsi | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Please use in the subject "ARM: mediatek: " prefix and please add a
commit message to your patch. From my point of view it's OK if you
explain in the commit message why we can/should change the timer
interrupt, please do so.

>
> diff --git a/arch/arm/boot/dts/mt6592.dtsi b/arch/arm/boot/dts/mt6592.dtsi
> index 31e5a09..1db453f 100644
> --- a/arch/arm/boot/dts/mt6592.dtsi
> +++ b/arch/arm/boot/dts/mt6592.dtsi
> @@ -18,7 +18,7 @@
>
>  / {
>         compatible = "mediatek,mt6592";
> -       interrupt-parent = <&gic>;
> +       interrupt-parent = <&sysirq>;
>
>         cpus {
>                 #address-cells = <1>;
> @@ -78,21 +78,34 @@
>                 #clock-cells = <0>;
>         };
>
> +       uart_clk: uart_clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <26000000>;
> +               #clock-cells = <0>;
> +       };
> +

Please delete the uart clock, it has nothing to do with the sysirq in
the first place.

Thanks,
Matthias

>         timer: timer@10008000 {
>                 compatible = "mediatek,mt6577-timer";
>                 reg = <0x10008000 0x80>;
> -               interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
>                 clocks = <&system_clk>, <&rtc_clk>;
>                 clock-names = "system-clk", "rtc-clk";
>         };
>
> +       sysirq: interrupt-controller@10200220 {
> +               compatible = "mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               interrupt-parent = <&gic>;
> +               reg = <0x10200220 0x1c>;
> +       };
> +
>         gic: interrupt-controller@10211000 {
>                 compatible = "arm,cortex-a7-gic";
>                 interrupt-controller;
>                 #interrupt-cells = <3>;
> +               interrupt-parent = <&gic>;
>                 reg = <0x10211000 0x1000>,
>                       <0x10212000 0x1000>;
>         };
> -
>  };
> -
> --
> 1.9.1
>



-- 
motzblog.wordpress.com

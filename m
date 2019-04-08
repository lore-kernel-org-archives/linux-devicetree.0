From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a64-amarula-relic: Add GT5663
 CTP node
Date: Mon, 8 Apr 2019 14:03:17 +0800
Message-ID: <CAGb2v64g9=VoHP0s2OKt2Xv8Fj97dhy7iUkAp-hqLKBLZd5qAg@mail.gmail.com>
References: <20190408055415.1374-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408055415.1374-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 8, 2019 at 1:54 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Add Goodix GT5663 capacitive touch controller node on
> Amarula A64-Relic board.
>
> The CTP connected to board with,
> - SDA, SCK from i2c1
> - GPIO-LD0 as AVDD28 supply
> - PH4 gpio as interrupt pin
> - PH8 gpio as reset pin
> - X axis is inverted
> - Y axis is inverted
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../allwinner/sun50i-a64-amarula-relic.dts    | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> index 3575db216016..a76353d59aaa 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> @@ -49,6 +49,28 @@
>         bias-pull-up;
>  };
>
> +&i2c1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&i2c1_pins>;
> +       status = "okay";
> +
> +       touchscreen@5d {
> +               compatible = "goodix,gt5663";
> +               reg = <0x5d>;
> +               AVDD28-supply = <&reg_ldo_io0>;                 /* VCC-CTP: GPIO0-LDO */
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 4 IRQ_TYPE_EDGE_FALLING>;
> +               irq-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>;        /* CTP-INT: PH4 */
> +               reset-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>;      /* CTP-RST: PH8 */
> +               touchscreen-inverted-x;
> +               touchscreen-inverted-y;
> +       };
> +};
> +
> +&i2c1_pins {
> +       bias-pull-up;
> +};
> +

Do you know if the pins have external pull-ups? If so then you
don't need this bit. Same for the other patch.

AFAIK the internal pull-ups are kind of weak.

>  &mmc1 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc1_pins>;
> @@ -212,6 +234,13 @@
>         regulator-name = "vdd-cpus";
>  };
>
> +&reg_ldo_io0 {
> +       regulator-min-microvolt = <3300000>;
> +       regulator-max-microvolt = <3300000>;
> +       regulator-name = "vcc-ctp";
> +       status = "okay";
> +};
> +
>  &reg_rtc_ldo {
>         regulator-name = "vcc-rtc";
>  };
> --
> 2.18.0.321.gffc6fa0e3
>

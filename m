From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 09/14] ARM: dts: sun8i-a83t: Add mmc controller nodes
Date: Tue, 2 Feb 2016 14:35:36 +0800
Message-ID: <CAGb2v66DGsccAUe4XwZYOadUZ7J2QH1J==-MWgBEsNBfWLjr6A@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-10-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454203266-4450-10-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-cl
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:
> A83T mmc is compatible with earliers sunxi socs.
> This adds mmc0, mmc1, and mmc2 controller nodes for A83T.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 57 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index b8c8b60..ac96aa1 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -276,6 +276,63 @@
>                 #size-cells = <1>;
>                 ranges;
>
> +               mmc0: mmc@01c0f000 {
> +                       compatible = "allwinner,sun5i-a13-mmc";
> +                       reg = <0x01c0f000 0x1000>;
> +                       clocks = <&bus_gates 8>,
> +                                <&mmc0_clk 0>,
> +                                <&mmc0_clk 1>,
> +                                <&mmc0_clk 2>;
> +                       clock-names = "ahb",
> +                                     "mmc",
> +                                     "output",
> +                                     "sample";
> +                       resets = <&ahb_reset0 8>;
> +                       reset-names = "ahb";
> +                       interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               mmc1: mmc@01c10000 {
> +                       compatible = "allwinner,sun5i-a13-mmc";
> +                       reg = <0x01c10000 0x1000>;
> +                       clocks = <&bus_gates 9>,
> +                                <&mmc1_clk 0>,
> +                                <&mmc1_clk 1>,
> +                                <&mmc1_clk 2>;
> +                       clock-names = "ahb",
> +                                     "mmc",
> +                                     "output",
> +                                     "sample";
> +                       resets = <&ahb_reset0 9>;
> +                       reset-names = "ahb";
> +                       interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +
> +               mmc2: mmc@01c11000 {
> +                       compatible = "allwinner,sun5i-a13-mmc";
> +                       reg = <0x01c11000 0x1000>;
> +                       clocks = <&bus_gates 10>,
> +                                <&mmc2_clk 0>,
> +                                <&mmc2_clk 1>,
> +                                <&mmc2_clk 2>;
> +                       clock-names = "ahb",
> +                                     "mmc",
> +                                     "output",
> +                                     "sample";
> +                       resets = <&ahb_reset0 10>;
> +                       reset-names = "ahb";
> +                       interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +

This patch looks good, except for the reset control I pointed out in
the other patch.

Regards
ChenYu

>                 pio: pinctrl@01c20800 {
>                         compatible = "allwinner,sun8i-a83t-pinctrl";
>                         interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> --
> 1.9.1
>

From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 12/14] ARM: dts: sun8i-a83t: Add RSB nodes to dtsi
Date: Sun, 31 Jan 2016 11:50:49 +0800
Message-ID: <CAGb2v65JPwpmbFhOyoBXbO_Eg4=MmPZkiMr5kY=cit_ySMaEYA@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-13-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454203266-4450-13-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder de Haan <patchesrdh@mveas.com>, linux-cl
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:
> This adds support for RSB
> A83T RSB is compatible with A23 rsb.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 11be9e1..8c67c85 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -499,5 +499,19 @@
>                                 allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
>                         };
>                 };
> +
> +               r_rsb: i2c@01f03400 {
> +                       compatible = "allwinner,sun8i-a23-rsb";
> +                       reg = <0x01f03400 0x400>;
> +                       interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&apb0_gates 3>;
> +                       clock-frequency = <3000000>;
> +                       resets = <&apb0_reset 3>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&r_rsb_pins>;

As mentioned in the previous patch, r_rsb_pins should be included in this patch,
since it is used here. In general, we mostly have them as individual patches, as
they are referenced from board dts files. Here since it's used in the dtsi, you
can just include them.

See commit ed473ebd9c15 ("ARM: dts: sun9i: Add Reduced Serial Bus controller
device node to A80 dtsi") on how I described it.

ChenYu

> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
>         };
>  };
> --
> 1.9.1
>

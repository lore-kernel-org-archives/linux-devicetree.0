From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 14/20] ARM: sun5i: a13: Add LCD pins
Date: Tue, 17 May 2016 01:13:01 +0800
Message-ID: <CAGb2v66g_xZEyOf8ky_TKpT70D_EQwirVKNMQbubT5U2cD8rnw@mail.gmail.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-15-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463402840-17062-15-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The RGB bus can be used in several configurations, one of which being the
> RGB666.
>
> Add a pinctrl group for that case.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  arch/arm/boot/dts/sun5i-a13.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
> index 263d46dbc7e6..79b5d513c142 100644
> --- a/arch/arm/boot/dts/sun5i-a13.dtsi
> +++ b/arch/arm/boot/dts/sun5i-a13.dtsi
> @@ -237,6 +237,16 @@
>  &pio {
>         compatible = "allwinner,sun5i-a13-pinctrl";
>
> +       lcd_rgb666_pins: lcd_rgb666@0 {
> +               allwinner,pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +                                "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
> +                                "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
> +                                "PD24", "PD25", "PD26", "PD27";
> +               allwinner,function = "lcd0";
> +               allwinner,drive = <SUN4I_PINCTRL_10_MA>;

Just a thought: would we ever need to increase the drive strength for very high
resolutions?

> +               allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +       };
> +
>         uart1_pins_a: uart1@0 {
>                 allwinner,pins = "PE10", "PE11";
>                 allwinner,function = "uart1";
> --
> 2.8.2
>

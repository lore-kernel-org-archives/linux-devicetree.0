From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 10/26] ARM: sun5i: a13: Add display and
 TCON clocks
Date: Sun, 17 Jan 2016 01:06:07 +0800
Message-ID: <CAGb2v67fqMUQsG-+zVxfgE3UzY7uyomBkwxgNHeXbqA1pwM8pA@mail.gmail.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-11-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBF7R5G2AKGQEGNSLL6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452785109-6172-11-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wynter Woods <wynter-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Enable the display and TCON (channel 0 and channel 1) clocks that are going
> to be needed to drive the display engine, tcon and TV encoders.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i-a13.dtsi | 38 +++++++++++++++++++++++++++++++++++++-
>  arch/arm/boot/dts/sun5i-r8.dtsi  |  5 +++--
>  2 files changed, 40 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
> index d910d3a6c41c..9669b03f20f3 100644
> --- a/arch/arm/boot/dts/sun5i-a13.dtsi
> +++ b/arch/arm/boot/dts/sun5i-a13.dtsi
> @@ -61,7 +61,8 @@
>                         compatible = "allwinner,simple-framebuffer",
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0";
> -                       clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
> +                       clocks = <&ahb_gates 36>, <&ahb_gates 44>, <&de_be_clk>,
> +                                <&tcon_ch0_clk>;
>                         status = "disabled";
>                 };
>         };
> @@ -149,6 +150,41 @@
>                                              "apb1_i2c2", "apb1_uart1",
>                                              "apb1_uart3";
>                 };
> +
> +               de_be_clk: clk@01c20104 {
> +                       #clock-cells = <0>;
> +                       #reset-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-display-clk";
> +                       reg = <0x01c20104 0x4>;
> +                       clocks = <&pll3>, <&pll7>, <&pll5 1>;
> +                       clock-output-names = "de-be";
> +               };
> +
> +               de_fe_clk: clk@01c2010c {
> +                       #clock-cells = <0>;
> +                       #reset-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-display-clk";
> +                       reg = <0x01c2010c 0x4>;
> +                       clocks = <&pll3>, <&pll7>, <&pll5 1>;
> +                       clock-output-names = "de-fe";
> +               };
> +
> +               tcon_ch0_clk: clk@01c20118 {
> +                       #clock-cells = <0>;
> +                       #reset-cells = <1>;

You got it right here...

> +                       compatible = "allwinner,sun4i-a10-tcon-ch0-clk";
> +                       reg = <0x01c20118 0x4>;
> +                       clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
> +                       clock-output-names = "tcon-ch0-sclk";
> +               };
> +
> +               tcon_ch1_clk: clk@01c2012c {
> +                       #clock-cells = <0>;
> +                       compatible = "allwinner,sun4i-a10-tcon-ch1-clk";
> +                       reg = <0x01c2012c 0x4>;
> +                       clocks = <&pll3>, <&pll7>, <&pll3x2>, <&pll7x2>;
> +                       clock-output-names = "tcon-ch1-sclk";
> +               };

I suggest moving these to sun5i.dtsi, as they are shared amongst them.

ChenYu

>         };
>
>         soc@01c00000 {
> diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
> index 0ef865601ac9..b1e4e0170d51 100644
> --- a/arch/arm/boot/dts/sun5i-r8.dtsi
> +++ b/arch/arm/boot/dts/sun5i-r8.dtsi
> @@ -51,8 +51,9 @@
>                         compatible = "allwinner,simple-framebuffer",
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0-tve0";
> -                       clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
> -                                <&ahb_gates 44>;
> +                       clocks = <&ahb_gates 34>, <&ahb_gates 36>,
> +                                <&ahb_gates 44>, <&de_be_clk>,
> +                                <&tcon_ch1_clk>;
>                         status = "disabled";
>                 };
>         };
> --
> 2.6.4
>

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 11/26] ARM: sun5i: Add DRAM gates
Date: Sun, 17 Jan 2016 01:10:02 +0800
Message-ID: <CAGb2v65gCieH2-WS+1WeBNCVqRyw8fOxODdSC5xeKf-hkfgs6A@mail.gmail.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-12-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBAPT5G2AKGQE5MUD44A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452785109-6172-12-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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

On Thu, Jan 14, 2016 at 11:24 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The DRAM gates control whether the image / display devices on the SoC have
> access to the DRAM clock or not.
>
> Enable it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i-a10s.dtsi |  7 ++++---
>  arch/arm/boot/dts/sun5i-a13.dtsi  |  2 +-
>  arch/arm/boot/dts/sun5i-r8.dtsi   |  2 +-
>  arch/arm/boot/dts/sun5i.dtsi      | 19 +++++++++++++++++++
>  4 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
> index bddd0de88af6..52d2c79cb37b 100644
> --- a/arch/arm/boot/dts/sun5i-a10s.dtsi
> +++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
> @@ -66,7 +66,7 @@
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0-hdmi";
>                         clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> -                                <&ahb_gates 44>;
> +                                <&ahb_gates 44>, <&dram_gates 26>;
>                         status = "disabled";
>                 };
>
> @@ -74,7 +74,8 @@
>                         compatible = "allwinner,simple-framebuffer",
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0";
> -                       clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>;
> +                       clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 44>,
> +                                <&dram_gates 26>;
>                         status = "disabled";
>                 };
>
> @@ -83,7 +84,7 @@
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0-tve0";
>                         clocks = <&pll5 1>, <&ahb_gates 34>, <&ahb_gates 36>,
> -                                <&ahb_gates 44>;
> +                                <&ahb_gates 44>, <&dram_gates 26>;
>                         status = "disabled";
>                 };
>         };
> diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
> index 9669b03f20f3..f29163650ca8 100644
> --- a/arch/arm/boot/dts/sun5i-a13.dtsi
> +++ b/arch/arm/boot/dts/sun5i-a13.dtsi
> @@ -62,7 +62,7 @@
>                                      "simple-framebuffer";
>                         allwinner,pipeline = "de_be0-lcd0";
>                         clocks = <&ahb_gates 36>, <&ahb_gates 44>, <&de_be_clk>,
> -                                <&tcon_ch0_clk>;
> +                                <&tcon_ch0_clk>, <&dram_gates 26>;
>                         status = "disabled";
>                 };
>         };
> diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
> index b1e4e0170d51..691d3de75b35 100644
> --- a/arch/arm/boot/dts/sun5i-r8.dtsi
> +++ b/arch/arm/boot/dts/sun5i-r8.dtsi
> @@ -53,7 +53,7 @@
>                         allwinner,pipeline = "de_be0-lcd0-tve0";
>                         clocks = <&ahb_gates 34>, <&ahb_gates 36>,
>                                  <&ahb_gates 44>, <&de_be_clk>,
> -                                <&tcon_ch1_clk>;
> +                                <&tcon_ch1_clk>, <&dram_gates 26>;
>                         status = "disabled";
>                 };
>         };
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index 0840612b5ed6..c72d94228915 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -338,6 +338,25 @@
>                         clock-output-names = "usb_ohci0", "usb_phy";
>                 };
>
> +               dram_gates: clk@01c20100 {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun5i-a13-dram-gates-clk";
> +                       reg = <0x01c20100 0x4>;
> +                       clocks = <&pll5 0>;
> +                       clock-indices = <0>,
> +                                       <1>,

According to A10s manual, bit 3 is DRAM clock for TS (transport stream
decoder), while bit 5 is for the TV encoder.

The others look good.

ChenYu

> +                                       <25>,
> +                                       <26>,
> +                                       <29>,
> +                                       <31>;
> +                       clock-output-names = "dram_ve",
> +                                            "dram_csi",
> +                                            "dram_de_fe",
> +                                            "dram_de_be",
> +                                            "dram_ace",
> +                                            "dram_iep";
> +               };
> +
>                 codec_clk: clk@01c20140 {
>                         #clock-cells = <0>;
>                         compatible = "allwinner,sun4i-a10-codec-clk";
> --
> 2.6.4
>

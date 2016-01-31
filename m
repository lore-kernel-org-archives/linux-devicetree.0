From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 08/14] ARM: dts: sun8i-a83t: add mmc clock nodes
Date: Sun, 31 Jan 2016 14:10:29 +0800
Message-ID: <CAGb2v67a8sZhBGuqn1LqvNrdsusKV6Jar7LMxpAcR6r2VkoTyg@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-9-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB26KW22QKGQEUWDH7TA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454203266-4450-9-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-cl
List-Id: devicetree@vger.kernel.org

On Sun, Jan 31, 2016 at 9:21 AM, Vishnu Patekar
<vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> mmc clocks are compatible with that of earlier sun8i socs.
> This adds mmc0, mmc1, and mmc2 clock nodes for A83T.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 568d6fb..b8c8b60 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -238,6 +238,36 @@
>                                              "bus_uart2", "bus_uart3",
>                                              "bus_uart4";
>                 };
> +
> +               mmc0_clk: clk@01c20088 {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun4i-a10-mmc-clk";
> +                       reg = <0x01c20088 0x4>;
> +                       clocks = <&osc24M>, <&pll6>;
> +                       clock-output-names = "mmc0",
> +                                            "mmc0_output",
> +                                            "mmc0_sample";
> +               };
> +
> +               mmc1_clk: clk@01c2008c {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun4i-a10-mmc-clk";
> +                       reg = <0x01c2008c 0x4>;
> +                       clocks = <&osc24M>, <&pll6>;
> +                       clock-output-names = "mmc1",
> +                                            "mmc1_output",
> +                                            "mmc1_sample";
> +               };
> +
> +               mmc2_clk: clk@01c20090 {
> +                       #clock-cells = <1>;
> +                       compatible = "allwinner,sun4i-a10-mmc-clk";
> +                       reg = <0x01c20090 0x4>;
> +                       clocks = <&osc24M>, <&pll6>;
> +                       clock-output-names = "mmc2",
> +                                            "mmc2_output",
> +                                            "mmc2_sample";
> +               };
>         };
>
>         soc {
> --
> 1.9.1
>

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 05/14] clk: sunxi: Add APB1 clock for A83T
Date: Sun, 31 Jan 2016 11:33:34 +0800
Message-ID: <CAGb2v649_A2suoshTpYUBnihMia+V9bZDF_rYEs1b9gANMExuw@mail.gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com> <1454203266-4450-6-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBJMBW22QKGQEJZPUQEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454203266-4450-6-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Sun, Jan 31, 2016 at 9:20 AM, Vishnu Patekar
<vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> APB1 is similar to sun4i-a10-apb0-clk, except different dividers.
>
> This adds support for apb1 on A83T.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-sunxi.c                     | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
> index bfd82f1..10637e7 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -49,6 +49,7 @@ Required properties:
>         "allwinner,sun8i-a23-apb0-gates-clk" - for the APB0 gates on A23
>         "allwinner,sun9i-a80-apb0-gates-clk" - for the APB0 gates on A80
>         "allwinner,sun4i-a10-apb1-clk" - for the APB1 clock
> +       "allwinner,sun8i-a83t-apb1-clk" - for the APB1 clock on A83T
>         "allwinner,sun9i-a80-apb1-clk" - for the APB1 bus clock on A80
>         "allwinner,sun4i-a10-apb1-gates-clk" - for the APB1 gates on A10
>         "allwinner,sun5i-a13-apb1-gates-clk" - for the APB1 gates on A13
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 02bbdf6..6510b0e 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -772,6 +772,22 @@ static const struct div_data sun4i_apb0_data __initconst = {
>         .table  = sun4i_apb0_table,
>  };
>
> +
> +static const struct clk_div_table sun8i_a83t_apb1_table[] __initconst = {
> +       { .val = 0, .div = 1 },
> +       { .val = 1, .div = 2 },
> +       { .val = 2, .div = 3 },
> +       { .val = 3, .div = 4 },
> +       { } /* sentinel */
> +};

The table is only needed if it cannot be handled by default or with
the div flags,
such as dividers not increasing or not power-of-2.

ChenYu

> +static const struct div_data sun8i_a83t_apb1_data __initconst = {
> +       .shift  = 8,
> +       .pow    = 0,
> +       .width  = 2,
> +       .table  = sun8i_a83t_apb1_table,
> +};
> +
>  static void __init sunxi_divider_clk_setup(struct device_node *node,
>                                            struct div_data *data)
>  {
> @@ -1027,6 +1043,7 @@ static const struct of_device_id clk_div_match[] __initconst = {
>         {.compatible = "allwinner,sun8i-a23-axi-clk", .data = &sun8i_a23_axi_data,},
>         {.compatible = "allwinner,sun4i-a10-ahb-clk", .data = &sun4i_ahb_data,},
>         {.compatible = "allwinner,sun4i-a10-apb0-clk", .data = &sun4i_apb0_data,},
> +       {.compatible = "allwinner,sun8i-a83t-apb1-clk", .data = &sun8i_a83t_apb1_data,},
>         {}
>  };
>
> --
> 1.9.1
>

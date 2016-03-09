From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 01/13] pinctrl: sunxi: Add A83T R_PIO controller support
Date: Wed, 9 Mar 2016 09:55:44 +0700
Message-ID: <CACRpkdZ5o=SKtHxshaedkYNETERt6DfiOPtC5JV2LNWKL_mqDg@mail.gmail.com>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
	<1457192586-25596-2-git-send-email-vishnupatekar0510@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1457192586-25596-2-git-send-email-vishnupatekar0510@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>R
List-Id: devicetree@vger.kernel.org

On Sat, Mar 5, 2016 at 10:42 PM, Vishnu Patekar
<vishnupatekar0510@gmail.com> wrote:

> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> interrupt bit is 6th and A83T has one extra pin PL12.
>
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Rob Herring <robh@kernel.org>

As partly noted by others:

> +config PINCTRL_SUN8I_A83T_R
> +       def_bool MACH_SUN8I

bool

> +       depends on RESET_CONTROLLER

Should it rather select RESET_CONTROLLER?

> +static const struct of_device_id sun8i_a83t_r_pinctrl_match[] = {
> +       { .compatible = "allwinner,sun8i-a83t-r-pinctrl", },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, sun8i_a83t_r_pinctrl_match);

Module talk in bool driver.

> +static struct platform_driver sun8i_a83t_r_pinctrl_driver = {
> +       .probe  = sun8i_a83t_r_pinctrl_probe,
> +       .driver = {
> +               .name           = "sun8i-a83t-r-pinctrl",
> +               .of_match_table = sun8i_a83t_r_pinctrl_match,
> +       },
> +};
> +module_platform_driver(sun8i_a83t_r_pinctrl_driver);

Should be builtin?

Yours,
Linus Walleij

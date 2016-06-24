From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 11/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Date: Fri, 24 Jun 2016 12:53:19 +1000
Message-ID: <CAGRGNgWU88xwRRA3Q9tnKc79zq1TfJw6iTB10c3TOmmdH=L3qA@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-12-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623192104.18720-12-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: Linux Sunxi <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ondrej,

On Fri, Jun 24, 2016 at 5:21 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> PLL1 on H3 requires special factors application algorithm,
> when the rate is changed. This algorithm was extracted
> from the arisc code that handles frequency scaling
> in the BSP kernel.
>
> This commit adds optional apply function to
> struct factors_data, that can implement non-trivial
> factors application method, when necessary.
>
> Also struct clk_factors_config is extended with position
> of the PLL lock flag.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi |  2 +-
>  drivers/clk/sunxi/clk-factors.c | 34 +++++++++----------
>  drivers/clk/sunxi/clk-factors.h | 12 +++++++
>  drivers/clk/sunxi/clk-sunxi.c   | 72 +++++++++++++++++++++++++++++++++++++++--
>  4 files changed, 98 insertions(+), 22 deletions(-)

Shouldn't the .dtsi changes be in a separate patch?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

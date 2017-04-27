From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] clk: Provide dummy of_clk_get_from_provider() for compile-testing
Date: Thu, 27 Apr 2017 14:43:24 +0200
Message-ID: <CAMuHMdU+o15+7jZp46KgushRQvyJ=j1btZAu1+e3h4vr4h7Vng@mail.gmail.com>
References: <1493141328-28201-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493141328-28201-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 7:28 PM, Geert Uytterhoeven
<geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> When CONFIG_ON=n, dummies are provided for of_clk_get() and
> of_clk_get_by_name(), but not for of_clk_get_from_provider().
>
> Provide a dummy for the latter, to improve the ability to do
> compile-testing.
>
> Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
>  include/linux/clk.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index e9d36b3e49de5b1b..3ed97abb5cbb7f94 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -539,6 +539,10 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
>  {
>         return ERR_PTR(-ENOENT);
>  }
> +static inline struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
> +{
> +       return ERR_PTR(-ENOENT);
> +}
>  #endif

0day reported an issue with arch/mips/lantiq/clk.c, which defines its own
dummy version:

| arch/mips//lantiq/clk.c:163:13: error: redefinition of
'of_clk_get_from_provider'

I will add its removal to my v2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

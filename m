From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 5/5] simplefb: add clock handling code
Date: Mon, 6 Oct 2014 12:15:04 +0200
Message-ID: <CAMuHMdVDtjkow+Q_6H6Pp-+6mKYOdGP02_FTO4AG6_85K+ij-A@mail.gmail.com>
References: <1412337125-14388-1-git-send-email-hdegoede@redhat.com>
	<1412337125-14388-6-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCQJP74GSUDRBKGXZGQQKGQES3AWJ6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1412337125-14388-6-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Fbdev development list <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 3, 2014 at 1:52 PM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> +static void
> +simplefb_clocks_init(struct platform_device *pdev, struct list_head *list)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       int clock_count, i;
> +
> +       INIT_LIST_HEAD(list);
> +
> +       if (dev_get_platdata(&pdev->dev) || !np)
> +               return;
> +
> +       clock_count = of_clk_get_parent_count(np);
> +       for (i = 0; i < clock_count; i++) {
> +               struct simplefb_clock *entry;
> +               struct clk *clock = of_clk_get(np, i);
> +               int ret;
> +
> +               if (IS_ERR(clock)) {
> +                       dev_err(&pdev->dev, "%s: clock %d not found: %ld\n",
> +                              __func__, i, PTR_ERR(clock));
> +                       continue;
> +               }
> +
> +               ret = clk_prepare_enable(clock);
> +               if (ret) {
> +                       dev_err(&pdev->dev,
> +                               "%s: failed to enable clock %d: %d\n",
> +                              __func__, i, ret);
> +                       clk_put(clock);
> +                       continue;
> +               }
> +
> +               entry = kzalloc(sizeof(struct simplefb_clock), GFP_KERNEL);
> +               if (!entry) {
> +                       clk_disable_unprepare(clock);
> +                       clk_put(clock);
> +                       continue;
> +               }

I'd allocate memory first, to avoid calling clk_disable_unprepare() (which
will kill your display) if memory allocation fails.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

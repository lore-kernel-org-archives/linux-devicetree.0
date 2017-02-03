From: Rask Ingemann Lambertsen <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org>
Subject: Re: [PATCH 3/5] mfd: axp20x: Add support for the AXP808 PMIC
Date: Fri, 3 Feb 2017 22:47:54 +0100
Message-ID: <20170203214753.rbybkadomljcvtdg@localhost>
References: <cover.1485456003.git.rask@formelder.dk>
 <e1d6d6acfaa95e214b6baa73a7edeaa8e6af3670.1485456006.git.rask@formelder.dk>
 <CAGb2v64O7wax5Pku=VVY3rgS2Ybm-=BDQQT+oB13FSGQHhtkiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64O7wax5Pku=VVY3rgS2Ybm-=BDQQT+oB13FSGQHhtkiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 03:23:33PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 27, 2017 at 5:25 AM, Rask Ingemann Lambertsen
> <rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org> wrote:
[...]
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index 25115fe..2d3383e 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
[...]
> > @@ -148,6 +149,13 @@ static const struct regmap_range axp806_writeable_ranges[] = {
> >         regmap_reg_range(AXP806_REG_ADDR_EXT, AXP806_REG_ADDR_EXT),
> >  };
> >
> > +static const struct regmap_range axp808_writeable_ranges[] = {
> > +       regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
> > +       regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
> > +       regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IRQ2_EN),
> > +       regmap_reg_range(AXP20X_IRQ1_STATE, AXP20X_IRQ2_STATE),
> > +};
> > +
> >  static const struct regmap_range axp806_volatile_ranges[] = {
> >         regmap_reg_range(AXP20X_IRQ1_STATE, AXP20X_IRQ2_STATE),
> >  };
> > @@ -162,6 +170,11 @@ static const struct regmap_access_table axp806_volatile_table = {
> >         .n_yes_ranges   = ARRAY_SIZE(axp806_volatile_ranges),
> >  };
> >
> > +static const struct regmap_access_table axp808_writeable_table = {
> > +       .yes_ranges     = axp808_writeable_ranges,
> > +       .n_yes_ranges   = ARRAY_SIZE(axp808_writeable_ranges),
> 
> You could probably get away with using axp806_writeable_ranges,
> and pass ARRAY_SIZE(axp808_writeable_ranges) - 1 for .n_yes_ranges.

Assuming that register ranges not supported on the AXP808 are always
at one end of the table, I think it will ease maintenance by avoiding
duplicate data should entries be added or removed in the future. I'll put
a comment above axp806_writeable_ranges to point out what's going on.

> Or maybe the compiler figures out the 2 arrays share common data.

It doesn't as of gcc 6.2.1.

-- 
Rask Ingemann Lambertsen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

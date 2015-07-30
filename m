From: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Wed, 29 Jul 2015 18:21:32 -0700
Message-ID: <20150730012132.642.59489@quantum>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather> <20150727085338.GW3436@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150727085338.GW3436@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Lee Jones (2015-07-27 01:53:38)
> On Mon, 27 Jul 2015, Maxime Ripard wrote:
>=20
> > On Wed, Jul 22, 2015 at 02:04:13PM +0100, Lee Jones wrote:
> > > These new API calls will firstly provide a mechanisms to tag a cl=
ock as
> > > critical and secondly allow any knowledgeable driver to (un)gate =
clocks,
> > > even if they are marked as critical.
> > >=20
> > > Suggested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/clk/clk.c            | 45 ++++++++++++++++++++++++++++++=
++++++++++++++
> > >  include/linux/clk-provider.h |  2 ++
> > >  include/linux/clk.h          | 30 +++++++++++++++++++++++++++++
> > >  3 files changed, 77 insertions(+)
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 61c3fc5..486b1da 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(const =
char *name);
> > > =20
> > >  /***    private data structures    ***/
> > > =20
> > > +/**
> > > + * struct critical -       Provides 'play' over critical clocks.=
  A clock can be
> > > + *                 marked as critical, meaning that it should no=
t be
> > > + *                 disabled.  However, if a driver which is awar=
e of the
> > > + *                 critical behaviour wants to control it, it ca=
n do so
> > > + *                 using clk_enable_critical() and clk_disable_c=
ritical().
> > > + *
> > > + * @enabled        Is clock critical?  Once set, doesn't change
> > > + * @leave_on       Self explanatory.  Can be disabled by knowled=
geable drivers
> > > + */
> > > +struct critical {
> > > +   bool enabled;
> > > +   bool leave_on;
> > > +};
> > > +
> > >  struct clk_core {
> > >     const char              *name;
> > >     const struct clk_ops    *ops;
> > > @@ -75,6 +90,7 @@ struct clk_core {
> > >     struct dentry           *dentry;
> > >  #endif
> > >     struct kref             ref;
> > > +   struct critical         critical;
> > >  };
> > > =20
> > >  struct clk {
> > > @@ -995,6 +1011,10 @@ static void clk_core_disable(struct clk_cor=
e *clk)
> > >     if (WARN_ON(clk->enable_count =3D=3D 0))
> > >             return;
> > > =20
> > > +   /* Refuse to turn off a critical clock */
> > > +   if (clk->enable_count =3D=3D 1 && clk->critical.leave_on)
> > > +           return;
> > > +
> >=20
> > I think it should be handled by a separate counting. Otherwise, if =
you
> > have two users that marked the clock as critical, and then one of t=
hem
> > disable it...
> >=20
> > >     if (--clk->enable_count > 0)
> > >             return;
> > > =20
> > > @@ -1037,6 +1057,13 @@ void clk_disable(struct clk *clk)
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_disable);
> > > =20
> > > +void clk_disable_critical(struct clk *clk)
> > > +{
> > > +   clk->core->critical.leave_on =3D false;
> >=20
> > .. you just lost the fact that it was critical in the first place.
>=20
> I thought about both of these points, which is why I came up with thi=
s
> strategy.
>=20
> Any device which uses the *_critical() API should a) have knowledge o=
f
> what happens when a particular critical clock is gated and b) have
> thought about the consequences.

If this statement above is true then I fail to see the need for a new
api. A driver which has a really great idea of when it is safe or unsaf=
e
to gate a clock should call clk_prepare_enable at probe and then only
call clk_disable_unprepare once it is safe to do so.

The existing bookkeeping in the clock framework will do the rest.

Regards,
Mike

> I don't think we can use reference
> counting, because we'd need as many critical clock owners as there ar=
e
> critical clocks.  Cast your mind back to the reasons for this critica=
l
> clock API.  One of the most important intentions of this API is the
> requirement mitigation for each of the critical clocks to have an own=
er
> (driver).
>=20
> With regards to your second point, that's what 'critical.enabled'
> is for.  Take a look at clk_enable_critical().
>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

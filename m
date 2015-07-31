From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 09:56:56 +0100
Message-ID: <20150731085656.GD3208@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather>
 <20150727085338.GW3436@x1>
 <20150730012132.642.59489@quantum>
 <20150730092139.GB14642@x1>
 <20150730225729.23791.68604@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150730225729.23791.68604@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jul 2015, Michael Turquette wrote:

> Quoting Lee Jones (2015-07-30 02:21:39)
> > On Wed, 29 Jul 2015, Michael Turquette wrote:
> > > Quoting Lee Jones (2015-07-27 01:53:38)
> > > > On Mon, 27 Jul 2015, Maxime Ripard wrote:
> > > >=20
> > > > > On Wed, Jul 22, 2015 at 02:04:13PM +0100, Lee Jones wrote:
> > > > > > These new API calls will firstly provide a mechanisms to ta=
g a clock as
> > > > > > critical and secondly allow any knowledgeable driver to (un=
)gate clocks,
> > > > > > even if they are marked as critical.
> > > > > >=20
> > > > > > Suggested-by: Maxime Ripard <maxime.ripard@free-electrons.c=
om>
> > > > > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > > > ---
> > > > > >  drivers/clk/clk.c            | 45 ++++++++++++++++++++++++=
++++++++++++++++++++
> > > > > >  include/linux/clk-provider.h |  2 ++
> > > > > >  include/linux/clk.h          | 30 ++++++++++++++++++++++++=
+++++
> > > > > >  3 files changed, 77 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > > index 61c3fc5..486b1da 100644
> > > > > > --- a/drivers/clk/clk.c
> > > > > > +++ b/drivers/clk/clk.c
> > > > > > @@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(=
const char *name);
> > > > > > =20
> > > > > >  /***    private data structures    ***/
> > > > > > =20
> > > > > > +/**
> > > > > > + * struct critical -       Provides 'play' over critical c=
locks.  A clock can be
> > > > > > + *                 marked as critical, meaning that it sho=
uld not be
> > > > > > + *                 disabled.  However, if a driver which i=
s aware of the
> > > > > > + *                 critical behaviour wants to control it,=
 it can do so
> > > > > > + *                 using clk_enable_critical() and clk_dis=
able_critical().
> > > > > > + *
> > > > > > + * @enabled        Is clock critical?  Once set, doesn't c=
hange
> > > > > > + * @leave_on       Self explanatory.  Can be disabled by k=
nowledgeable drivers
> > > > > > + */
> > > > > > +struct critical {
> > > > > > +   bool enabled;
> > > > > > +   bool leave_on;
> > > > > > +};
> > > > > > +
> > > > > >  struct clk_core {
> > > > > >     const char              *name;
> > > > > >     const struct clk_ops    *ops;
> > > > > > @@ -75,6 +90,7 @@ struct clk_core {
> > > > > >     struct dentry           *dentry;
> > > > > >  #endif
> > > > > >     struct kref             ref;
> > > > > > +   struct critical         critical;
> > > > > >  };
> > > > > > =20
> > > > > >  struct clk {
> > > > > > @@ -995,6 +1011,10 @@ static void clk_core_disable(struct c=
lk_core *clk)
> > > > > >     if (WARN_ON(clk->enable_count =3D=3D 0))
> > > > > >             return;
> > > > > > =20
> > > > > > +   /* Refuse to turn off a critical clock */
> > > > > > +   if (clk->enable_count =3D=3D 1 && clk->critical.leave_o=
n)
> > > > > > +           return;
> > > > > > +
> > > > >=20
> > > > > I think it should be handled by a separate counting. Otherwis=
e, if you
> > > > > have two users that marked the clock as critical, and then on=
e of them
> > > > > disable it...
> > > > >=20
> > > > > >     if (--clk->enable_count > 0)
> > > > > >             return;
> > > > > > =20
> > > > > > @@ -1037,6 +1057,13 @@ void clk_disable(struct clk *clk)
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(clk_disable);
> > > > > > =20
> > > > > > +void clk_disable_critical(struct clk *clk)
> > > > > > +{
> > > > > > +   clk->core->critical.leave_on =3D false;
> > > > >=20
> > > > > .. you just lost the fact that it was critical in the first p=
lace.
> > > >=20
> > > > I thought about both of these points, which is why I came up wi=
th this
> > > > strategy.
> > > >=20
> > > > Any device which uses the *_critical() API should a) have knowl=
edge of
> > > > what happens when a particular critical clock is gated and b) h=
ave
> > > > thought about the consequences.
> > >=20
> > > If this statement above is true then I fail to see the need for a=
 new
> > > api. A driver which has a really great idea of when it is safe or=
 unsafe
> > > to gate a clock should call clk_prepare_enable at probe and then =
only
> > > call clk_disable_unprepare once it is safe to do so.
> > >=20
> > > The existing bookkeeping in the clock framework will do the rest.
> >=20
> > I think you are viewing this particular API back-to-front.  The ide=
a
> > is to mark all of the critical clocks at start-up by taking a
> > reference.  Then, if there are no knowledgable drivers who wish to
> > turn the clock off, the CCF will leave the clock ungated becuase th=
e
> > reference count will always be >0.
>=20
> Right. So I'll ask the same question here that I asked in the other
> patch: is there ever a case where a clock consumer driver would want =
to
> call clk_enable_critical? It seems to me that in you usage of it, tha=
t
> call would only ever be made by the core framework code (e.g. clk-con=
f.c
> or perhaps somewhere in drivers/clk/clk.c).

Yes, _after_ it has called clk_disable_critical(), when it has
finished fiddling with it.  clk_enable_critical() simply resets the
clock back to an enabled/critical state (how the knowledgeable driver
found it).

> > The clk_{disable,enable}_critical() calls are to be used by
> > knowledgable drivers to say "[disable] I know what I'm doing and it=
's
> > okay for this clock to be turned off" and "[enable] right I'm done
> > with this clock now, let's turn it back on and mark it back as
> > critical, so no one else can turn it off".
>=20
> OK, so this almost answers my question above. You have a driver that =
may
> finish using a clock for a while (ie, rmmod knowledgeable_driver), an=
d
> you want it (critically) enabled again. Is this a real use case? Who
> would come along and disable this clock later on? If the driver is to=
 be
> re-loaded then I would suggest never unloading it in the first place.

This has nothing to do with modules.  I believe the knowledgeable
consumer should only gate the clock (steal a reference) when the clock
is actually gated.  The rest of the time the framework will have it
marked as critical "do not turn me off".

> (Oh and bear in mind when answering my question above that imbalanced
> clk_enable/clk_disable calls will not succeed thanks to the vaporware
> patch that I have in my local tree)

They won't be imbalanced, because clk_enable() would have been called
first during start-up (__set_critical_clocks()).

> If you have a second knowledgeable_driver_2 that shares that clock an=
d
> can be trusted to manage it (critically) then I would need to see tha=
t
> example, as it doesn't feel like a real use to me.

Nor me, that's why this impementation doesn't handle that use-case,
however Maxime thinks it is one, so we can solve that with reference
counting.

> > To put things simply, the knowledgable driver will _not_ be enablin=
g
> > the clock in the first place.  The first interaction it has with it=
 is
> > to gate it.  Then, once it's done, it will enable it again and mark=
 it
> > back up as critical.a
>=20
> I like the first part. Makes sense and fills a real need. I am fully
> on-board with a provider-handoff-to-consumer solution. It is all the
> weird stuff that comes after it that I'm unsure of.

I don't think there should be hand-off.  I think the
{enable,disable}_critical() should "momentarily" take the last
reference, then put everything back as it found it when it's finished
disabling the clock.

> > Still confused ... let's go on another Q in one of your other email=
s
> > for another way of putting it.
> >=20
> > > > I don't think we can use reference
> > > > counting, because we'd need as many critical clock owners as th=
ere are
> > > > critical clocks.  Cast your mind back to the reasons for this c=
ritical
> > > > clock API.  One of the most important intentions of this API is=
 the
> > > > requirement mitigation for each of the critical clocks to have =
an owner
> > > > (driver).
> > > >=20
> > > > With regards to your second point, that's what 'critical.enable=
d'
> > > > is for.  Take a look at clk_enable_critical().
> > > >=20
> >=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

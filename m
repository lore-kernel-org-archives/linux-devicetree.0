From: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Wed, 29 Jul 2015 18:19:32 -0700
Message-ID: <20150730011932.642.85168@quantum>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather> <20150727085338.GW3436@x1>
 <20150728114022.GW2564@lukather> <20150728130055.GV14943@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150728130055.GV14943@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Lee Jones (2015-07-28 06:00:55)
> On Tue, 28 Jul 2015, Maxime Ripard wrote:
>=20
> > On Mon, Jul 27, 2015 at 09:53:38AM +0100, Lee Jones wrote:
> > > On Mon, 27 Jul 2015, Maxime Ripard wrote:
> > >=20
> > > > On Wed, Jul 22, 2015 at 02:04:13PM +0100, Lee Jones wrote:
> > > > > These new API calls will firstly provide a mechanisms to tag =
a clock as
> > > > > critical and secondly allow any knowledgeable driver to (un)g=
ate clocks,
> > > > > even if they are marked as critical.
> > > > >=20
> > > > > Suggested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> > > > > Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > > > ---
> > > > >  drivers/clk/clk.c            | 45 ++++++++++++++++++++++++++=
++++++++++++++++++
> > > > >  include/linux/clk-provider.h |  2 ++
> > > > >  include/linux/clk.h          | 30 ++++++++++++++++++++++++++=
+++
> > > > >  3 files changed, 77 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > index 61c3fc5..486b1da 100644
> > > > > --- a/drivers/clk/clk.c
> > > > > +++ b/drivers/clk/clk.c
> > > > > @@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(co=
nst char *name);
> > > > > =20
> > > > >  /***    private data structures    ***/
> > > > > =20
> > > > > +/**
> > > > > + * struct critical -   Provides 'play' over critical clocks.=
  A clock can be
> > > > > + *                     marked as critical, meaning that it s=
hould not be
> > > > > + *                     disabled.  However, if a driver which=
 is aware of the
> > > > > + *                     critical behaviour wants to control i=
t, it can do so
> > > > > + *                     using clk_enable_critical() and clk_d=
isable_critical().
> > > > > + *
> > > > > + * @enabled    Is clock critical?  Once set, doesn't change
> > > > > + * @leave_on   Self explanatory.  Can be disabled by knowled=
geable drivers
> > > > > + */
> > > > > +struct critical {
> > > > > +       bool enabled;
> > > > > +       bool leave_on;
> > > > > +};
> > > > > +
> > > > >  struct clk_core {
> > > > >         const char              *name;
> > > > >         const struct clk_ops    *ops;
> > > > > @@ -75,6 +90,7 @@ struct clk_core {
> > > > >         struct dentry           *dentry;
> > > > >  #endif
> > > > >         struct kref             ref;
> > > > > +       struct critical         critical;
> > > > >  };
> > > > > =20
> > > > >  struct clk {
> > > > > @@ -995,6 +1011,10 @@ static void clk_core_disable(struct clk=
_core *clk)
> > > > >         if (WARN_ON(clk->enable_count =3D=3D 0))
> > > > >                 return;
> > > > > =20
> > > > > +       /* Refuse to turn off a critical clock */
> > > > > +       if (clk->enable_count =3D=3D 1 && clk->critical.leave=
_on)
> > > > > +               return;
> > > > > +
> > > >=20
> > > > I think it should be handled by a separate counting. Otherwise,=
 if you
> > > > have two users that marked the clock as critical, and then one =
of them
> > > > disable it...
> > > >=20
> > > > >         if (--clk->enable_count > 0)
> > > > >                 return;
> > > > > =20
> > > > > @@ -1037,6 +1057,13 @@ void clk_disable(struct clk *clk)
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(clk_disable);
> > > > > =20
> > > > > +void clk_disable_critical(struct clk *clk)
> > > > > +{
> > > > > +       clk->core->critical.leave_on =3D false;
> > > >=20
> > > > .. you just lost the fact that it was critical in the first pla=
ce.
> > >=20
> > > I thought about both of these points, which is why I came up with=
 this
> > > strategy.
> > >=20
> > > Any device which uses the *_critical() API should a) have knowled=
ge of
> > > what happens when a particular critical clock is gated and b) hav=
e
> > > thought about the consequences.
> >=20
> > Indeed.
> >=20
> > > I don't think we can use reference counting, because we'd need as
> > > many critical clock owners as there are critical clocks.
> >=20
> > Which we can have if we replace the call to clk_prepare_enable you =
add
> > in your fourth patch in __set_critical_clocks.
>=20
> What should it be replaced with?
>=20
> > > Cast your mind back to the reasons for this critical clock API.  =
One
> > > of the most important intentions of this API is the requirement
> > > mitigation for each of the critical clocks to have an owner
> > > (driver).
> > >=20
> > > With regards to your second point, that's what 'critical.enabled'
> > > is for.  Take a look at clk_enable_critical().
> >=20
> > I don't think this addresses the issue, if you just throw more
> > customers at it, the issue remain with your implementation.
> >=20
> > If you have three customers that used the critical API, and if on o=
f
> > these calls clk_disable_critical, you're losing leave_on.
>=20
> That's the idea.  See my point above, the one you replied "Indeed"
> to.  So when a driver uses clk_disable_critical() it's saying, "I kno=
w
> why this clock is a critical clock, and I know that nothing terrible
> will happen if I disable it, as I have that covered".  So then if it'=
s
> not the last user to call clk_disable(), the last one out the door
> will be allowed to finally gate the clock, regardless whether it's
> critical aware or not.
>=20
> Then, when we come to enable the clock again, the critical aware user
> then re-marks the clock as leave_on, so not critical un-aware user ca=
n
> take the final reference and disable the clock.
>=20
> > Which means that if there's one of the two users left that calls
> > clk_disable on it, the clock will actually be disabled, which is
> > clearly not what we want to do, as we have still a user that want t=
he
> > clock to be enabled.
>=20
> That's not what happens (at least it shouldn't if I've coded it up
> right).  The API _still_ requires all of the users to give-up their
> reference.
>=20
> > It would be much more robust to have another count for the critical
> > stuff, initialised to one by the __set_critical_clocks function.
>=20
> If I understand you correctly, we already have a count.  We use the
> original reference count.  No need for one of our own.
>=20
> Using your RAM Clock (Clock 4) as an example
> --------------------------------------------
>=20
> Early start-up:
>   Clock 4 is marked as critical and a reference is taken (ref =3D=3D =
1)
>=20
> Driver probe:
>   SPI enables Clock 4 (ref =3D=3D 2)
>   I2C enables Clock 4 (ref =3D=3D 3)
>=20
> Suspend (without RAM driver's permission):
>   SPI disables Clock 4 (ref =3D=3D 2)
>   I2C disables Clock 4 (ref =3D=3D 1)
>   /*
>    * Clock won't be gated because:
>    *   .leave_on is True - can't dec final reference

I am clearly missing the point. The clock won't be gated because the
enable_count is still 1! What does .leave_on do here?

>    */
>=20
> Suspend (with RAM driver's permission):
>   /* Order is unimportant */
>   SPI disables Clock 4 (ref =3D=3D 2)
>   RAM disables Clock 4 (ref =3D=3D 1) /* Won't turn off here (ref > 0=
)
>   I2C disables Clock 4 (ref =3D=3D 0) /* (.leave_on =3D=3D False) las=
t ref can be taken */
>   /*
>    * Clock will be gated because:
>    *   .leave_on is False, so (ref =3D=3D 0)

Again, .leave_on does nothing new here. We gate the clock because the
reference count is 0.

>    */
>=20
> Resume:
>   /* Order is unimportant */
>   SPI enables Clock 4 (ref =3D=3D 1)
>   RAM enables Clock 4 and re-enables .leave_on (ref =3D=3D 2)
>   I2C enables Clock 4 (ref =3D=3D 3)

Same again. As soon as RAM calls clk_enable_critical the ref count goes
up. .leave_on does nothing as far as I can tell. The all works because
of the reference counting, which already exists before this patch
series.

Regards,
Mike

>=20
> Hopefully that clears things up.
>=20
> Please tell me if the code doesn't reflect this strategy, or if you
> can see anything wrong with how it operates.
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

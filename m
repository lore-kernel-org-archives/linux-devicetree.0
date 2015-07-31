From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 10:02:19 +0100
Message-ID: <20150731090219.GE3208@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150730010213.642.10831@quantum>
 <20150730111747.GF14642@x1>
 <20150730233530.23791.17746@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150730233530.23791.17746@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, maxime.ripard@free-electrons.com, s.hauer@pengutronix.de, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jul 2015, Michael Turquette wrote:

> Quoting Lee Jones (2015-07-30 04:17:47)
> > On Wed, 29 Jul 2015, Michael Turquette wrote:
> >=20
> > > Hi Lee,
> > >=20
> > > + linux-clk ml
> > >=20
> > > Quoting Lee Jones (2015-07-22 06:04:13)
> > > > These new API calls will firstly provide a mechanisms to tag a =
clock as
> > > > critical and secondly allow any knowledgeable driver to (un)gat=
e clocks,
> > > > even if they are marked as critical.
> > > >=20
> > > > Suggested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/clk/clk.c            | 45 ++++++++++++++++++++++++++++=
++++++++++++++++
> > > >  include/linux/clk-provider.h |  2 ++
> > > >  include/linux/clk.h          | 30 ++++++++++++++++++++++++++++=
+
> > > >  3 files changed, 77 insertions(+)
> > > >=20
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 61c3fc5..486b1da 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -46,6 +46,21 @@ static struct clk_core *clk_core_lookup(cons=
t char *name);
> > > > =20
> > > >  /***    private data structures    ***/
> > > > =20
> > > > +/**
> > > > + * struct critical -   Provides 'play' over critical clocks.  =
A clock can be
> > > > + *                     marked as critical, meaning that it sho=
uld not be
> > > > + *                     disabled.  However, if a driver which i=
s aware of the
> > > > + *                     critical behaviour wants to control it,=
 it can do so
> > > > + *                     using clk_enable_critical() and clk_dis=
able_critical().
> > > > + *
> > > > + * @enabled    Is clock critical?  Once set, doesn't change
> > > > + * @leave_on   Self explanatory.  Can be disabled by knowledge=
able drivers
> > >=20
> > > Not self explanatory. I need this explained to me. What does leav=
e_on
> > > do? Better yet, what would happen if leave_on did not exist?
> > >=20
> > > > + */
> > > > +struct critical {
> > > > +       bool enabled;
> > > > +       bool leave_on;
> > > > +};
> > > > +
> > > >  struct clk_core {
> > > >         const char              *name;
> > > >         const struct clk_ops    *ops;
> > > > @@ -75,6 +90,7 @@ struct clk_core {
> > > >         struct dentry           *dentry;
> > > >  #endif
> > > >         struct kref             ref;
> > > > +       struct critical         critical;
> > > >  };
> > > > =20
> > > >  struct clk {
> > > > @@ -995,6 +1011,10 @@ static void clk_core_disable(struct clk_c=
ore *clk)
> > > >         if (WARN_ON(clk->enable_count =3D=3D 0))
> > > >                 return;
> > > > =20
> > > > +       /* Refuse to turn off a critical clock */
> > > > +       if (clk->enable_count =3D=3D 1 && clk->critical.leave_o=
n)
> > > > +               return;
> > >=20
> > > How do we get to this point? clk_enable_critical actually calls
> > > clk_enable, thus incrementing the enable_count. The only time tha=
t we
> > > could hit the above case is if,
> > >=20
> > > a) there is an imbalance in clk_enable and clk_disable calls. If =
this is
> > > the case then the drivers need to be fixed. Or better yet some
> > > infrastructure to catch that, now that we have per-user struct cl=
k
> > > cookies.
> > >=20
> > > b) a driver knowingly calls clk_enable_critical(foo) and then reg=
ular,
> > > old clk_disable(foo). But why would a driver do that?
> > >=20
> > > It might be that I am missing the point here, so please feel free=
 to
> > > clue me in.
> >=20
> > This check behaves in a very similar to the WARN() above.  It's mor=
e
> > of a fail-safe.  If all drivers are behaving properly, then it
> > shouldn't ever be true.  If they're not, it prevents an incorrectly
> > written driver from irrecoverably crippling the system.
>=20
> Then this check should be replaced with a generic approach that refus=
es
> to honor imbalances anyways. Below are two patches that probably reso=
lve
> the issue of badly behaving drivers that cause enable imbalances.

Your patch should make the requirement for this check moot, so it can
probably be removed.

> > As I said in the other mail.  We can do without these 3 new wrapper=
s.
> > We _could_ just write a driver which only calls clk_enable() _after=
_
> > it calls clk_disable(), a kind of intentional unbalance and it woul=
d
> > do that same thing.
>=20
> This naive approach will not work with per-user imbalance tracking.

Steady on.  I said we "_could_", that that I think it's a good idea.

I think it's a bad idea, which is why I wrote this set. ;)

> > However, what we're trying to do here is provide
> > a proper API, so we can see at first glance what the 'knowledgeable=
'
> > driver is trying to do and not have someone attempt to submit a 'fi=
x'
> > which calls clk_enable() or something.
>=20
> We'll need some type of api for sure for the handoff.

This set will not trigger your new checks.  The clocks will be in
perfect ballance becuase a reference will be taken at start-up.

Again:

start-up:
  clk_prepare_enable()

knowlegable_driver_probe:
  clk_get()

knowlegable_driver_gate_clk:
  clk_disable_critical()

knowlegable_driver_ungate_clk:
  clk_enable_critical()

knowlegable_driver_remove:
  clk_put()

> From 3599ed206da9ce770bfafcfd95cbb9a03ac44473 Mon Sep 17 00:00:00 200=
1
> From: Michael Turquette <mturquette@baylibre.com>
> Date: Wed, 29 Jul 2015 18:22:45 -0700
> Subject: [PATCH 1/2] clk: per-user clk prepare & enable ref counts
>=20
> This patch adds prepare and enable reference counts for the per-user
> handles that clock consumers have for a clock node. This patch warns =
if
> an imbalance occurs while trying to disable or unprepare a clock and
> aborts, leaving the hardware unaffected.
>=20
> Signed-off-by: Michael Turquette <mturquette@baylibre.com>
> ---
>  drivers/clk/clk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 898052e..72feee9 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -84,6 +84,8 @@ struct clk {
>  	unsigned long min_rate;
>  	unsigned long max_rate;
>  	struct hlist_node clks_node;
> +	unsigned int enable_count;
> +	unsigned int prepare_count;
>  };
> =20
>  /***           locking             ***/
> @@ -600,6 +602,9 @@ void clk_unprepare(struct clk *clk)
>  		return;
> =20
>  	clk_prepare_lock();
> +	if (WARN_ON(clk->prepare_count =3D=3D 0))
> +		return;
> +	clk->prepare_count--;
>  	clk_core_unprepare(clk->core);
>  	clk_prepare_unlock();
>  }
> @@ -657,6 +662,7 @@ int clk_prepare(struct clk *clk)
>  		return 0;
> =20
>  	clk_prepare_lock();
> +	clk->prepare_count++;
>  	ret =3D clk_core_prepare(clk->core);
>  	clk_prepare_unlock();
> =20
> @@ -707,6 +713,9 @@ void clk_disable(struct clk *clk)
>  		return;
> =20
>  	flags =3D clk_enable_lock();
> +	if (WARN_ON(clk->enable_count =3D=3D 0))
> +		return;
> +	clk->enable_count--;
>  	clk_core_disable(clk->core);
>  	clk_enable_unlock(flags);
>  }
> @@ -769,6 +778,7 @@ int clk_enable(struct clk *clk)
>  		return 0;
> =20
>  	flags =3D clk_enable_lock();
> +	clk->enable_count++;
>  	ret =3D clk_core_enable(clk->core);
>  	clk_enable_unlock(flags);
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

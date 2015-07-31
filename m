From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 09:32:07 +0100
Message-ID: <20150731083207.GB3208@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather>
 <20150727085338.GW3436@x1>
 <20150728114022.GW2564@lukather>
 <20150728130055.GV14943@x1>
 <20150730011932.642.85168@quantum>
 <20150730095014.GD14642@x1>
 <20150730224720.23791.6722@quantum>
 <20150731073019.GU2564@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150731073019.GU2564@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 31 Jul 2015, Maxime Ripard wrote:

> On Thu, Jul 30, 2015 at 03:47:20PM -0700, Michael Turquette wrote:
> > > > >    */
> > > > >=20
> > > > > Resume:
> > > > >   /* Order is unimportant */
> > > > >   SPI enables Clock 4 (ref =3D=3D 1)
> > > > >   RAM enables Clock 4 and re-enables .leave_on (ref =3D=3D 2)
> > > > >   I2C enables Clock 4 (ref =3D=3D 3)
> > > >=20
> > > > Same again. As soon as RAM calls clk_enable_critical the ref co=
unt goes
> > > > up. .leave_on does nothing as far as I can tell. The all works =
because
> > > > of the reference counting, which already exists before this pat=
ch
> > > > series.
> > >=20
> > > So fundamentally you're right in what you say.  All you really ne=
ed to
> > > disable a critical clock is write a knowledgeable driver, which i=
s
> > > intentionally unbalanced i.e. just calls clk_disable().  All this
> >=20
> > OK, the line above is helpful. What you really want is a formalized
> > hand-off mechanism, whereby the clock is enabled at registration-ti=
me
> > and it cannot be turned off until the right driver claims it and de=
cides
> > turning it off is OK (with a priori knowledge that the clock is alr=
eady
> > enabled).
>=20
> There's two things that should be covered, and are related, yet can b=
e
> done in two steps:
>=20
>   - Have a way to, no matter what (which configuration we have, if we
>     have multiple users or not that might reparent or disable their
>     clocks, etc.), make sure that a clock will always be running by
>     default. This is done through the call in clk-conf, and we
>     identify such clocks using critical-clocks in the DT.
>=20
>   - Now, even though that information is true, some driver who are
>     aware of that fact might want to disable those critical
>     clocks. This is what the clk_disable_critical and
>     clk_enable_critical functions are here for.

+1

> > Note that I don't think this implementation can really work in the =
near
> > future. Today we do not catch unbalanced calls to clk_enable and
> > clk_disable, but I have a patch that catches this and WARNs loudly =
in my
> > private tree. More on that in the next stanza.
> >=20
> > What I don't understand is if there is ever a case for a clock cons=
umer
> > driver to ever call clk_enable_critical... I do not think there is.=
 What
> > you're trying to protect against is having the clock disabled BEFOR=
E
> > that "knowledgeable driver" has a chance to enable it.

In my mind and in this implementation  clk_disable_critical() will be
used _first_ by the knowledgeable driver, then when the knowledgeable
driver has finished whatever it was doing (shutting down banks of RAM
etc...), it should then call clk_enable_critical() to reset the clock
state back to the way it found it i.e. enabled and marked as critical.

> It's really about what we want the API to look like in the second
> case.
>=20
> Do we want such drivers to still call clk_prepare_enable? Some other
> function? Should they assume that the clock has already been enabled,
> or do we want a handover, or a force disable, or whatever.
>=20
> I guess we should discuss those questions, before starting to think
> about how to implement it.
>=20
> IMHO, I think that the existing way of doing should be used, or at
> least with the same mindset to avoid confusion, errors, and
> misinformed reviews.
>=20
> So I'd expect the drivers to do something like:
>=20
> probe:
>   clk_get
>   clk_critical_enable

Well becuase the clock has been marked as critical, a reference has
already been taken, so even if there are 0 users the clock now has 2
references attributed to it.

> remove / probe error path:
>   clk_critical_disable
>   clk_put

I think we should assume that the clock is already running in the
knowledgeable driver:

start-up:
  __set_critical_clocks()

probe:
  clk_get()

suspend (or whatever reason the driver wishes to disable the clk):
  clk_disable_critical()

resume (or whatever ...):
  clk_enable_critical()

remove:
  clk_put() /* Or just rely on devm_*() */=20

> and use the clk_critical_enable and clk_critical_disable whenever
> needed, and thing would just work as intended.

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

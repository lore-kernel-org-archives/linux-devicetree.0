From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Thu, 21 Jul 2016 11:48:52 +0200
Message-ID: <20160721094852.GI5993@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h22Fi9ANawrtbNPX"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBBNVYK6AKGQEJ2TXPUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 12:38:54PM +0200, Ond=C5=99ej Jirman wrote:
> On 15.7.2016 10:53, Maxime Ripard wrote:
> > On Fri, Jul 01, 2016 at 02:50:57AM +0200, Ond=C5=99ej Jirman wrote:
> >>>>  /**
> >>>> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to th=
e
> >>>> + * register using an algorithm that tries to reserve the PLL lock
> >>>> + */
> >>>> +
> >>>> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors=
, struct factors_request *req)
> >>>> +{
> >>>> +	const struct clk_factors_config *config =3D factors->config;
> >>>> +	u32 reg;
> >>>> +
> >>>> +	/* Fetch the register value */
> >>>> +	reg =3D readl(factors->reg);
> >>>> +
> >>>> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
> >>>> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> >>>> +
> >>>> +		writel(reg, factors->reg);
> >>>> +		__delay(2000);
> >>>> +	}
> >>>
> >>> So there was some doubts about the fact that P was being used, or at
> >>> least that it was useful.
> >>
> >> p is necessary to reduce frequencies below 288 MHz according to the
> >> datasheet.
> >=20
> > Yes, but you could reach those frequencies without P, too, and it's
> > not part of any OPP provided by Allwinner.
>=20
> The arisc firmware for H3 contains table of factors for frequences from
> 0 to 2GHz and, P is used below 240MHz. M is never used, BTW. (other
> datasheets specify M as for testing use only, whatever that means - not
> H3, but it seems it's the same PLL block)

Interesting. Which SoCs in particular?

> >>>> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
> >>>> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> >>>> +
> >>>> +		writel(reg, factors->reg);
> >>>> +		__delay(2000);
> >>>> +	}
> >>>> +
> >>>> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
> >>>> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
> >>>> +
> >>>> +	writel(reg, factors->reg);
> >>>> +	__delay(20);
> >>>> +
> >>>> +	while (!(readl(factors->reg) & (1 << config->lock)));
> >>>
> >>> So, they are applying the dividers first, and then applying the
> >>> multipliers, and then wait for the PLL to stabilize.
> >>
> >> Not exactly, first we are increasing dividers if the new dividers are
> >> higher that that what's already set. This ensures that because
> >> application of dividers is immediate by the design of the PLL, the
> >> application of multipliers isn't. So the VCO would still run at the sa=
me
> >> frequency for a while gradually rising to a new value for example,
> >> while the dividers would be reduced immediately. Leading to crash.
> >>
> >> PLL
> >> --------------------------
> >> PRE DIV(f0) -> VCO(f1) -> POST DIV(f2)
> >>    P             K,N           M
> >>
> >> Example: (we set all factors at once, reducing dividers and multiplier=
s
> >> at the same time at 0ms - this should lead to no change in the output
> >> frequency, but...)
> >>
> >> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
> >>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 2GHz       - boom
> >>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 1.5GHz
> >>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz
> >>
> >> The current code crashes exactly at boom, you don't get any more
> >> instructions to execute.
> >>
> >> See.
> >>
> >> So this patch first increases dividers (only if necessary), changes
> >> multipliers and waits for change to happen (takes around 2000 cycles),
> >> and then decreases dividers (only if necessary).
> >>
> >> So we get:
> >>
> >> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
> >>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz   - no boom, multiplier
> >>                                              reduced
> >>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 0.75GHz
> >> 1.9ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 0.5GHz - we got PLL sync
> >>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz   - and here we reduce =
divider
> >> at last
> >=20
> > Awesome explanation, thanks!
> >=20
> > So I guess it really all boils down to the fact that the CPU is
> > clocked way outside of it's operating frequency while the PLL
> > stabilizes, right?
>=20
> It may be, depending on the factors before and after change. I haven't
> tested what factors the mainline kernel calculates for each frequency.
> The arisc never uses M, and only uses P at frequencies that would not
> allow for this behavior.
>=20
> I created a test program for arisc that runs a loop on the main CPU
> using msgbox to send pings to the arisc CPU, and the vary the PLL1
> randomly from the arisc, and haven't been able to lockup the main CPU
> yet with either method.
>=20
> There's also AXI clock, that depends on PLL1. Arisc firmware uses the
> same method to change it while changing CPUX clock. If the clock would
> rise above certain frequency, AXI divider is increased before the PLL1
> change. If it would fall below certain frequency it is decreased after
> the PLL1 change.

If we ever need to change that, we can always rely on a clock notifier
to adjust the divider before the change happen (and support all the
scenarios, like the clock change has been aborted).

> > If so, then yes, trying to switch to the 24MHz oscillator before
> > applying the factors, and then switching back when the PLL is stable
> > would be a nice solution.
> >=20
> > I just checked, and all the SoCs we've had so far have that
> > possibility, so if it works, for now, I'd like to stick to that.
>=20
> It would need to be tested. U-boot does the change only once, while the
> kernel would be doing it all the time and between various frequencies
> and PLL settings. So the issues may show up with this solution too.

That would have the benefit of being quite easy to document, not be a
huge amount of code and it would work on all the CPUs PLLs we have so
far, so still, a pretty big win. If it doesn't, of course, we don't
really have the choice.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--h22Fi9ANawrtbNPX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkJqEAAoJEBx+YmzsjxAg5Y0QALJUsJ4QDat3R0NBh3nzYJoR
E7iX8jbziJiUG3p5aDTPmulFkA4+dsVnXyO3UuzrCHCuQjx2Qe3UrF4vE5Op2vFn
APNvdd39Os8pOm5/vheXqIawTaqushQ/G3HmP7xiPPZEU/fY03vpJbDciAxO6VPq
0IdnA6+/q5Rk7D7QqXV47z5arEZO2/Mjy2xsNqHWCB79k/ZqUifX4dueCgkpSSVy
GqOFe8ywR6lk/SmhLH9qDctI7SbBEuZMVAbfflfYfbsSLPGHaYPDnXZyp/i/kvUZ
cSHJ1cy04DHmj6QFzSM3WMJ8+AHcAHFyP+yUGcBz1mLnFvowgQyQjJfrQIigPYlO
K+zruBSSSPLavh1O2FNEFUjGqgTTj+UrCUg5hla6/o55HOQn+4NuZMFO6SvgJz/W
OsRC2swKWl098soJmlAh8375+4bxT3XI3DojicGMmET/1lJhVV6fcDXAqrZqCFDr
SSpVRSlCHtTP3gvdwWRV4FSUqSl1Y+eXY14hFOy0N2tWV80TRutzDYFw8D/5YFXr
mF/j3r/JMaZ+Dun3z2NA8wVqhqrMfbxgaA2gp/BPseoxOnBTb7y8pNgky9gZo69a
tYiL+tJWLdMNgzhZxOZ3PTDf3u22a+/Atc8iOPhAFjJXk+wkP16XeMUHEvOJ+b9l
lkvVdJ5sXa34YUB/raMk
=eYEg
-----END PGP SIGNATURE-----

--h22Fi9ANawrtbNPX--

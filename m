From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Fri, 15 Jul 2016 10:53:56 +0200
Message-ID: <20160715085356.GR4761@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8Bx+wEju+vH9ym24"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDHNUK6AKGQEWQ4LAKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <0b71ed7e-98c9-109e-85e6-ceb95131d88a-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8Bx+wEju+vH9ym24
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 02:50:57AM +0200, Ond=C5=99ej Jirman wrote:
> >>  /**
> >> + * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
> >> + * register using an algorithm that tries to reserve the PLL lock
> >> + */
> >> +
> >> +static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, =
struct factors_request *req)
> >> +{
> >> +	const struct clk_factors_config *config =3D factors->config;
> >> +	u32 reg;
> >> +
> >> +	/* Fetch the register value */
> >> +	reg =3D readl(factors->reg);
> >> +
> >> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
> >> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> >> +
> >> +		writel(reg, factors->reg);
> >> +		__delay(2000);
> >> +	}
> >=20
> > So there was some doubts about the fact that P was being used, or at
> > least that it was useful.
>=20
> p is necessary to reduce frequencies below 288 MHz according to the
> datasheet.

Yes, but you could reach those frequencies without P, too, and it's
not part of any OPP provided by Allwinner.

> >> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
> >> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> >> +
> >> +		writel(reg, factors->reg);
> >> +		__delay(2000);
> >> +	}
> >> +
> >> +	reg =3D FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
> >> +	reg =3D FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
> >> +
> >> +	writel(reg, factors->reg);
> >> +	__delay(20);
> >> +
> >> +	while (!(readl(factors->reg) & (1 << config->lock)));
> >=20
> > So, they are applying the dividers first, and then applying the
> > multipliers, and then wait for the PLL to stabilize.
>=20
> Not exactly, first we are increasing dividers if the new dividers are
> higher that that what's already set. This ensures that because
> application of dividers is immediate by the design of the PLL, the
> application of multipliers isn't. So the VCO would still run at the same
> frequency for a while gradually rising to a new value for example,
> while the dividers would be reduced immediately. Leading to crash.
>=20
> PLL
> --------------------------
> PRE DIV(f0) -> VCO(f1) -> POST DIV(f2)
>    P             K,N           M
>=20
> Example: (we set all factors at once, reducing dividers and multipliers
> at the same time at 0ms - this should lead to no change in the output
> frequency, but...)
>=20
> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 2GHz       - boom
>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 1.5GHz
>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz
>=20
> The current code crashes exactly at boom, you don't get any more
> instructions to execute.
>=20
> See.
>=20
> So this patch first increases dividers (only if necessary), changes
> multipliers and waits for change to happen (takes around 2000 cycles),
> and then decreases dividers (only if necessary).
>=20
> So we get:
>=20
> -1ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz
>  0ms: f0 =3D 24MHz, f1 =3D 2GHz,   f2 =3D 1GHz   - no boom, multiplier
>                                              reduced
>  1ms: f0 =3D 24MHz, f1 =3D 1.5GHz, f2 =3D 0.75GHz
> 1.9ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 0.5GHz - we got PLL sync
>  2ms: f0 =3D 24MHz, f1 =3D 1GHz,   f2 =3D 1GHz   - and here we reduce div=
ider
> at last

Awesome explanation, thanks!

So I guess it really all boils down to the fact that the CPU is
clocked way outside of it's operating frequency while the PLL
stabilizes, right?

If so, then yes, trying to switch to the 24MHz oscillator before
applying the factors, and then switching back when the PLL is stable
would be a nice solution.

I just checked, and all the SoCs we've had so far have that
possibility, so if it works, for now, I'd like to stick to that.

> >> +
> >> +	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
> >> +		reg =3D FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
> >> +
> >> +		writel(reg, factors->reg);
> >> +		__delay(2000);
> >> +	}
> >> +
> >> +	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
> >> +		reg =3D FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
> >> +
> >> +		writel(reg, factors->reg);
> >> +		__delay(2000);
> >> +	}
> >=20
> > However, this is kind of weird, why would you need to re-apply the
> > dividers? Nothing really changes. Have you tried without that part?
>=20
> See above, we either increase before PLL change, or reduce dividers
> after the change. Nothing is re-applied.
>=20
> > Since this is really specific, I guess you could simply make the
> > clk_ops for the nkmp clocks public, and just re-implement set_rate
> > using that logic.
>=20
> I would argue that this may be necessary for other PLL clocks too, if
> you can get out of bounds output frequency, by changing the dividers too
> early or too late. So perhaps this code should be generalized for other
> PLL clocks too, instead.

We can scale down the problem a bit. The only PLL we modify are the
CPU, audio and video ones.

The CPU should definitely be addressed, but what would be the outcome
of an out of bounds audio pll for example? Is it just taking more time
to stabilize, or would it hurt the system?

In the former case, then we can just wait. In the latter, we of course
need to come up with a solution.

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

--8Bx+wEju+vH9ym24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiKSkAAoJEBx+YmzsjxAgNoMQAI+kuGYhyCePtrLg7hMHyr2/
O8v1bXk3i5qnrzwMRVWu5UuwGzNcDFbKYOxG8xYDpT0jJpypUbcbt5xSEngv5yhT
7LiNzGH8/3iTWSxKKiayTHHaqieSf/Hhbh8o1hwRuTt6LPxaoeEDZumcO6jN9GYD
SDCi+voqGNkzzbeNLoXKv6tm4hN0XHsg2oJwkjmxP3RuIaz4PYDCVg844X6ypeNJ
9Owq/4KYSOJ5VWbUzjLf3QDTONv5oa/dXoL1mM1AI/VbHY+haNBpHSqtTrztqiDL
IA0z98HnsGxREQT8itiHhFAkB2qS1fn1IBV6xkl+SKbh1dRs0K2AcueQJTZnzx75
aEN9Ff2+JN4aowPN5a+DBcp8krlPf6THE2jrrdQp5XncFmVIkTiufgzJK2ITUCvq
E2S3axawqo2OhKvTxVkR0PV1EcTmmtFK9VUdHLffF4jUTbfZ6dTF9kt+/S+6Oju8
kN0Xo8ann0RqOBXVeEFUvAB92Kb54HAOMmFqaEgZ2YGJ+tkfP/phBS7hMIbWuVhT
fZ9xSSTrHz/iCn/sTtqj9b1CPkej7fi3eoFVUdsiMb5S/A3OD11ncSlTi2eP8Ap/
yk2kjT86v4Zm0Q+Uh+33jthNkFrKBK4cYhyKl6V0Tf39gC6tUJ1pkCIPPXzw0Qeq
cC0fYvdx6PmTFVO46x+b
=D1Me
-----END PGP SIGNATURE-----

--8Bx+wEju+vH9ym24--

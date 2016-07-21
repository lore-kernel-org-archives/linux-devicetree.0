From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Thu, 21 Jul 2016 11:51:08 +0200
Message-ID: <20160721095108.GJ5993@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160715152756.db7375a7109fed18c2fbf43a@free.fr>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF5WYK6AKGQEKLA5NHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160715152756.db7375a7109fed18c2fbf43a-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 03:27:56PM +0200, Jean-Francois Moine wrote:
> On Fri, 15 Jul 2016 12:38:54 +0200
> Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>=20
> > > If so, then yes, trying to switch to the 24MHz oscillator before
> > > applying the factors, and then switching back when the PLL is stable
> > > would be a nice solution.
> > >=20
> > > I just checked, and all the SoCs we've had so far have that
> > > possibility, so if it works, for now, I'd like to stick to that.
> >=20
> > It would need to be tested. U-boot does the change only once, while the
> > kernel would be doing it all the time and between various frequencies
> > and PLL settings. So the issues may show up with this solution too.
>=20
> I don't think this is a good idea: the CPU clock may be changed at any
> time with the CPUFreq governor. I don't see the system moving from
> 1008MHz to 24MHz and then to 1200MHz when some computation is needed!

It wouldn't happen that often. The sampling rate for the governor is
1000 times the latency, so, at most, 0.1% of the time would be spent
at 24MHz.

And if you're really concerned about performances, you won't enable
cpufreq anyway.

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

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkJsMAAoJEBx+YmzsjxAgpnsP/2Y+BwDtxpeO0WM//Fdx5OTJ
UUfKZ9grwq1G+MODQwJRSGAuSfJ/1jOt2FRuDyXy9LWoosDvGEdUN//ZYHqMps5I
YdTy4TWt1+Zb5phVNnHH4h3Vhim2lp98EF0ExUne+gsNUUnmM/XC+JFpqu+H1gcI
IjIkqeSfDouagPAya56gOpD9szoMYfEub7+S9yZg8VzXpT5KsgTWZpGv5Iy3TjLX
l4xkb5XR/wvuF8yzVAF819tx3BJ/S/e2R9iSlJMgcfDgoqWntKqLMGXAUedGnCAI
iDAdW4ODZd2JHRHsyN9WTHnwQA6Gt4Bn02ddgO1uQC3GXK2gFfcvfvLfWmL7lVq5
re6dKca1agctgpF5PoaID2Di6ONf8NHuA2i+Ja9goiADMOpzFWnkemQ9NRPd3YXA
laPcEEcVZdBq8PAGwJVBX1EJbQhTsZtkPp1U3kKoRgy1RAZki/ba3JdiI5e9PX8Q
2NvG+7qaFS5d8oTdNL3qv/XgOp7xgVDWaunxQ9dPnqIFwd0AtAzcKOXfh8CZJdXC
7NVcTxrWASkD93LJ8pMycf2J9p+dMoDtZ2YmQVGLynYP4K0ilqmtfa4UQVB+wm1B
9UBemYPI7Xkq9Ctvmn1yb7RrnjjVkLzt4P+wYdIhncDJuQdCEeiRMhBmwPFhRvIT
D+j+g4ngmve0xuJeuXlf
=FHNS
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--

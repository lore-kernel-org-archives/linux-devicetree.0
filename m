From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor
 rate application method
Date: Fri, 15 Jul 2016 10:19:54 +0200
Message-ID: <20160715081954.GQ4761@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <64d0c1e2-d818-0806-7c92-c10603b4f6f5@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBC7NUK6AKGQEQ3R7QSA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <64d0c1e2-d818-0806-7c92-c10603b4f6f5-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 02:53:52AM +0200, Ond=C5=99ej Jirman wrote:
> On 30.6.2016 22:40, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> >> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >>
> >> PLL1 on H3 requires special factors application algorithm,
> >> when the rate is changed. This algorithm was extracted
> >> from the arisc code that handles frequency scaling
> >> in the BSP kernel.
> >>
> >> This commit adds optional apply function to
> >> struct factors_data, that can implement non-trivial
> >> factors application method, when necessary.
> >>
> >> Also struct clk_factors_config is extended with position
> >> of the PLL lock flag.
> >=20
> > Have you tested the current implementation, and found that it was not
> > working, or did you duplicate the arisc code directly?
>=20
> Also of note is that similar code probably doesn't crash in u-boot,
> because there, before changing the PLL1 clock, the cpu is switched to
> 24MHz osc, so it is not overclocked, even if factors align in such a way
> that you'd get the behavior I described in the other email.

That's also something that we can do.

See Meson's clk-cpu clock notifiers for example.

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

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiJypAAoJEBx+YmzsjxAgSs0P/0G2WFzLS1PHJsg6b9XWjgTE
K9fr+5ri3JGAInOPUK5pHfSS9kUnuEFkimxQ3uY6Kj6vncgCRC3bbBijaj8hEb2A
l48gDzezU7cbSLhqIb5xUEJEXFHTRkLiq56vy39ctBNQN/Nx3CuQ0nny9FbIBN8i
VDEabw1YhDdKiYlrgo1perkd23U2V+IRqrufPXRmK8kIRIJxZ5O5eP0FMAoTAQEg
b3Ugd67K7561jaieYrQkIEe9sIjo7bFqyCJLIQeySgEUbNP+JvOjEzun5X0L6wxb
BUL7VN+x6Ew7GbZQzEzRA0QEr2mNqJnpqKNdjmDUZ/LGtRbtg0aymVmmHy+g5VTs
E2A8lFKtA7GnavxmxhjWmPltg352+xCQ7IHQjAhUyEuk1Iqcb5dBdJK0/YlcyyMG
2vgvpy0kIX2PeE44ncdKB6xJu4YFbrTUrxeCGXQgwvsrAnIVr4AOvh4PB0rxwVFe
+rCrmgB5DLhGvw4jRqSqvdd4bM2kfY9dxh7BT34tW5HfB3pHu+m3J1nV1UV4X1tx
PAd75nA/gvG4hRqpIcQkaTTuOJ0FgUqBXD3zT9VFP77NEFgCr/rJjUYlYCY9J+zY
Mr4UA3jPk/G1mOdZ6xa6LNh6TWQ3SdmNakTQBB8y0ssilg4DCHt9OIq3+asyEUuP
Qg53ZBgMnBD46c67ntAD
=k0t/
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--

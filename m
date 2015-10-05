From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: "clk: sunxi: Add a simple gates driver" breaks kernel with older
 DTB
Date: Mon, 5 Oct 2015 14:29:52 +0200
Message-ID: <20151005122952.GJ2696@lukather>
References: <1443689231.16718.225.camel@citrix.com>
 <20151001204506.GR7104@lukather>
 <560E5767.2040502@citrix.com>
 <20151002105333.GA2696@lukather>
 <560E6768.6040705@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PWfwoUCx3AFJRUBq"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560E6768.6040705@citrix.com>
Sender: linux-clk-owner@vger.kernel.org
To: Julien Grall <julien.grall@citrix.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, KumarGala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "freebsd-arm@freebsd.org" <freebsd-arm@FreeBSD.org>
List-Id: devicetree@vger.kernel.org


--PWfwoUCx3AFJRUBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;3803;0c
On Fri, Oct 02, 2015 at 12:15:52PM +0100, Julien Grall wrote:
> On 02/10/15 11:53, Maxime Ripard wrote:
> >> If no, that's very unfortunate because it means that you can't
> >> re-use the same DT across multiple OS and the DT provided by the
> >> firmware (if it's built-in).
> >=20
> > Is there such OS yet (and by that, I mean one that actually shares our
> > DT, instead of rewriting its own) ?
>=20
> Yes, FreeBSD started to support the DT provided by vendors which are
> based on Linux bindings. The ARM64 port is only using DTB provided by
> the hardware. For ARM32, there is still some platform using a specific
> DT for FreeBSD but they are trying to get a ride.

Well, it would have been good if they contacted us in the first place
then, because this has never been considered seriously afaik, and we
never stated that it actually was an ABI.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PWfwoUCx3AFJRUBq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEm1AAAoJEBx+YmzsjxAgPGgP/2bJvcUNNNST6oRh5TGpu2kY
1B/+N34aE81+/fTHu2ZlqgI965r20aHaLKUxCes9YmI1B4I/6sUQPMlb5Hs9nnza
Omtu7JURXLRs4KI7Gn6aJcnQ/1ulaOoQyFM7zpEFB4/LEIHgViuPdYOib8gi7tNd
Pa77fi2Th04eZZIVboubtZC7tynSaQD9bROx2B89qSA5N2i2NgC18NkvMYkDpsc7
xy+a4sx+N788KIJ5S6aP2JSPoSH1OqJ4oH+8pLm985PYW7JZkUYZioesfev41rV7
w8poMvyyteWRysu3zhIKzyEhZT6fiHR0jUVTS4L6ifvg3gT9oe8v6zajPJtdgoW7
hFqKedQQX06LzSzqCxLOMvS5HVSnYtWVrRelsZVOk3IgMl2adththiO7a3onvIt4
uHkaNKNH+dheKDIhr3IVztvQyShbG6ys7m64U4WZKGRs0urxRfK9pz5chwk5184v
ffCa80ro26uU7Mj0iQ/WSCI1PUP+b0XDrpD+oWhAYdWESQGatTcvifnVjjSqafuk
NZ7omK1Hh+FJL2MLXmAmarviSQLh/oNY9ILwzgVsx8yzMWQ4icZRc43SuElXaljW
DnruaQMZbB/J0pNKeheNn8Yey7sRFnRBml+X6hd1WoFsz49px4ktN2hLSQJ3ORR0
mktzhw9Q1vZjA/X8xeOm
=BKpj
-----END PGP SIGNATURE-----

--PWfwoUCx3AFJRUBq--

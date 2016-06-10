From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/20] clk: fixed-factor: Pass clk rates change to the
 parent
Date: Fri, 10 Jun 2016 14:30:53 +0200
Message-ID: <20160610123053.GW5242@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NAuYj0K7Umiq33rm"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463402840-17062-2-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--NAuYj0K7Umiq33rm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2016 at 02:47:01PM +0200, Maxime Ripard wrote:
> A fixed factor clock, if it needs to change its rate, by definition do not
> have any choice but to modify its parent rate.
>=20
> Add the CLK_SET_RATE_PARENT flag to that clock so that it can happen
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Mike, Stephen, any comments on this one?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NAuYj0K7Umiq33rm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWrL9AAoJEBx+YmzsjxAgSMMP/09jaErgQbhOHBfZeFTLm0wp
7XXO+q9MELbI6gopUIw/NfmaGXbZXzJpyYyq0h6xr22o14niDT4p5EkzKgJ6KqHe
EuLIyxJnlxGYjI9TQ+4YY7Q+ewMReyz3KgaUrG3DyBjVqWZzN70CHK8rje9PM5S0
kP51zCaA6HZH9rtjPwDmlr1OAEczCPpLw2AxxEfJrVjKrxeflBQTXpEAn2aoDw0O
xs+U4Nx4Btj/tnOq4BdQxN9R9WU34YaWw0gy2olpaZealrnlXXJtuGInGUvCaZrn
Al4IsH3v7s6HxKJKakM9pq+EyPI0lxarNBVIuNDCp0tAcIW5B3aEqpZopovXt/tI
hOUFxJBSW0Oyt+kXZ1XpDhMZWfV0VCqVQZboDrejFLp0ZpLpoxadusplaGODoO03
U0swG1pHZQhfumk73RQ+rF1ZL9PxAmAAMmjH6pDYbIowSuetSWSLYSsYmLuTomYy
iCOHv8FBnNqtiIZNrFfhtmOF/EnqiRX7NXXOAhaaJWG0pcjBaNuPi2kkhc5VGT8T
Xc15AJZCui055Ygt1nJbP8v9WLAocMHY32u1u1Rp3wQd9bcsGpd5IbUCnJUD+C9V
cd3/Cnw7664OL7kXwJmol/keDuJOf/aSKmL5AJECvs33EumQuVXsqq88D+XvsrJc
c6X3NPw+MLjBbMNueEl5
=9CBo
-----END PGP SIGNATURE-----

--NAuYj0K7Umiq33rm--

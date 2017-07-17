From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/18] regmap: mmio: Add function to attach a clock
Date: Mon, 17 Jul 2017 11:01:07 +0200
Message-ID: <20170717090107.cpjxoxfqcc3qwabh@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <02f409ad80afed68e02660f161fc26d588a86fa7.1499955058.git-series.maxime.ripard@free-electrons.com>
 <20170713160142.2buaie6ebqbxunin@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0282937305=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170713160142.2buaie6ebqbxunin@sirena.org.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0282937305==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="stttgmqakp6ptw7y"
Content-Disposition: inline


--stttgmqakp6ptw7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, Jul 13, 2017 at 05:01:42PM +0100, Mark Brown wrote:
> On Thu, Jul 13, 2017 at 04:12:56PM +0200, Maxime Ripard wrote:
>=20
> > This might be problematic if the clock to enable is stored in another n=
ode.
> > Let's add a function that allows to attach a clock that has already been
> > retrieved to a regmap in order to fix this.
>=20
> What is the use case for this?

This is useful when the clock you want to be handled by the regmap is
not described in the device node that probed the driver, but one of
its subnode, or an another node entirely.

We're in the latter case, where we have two controllers in the DT, but
are driven by the same driver. We'll create two regmaps, but one will
not have the proper of_node used to retrieve the clock.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--stttgmqakp6ptw7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbHzTAAoJEBx+YmzsjxAgo8sP/0Fp/WM592fF4/cWI8SVli4+
4uGaY53iemxeUtmfZnYmjNb5YNyJFjPnY5rKrvz7koSiIzF2nxKhYqZWUJ0H49/a
yhyQwdt0ZZum+B0Y973Iyaht7Vgjud29Atnh4wjVnDSIG8cSSFA9uNwLeiZ/K1n4
DpQ714kmP8YtpAC5Sv+q+YrlCCdaO72678MGhZWbUTtKrQh2B1RUqBNkVkrdf3o7
VlgPFIGq3xOykfawUFIOpErsb4bNVnwRXCRtYbzJCIK6MDR+9N6sSWLjFVHPlEmL
KXvhHXTPnF0sIMVuX5Ues9Ql6CUzi/SmbrZ+6/jqMC3vxNGVPt/RkUVInS452pXm
muvAx8JscvzEeqxL4yQtGaSypjk7EWHYQjOSOSPCt026LYj/qdxUQ8zET7FJyLVv
INy+Y1fWLJuu7lE/H4gw1thEBrz82fzCYcp6T8dDl6KGLvXh/c5RwX/m7AUZ36Xv
WByH2zWuB/8PUolUgptocxV96wPY7p+RxeUe91tMz7WRXz297NkMeGFpsfEVUQwr
JWrzrEYMrkKyn18IBzuIp8c7YTiojAoSmYr1P7wLfTyXzQJ7GboaGus1xb7Qi8YZ
CZX/jIMR+KHf304I4cdcYVtxFt2/h6qG6melSYWWGVS528SZmOhNg18h6PFgvmx5
AepCwVxfAbRENjtZO5sm
=rfDl
-----END PGP SIGNATURE-----

--stttgmqakp6ptw7y--

--===============0282937305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0282937305==--

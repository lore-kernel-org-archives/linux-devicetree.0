From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM64: allwinner: sun50i-a64: Correct emac register size
Date: Tue, 11 Jul 2017 21:34:47 +0200
Message-ID: <20170711193447.pk7jbqnzl2u4xbxp@flea>
References: <20170710184440.28946-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="65cvlltwtliigp6k"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170710184440.28946-1-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--65cvlltwtliigp6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 08:44:40PM +0200, Corentin Labbe wrote:
> The datasheet said that emac register size is 0x10000 not 0x100
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--65cvlltwtliigp6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZZShXAAoJEBx+YmzsjxAgq/sP/AykuwoN9MK5fSt/o0madB5U
olOXRutmm1snLWifijCpIIZLmDTdQEDgJd5z+vX3BDAf46Vbf95YPe1diY6An8cZ
I7ZpEelfK+2rbf77UV4/hfz6Z3nWwpTO17nbbOGPq7f06dbEmpAwvYASqDVPcpw7
bpGb/VpZsZtg0rj1HmIZH0sCtRPFQYSjRgTgu5159+Nv8TLscD1Nq2VjF9fH7J0p
taobb3Fw6oLjfBdGIcvPuL7rSG7BgbZeG9xnRnJE4wmiAGcXFgoPfp7h+Z1xzGNw
hV5OzMLBGXeTI+MasEa6DJGL6tW1ca3JQlSChvyRl/ptV0gKsGYqgolGKFzsXx80
7hJP6wYXR6K8dPE3wbUXtIZWXlATV/Km476xoefV4tJeHYL5cJmousn1utr/DXzk
X/lETAPxY0chIdrBp+CZzUBPXqwpvd2PqBH4gMlFE6rB5bKuabzh3LEB0CH/ldkC
a9h7FLyjiMiu51qhHM8Yc/l/pmGeeXMenAKSt3IR09BdLaAf4iQKL719YT+5Z3pV
LzR2CsIGqk4tIeCT7+qjfDybLUaTyG533vG0aYFZLOpKIiOQcPVhD1QWEDoVSBid
2mch4PGUQay9/NVetXi2HzIIywrf6YDAzWlCFMe4AQigf1eRJEj/lcp40ULqZLBn
qp4oSjmmxzJR1zSNw+zm
=QkEQ
-----END PGP SIGNATURE-----

--65cvlltwtliigp6k--

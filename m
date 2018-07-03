Return-Path: <SRS0=QZe1=JT=the-dreams.de=wsa@kernel.org>
Date: Tue, 3 Jul 2018 23:31:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 0/4] i2c: imx: Fix and enable DMA support for LS1021A
Message-ID: <20180703213059.uscwirqx2opqxzq6@ninjato>
References: <20180523095623.3347-1-esben.haabendal@gmail.com>
 <87602kpih6.fsf@haabendal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6s37g7xnqgzp4f5n"
Content-Disposition: inline
In-Reply-To: <87602kpih6.fsf@haabendal.dk>
To: Esben Haabendal <esben@haabendal.dk>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--6s37g7xnqgzp4f5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 10:22:13AM +0200, Esben Haabendal wrote:
> Esben Haabendal <esben.haabendal@gmail.com> writes:
>=20
> > From: Esben Haabendal <eha@deif.com>
> >
> > This patch series fixes two race conditions and minor issues with track=
ing
> > the stopped state when something goes wrong.
> >
> > With that in place, DMA support works with NXP LS1021A, so it is enable=
d in
> > the last patch.
> >
> > Esben Haabendal (4):
> >   i2c: imx: Fix reinit_completion() use
> >   i2c: imx: Fix race condition in dma read
> >   i2c: imx: Simplify stopped state tracking
> >   arm: dts: ls1021a: Enable I2C DMA support
> >
> >  arch/arm/boot/dts/ls1021a.dtsi |  6 ++++++
> >  drivers/i2c/busses/i2c-imx.c   | 23 ++++++++++++-----------
> >  2 files changed, 18 insertions(+), 11 deletions(-)
>=20
> Hi
>=20
> Is it possible that someone could find time to take a look at these
> patches?

Uwe maybe? Or someone from PTX?


--6s37g7xnqgzp4f5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls76xMACgkQFA3kzBSg
KbbWMg/7BGumowi3UT75s4CpfLhUSfQlhglhnYlxZGEEuIBJKWalVhUIVxQCIhqB
ldYr/lWcn7/AjEpS51ADRLKVgEE9DEyNYar8+mafdfGLYuOLdZ4XUAeinZUOw0Xa
ypbxgILF4EYjJBZVYT8FvrNROhpGEvlySs4u8DZj59PUhmIMiOun1md/1QDCZK97
O1cNKKAqGjh1nZU82PE2PaV/HsyEr+1EW/F82BMh557guQ5ngHgale+eAPx42LiQ
tJ8P6N3xTjc9NJY9rSHjPxoXY5m6euGyIj9zGRcXn5+kmGhXWOW8C0ENTvZ4AfQR
OQubvxLB6mhFqxMWv83Hvud37EDlEdryF0YrB2cBXj7ZZOJacW0ufNDEL3/iPdm1
/Tnky2+HN79gmFuXp87PcZc6ljD8CoPqYZsGpfKx8UOfb0kzO38T5NT8pOgixTyr
pF75PKYdnkvK07tGmokr+7G+xBihEDtY4I6Zc6MHyyXVH9Ku0Hv4vjZAq1IRktPg
A45E23K9hLhmJA64209toHVtvk8loJsz+DPc1Dq+U92ICnev+lAtJXXqsDITcQQN
Nn+znQtdSIy3tgtKi1Dit2F1J+KBS2ngpPDz1ee8GO/etYbKploy/apnZZdY/Oyh
M5EZ2JarilWJxAeT+vyl9Khc8ay8u/vNPS06A/5/PEmDTiUwKMg=
=ZXOz
-----END PGP SIGNATURE-----

--6s37g7xnqgzp4f5n--

From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable
 eMMC.
Date: Tue, 25 Sep 2018 11:01:39 +0200
Message-ID: <20180925090139.qbu6tqav5oth7zkw@flea>
References: <20180919141815.18737-1-rodrigo@tjader.xyz>
 <20180921142811.h5jraemk565alh3i@flea>
 <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aqeztt7u4ouiaxaq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodrigo =?utf-8?B?RXh0ZXJja8O2dHRlciBUasOkZGVy?= <rodrigo@tjader.xyz>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--aqeztt7u4ouiaxaq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 11:54:07AM -0300, Rodrigo Exterck=F6tter Tj=E4der w=
rote:
> On Fri, Sep 21, 2018 at 11:28 AM Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > Expanding a bit more that commit log would be helpful. What is the
> > eMMC connected to that board? Do all versions have it? Which modes are
> > supposed to be supported, and which one have been tested?
>=20
> The terseness of the commit message was already pointed out to me on
> #linux-sunxi. I was waiting for more comments before sending a v2.
>=20
> But you do touch on something I also realized: there are actually
> three versions of the A64-OLinuXino. In fact only one of them has the
> WiFi board, which is already enabled in the current device tree.

Sigh, ok..

> Wouldn't it be better to split it into three separate device trees? I
> have made a patch that does that[1], if you think that is a good
> approach I can submit that as a patch and then later submit a patch on
> top of that to enable the eMMC only on the two boards that have it.

We can't really do that, unfortunately. If the device tree name was to
change for a given board, we'd break all the build systems, boot
scripts and distros out there.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--aqeztt7u4ouiaxaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlup+XIACgkQ0rTAlCFN
r3SLiw/+K4ibF+4iC+OKUEHrrOcL92136pHr1RpVr6ywdc47aYPkbZiavMblFWb5
T22x5Fwp5PMvG/ehp60A8RhAr6qxBZNr+TA6Pk4oYpr1WZpY0VALFnyAFPK/WqAL
6DM9pCAxpsF0CiTIxcpK9K8GPdF1GxjG5V1Q3K+NCPgqkmEVDzt3OJFcqGBTBCfw
EdaBmTwrgT0ry+kYTuv+hUvD+F0iuzTtYBHtdWxaoRm7g6fXnRSKhlGTIYDvcLxX
Sv8mbZvX69bFphj1jvrj/LZNd/1PHdVzf62n+BmjqsPl4wnrU+BDxUivErurXeze
nk1SeOSHsWUkSNqnAt8x2AkhW1M1/nm76tmzNYsob7BKHtHORuggM7eg0clUtOwV
EmK6F7v4mKNcDX9iN+vUUVIkiFSAatJyJry6kju4NBQJjLd70kWwoogVSy6K6xne
4lI910AW/VovzBwd4DvXJ5t0lczZGmB9wuJqTAbr9zflY8pbeDwxp34Bi9wEh9zi
NRVpGjfIpmVVPGlWtuv2yicbtc9d5/Sri1mklT/PdMpelRM2sVDnfQIIvuanIGRz
2W0wyQP1CROIGRDaFhVMnp2BiRA46bu0NFK2g31SX4HoPg3r3Xz2d3lXqEphxY/n
DiSuw8krBpULRuRipoQ1YKZSMX3P+dwinWDK0gZLbpVhvM+m4vo=
=VKy6
-----END PGP SIGNATURE-----

--aqeztt7u4ouiaxaq--

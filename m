From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/3] Add ethernet0 alias for several A64 boards
Date: Tue, 25 Jul 2017 16:31:27 +0200
Message-ID: <20170725143127.ioojcafwaeimvren@flea>
References: <20170722022852.7868-1-icenowy@aosc.io>
 <20170724075823.7ttjq4tnvoupo776@flea>
 <f4016e61dbe4655a0e672c3377f35dd2@aosc.io>
 <20170725031819.ryllvq5a3tdwyblj@angband.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wscbb7enm5xhjebo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170725031819.ryllvq5a3tdwyblj@angband.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Borowski <kilobyte@angband.pl>
Cc: icenowy@aosc.io, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--wscbb7enm5xhjebo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 05:18:19AM +0200, Adam Borowski wrote:
> On Tue, Jul 25, 2017 at 11:04:24AM +0800, icenowy@aosc.io wrote:
> > =E5=9C=A8 2017-07-24 15:58=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
> > > On Sat, Jul 22, 2017 at 10:28:49AM +0800, Icenowy Zheng wrote:
> > > > Allwinner A64 SoC has an EMAC which is used to provide Ethernet
> > > > function on several boards.
> > > >=20
> > > > The EMAC itself doesn't have a fixed MAC address, but the sunxi
> > > > mainline U-Boot have the ability to generate one based on the eFUSE
> > > > SID in the chip, and add the generated MAC address to the device
> > > > tree when booting.
> > > >=20
> > > > The MAC address setting step is based on the device tree's aliases,
> > > > and device tree nodes prefixed "ethernet" will get the MAC address
> > > > added. However, in several A64 boards' device tree, the alias is not
> > > > set up, so that the U-Boot won't set the MAC address.
> > > >=20
> > > > Add the ethernet0 aliases to these boards.
> > > >=20
> > > > I hope this patchset can be queued in 4.13, otherwise 4.13 kernels
> > > > won't get non-volatile MAC addresses, and will use random ones
> > > > instead, which is annoying to many users.
> > > >=20
> > > > Icenowy Zheng (3):
> > > >   arm64: allwinner: a64: add ethernet0 alias for BPi M64 EMAC node
> > > >   arm64: allwinner: a64: add ethernet0 alias for Pine64 EMAC node
> > > >   arm64: allwinner: a64: add ethernet0 alias for SoPine EMAC node
> > >=20
> > > Applied all three, thanks!
> >=20
> > Sorry, but could you queue them to 4.13?
> >=20
> > Otherwise 4.13 kernel release will have annoying random MAC problem,
> > which heavily affects headless usages.
>=20
> Perhaps it would be better to reword the commit subject as "fix missing
> ethernet0 alias ..."?  That'd convey that the previous behaviour is a def=
ect
> that needs these patches as a fix.

Yes, definitely.

That and having a fixes: tag.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wscbb7enm5xhjebo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZd1Y/AAoJEBx+YmzsjxAgKJQQAIzaFdJH62iDNfeuK9fN5eUW
cV1Ok6+mXwrZREFFguBD7yT6kqQ044cOo8Yz+nXi3Lagj+OiJvlG9kRp5sEnAGqb
7mJJlWK0fjR6yXuL5uIYVn2LQGshpzhdAkrUvwNjvXWwaF3P7yAsQaVm4g1HLbDy
VMJzevrZbmkNSOWQjfefNhisx9wQYnKNQdI+T+XASiKg6VBXULnmLtj7qazx8hOP
yEKmlfit1R8DObdLlCZAg1uuNtAYAzB6vnh5JSdB+eV0RkFyJ5rDSo0VPmPUDlzp
PO09ELszqVpl+ZjSQLWnUNYsqXFBjycVOrK5+CzzPI60xM4mhQqqHbqZDJbWwaaX
a1uXL5hJLi41zgMm14PmdEFQHNfhFn8kjihpata1oZWMuR5q2bgZFCqwAWsJfP1Z
YTmYs1kAl8RkZBTgFjMjMxBYxFR2xlmkLVaBNjEpl7oioFXD9qD42PkY5ywZVKS+
rxouUiLEg1smW9CMIwGgSwiKMo7NFu9QfOV3YynDtUBdCNd3KQ0TYSEQw2sZ81Xh
kgDnw05BIIGi5SrlJQX11brKvIwbN6ylHosZTLdCkrXDm/2BJKAlRLO/IoIcc5DH
K9Jw08WHpSKt58bwRMuP5bw8R2sm+Z4SE/1aJXCDchhd+fgXaoz+ZTnfw+8d4nGT
nacI0QMw37ArDFmL0Y2F
=rXsT
-----END PGP SIGNATURE-----

--wscbb7enm5xhjebo--

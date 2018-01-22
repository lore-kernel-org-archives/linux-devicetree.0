From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCHv4 1/5] net: dsa: Support internal phy on 'cpu' port
Date: Mon, 22 Jan 2018 22:57:12 +0100
Message-ID: <20180122215712.ozmscuehwz4rrop3@earth.universe>
References: <20180116101958.19711-1-sebastian.reichel@collabora.co.uk>
 <20180116101958.19711-2-sebastian.reichel@collabora.co.uk>
 <09a9c406-85c1-0f84-4032-db243f825ca2@gmail.com>
 <20180122205459.GF2467@lunn.ch>
 <3b7fa162-20f9-b31c-b61b-07066fefd196@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ktvssrjhc76hiycg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3b7fa162-20f9-b31c-b61b-07066fefd196@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ktvssrjhc76hiycg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 22, 2018 at 12:56:44PM -0800, Florian Fainelli wrote:
> On 01/22/2018 12:54 PM, Andrew Lunn wrote:
> >> Note: there is still technically a misreprentation of how the PHY is
> >> "attached" to the network device. In your DTSes, you have to have the
> >> CPU port have a "phy-handle" to the internal PHY, while technically it
> >> should be the i210 which has a "phy-handle" property to that PHY, and
> >> even better, if the e1000e/idb drivers were PHYLIB capable, they could
> >> manage it directly.
> >=20
> > Hi Florian
> >=20
> > Err, i don't think i agree. But maybe i'm missunderstanding.
> >=20
> > We have two back-to-back PHYs. I would expect the i210 MAC to have a
> > phy-handle pointing it its PHY. The CPU port would then point to the
> > internal switch PHY.

Right. For the i210 the internal phy is used, so there is no
phy-handle. It's basically a normal network card. It looks
like this:

i210.internal-phy <--- pcb lanes ---> switch.port4.internal-phy

> Is it really a back-to-back PHY? If that is the case, ok, that can
> indeed work without magnetics, but this is really an inefficient way to
> connect a MAC to a switch, especially when you can do direct (R)GMII
> without any PHY in between... If that is the case, then disregard my
> comment.
>
> > Or are you suggesting the i210 has two phy-handles, its own and the
> > switches?
>=20
> Not suggesting that, that would be weird.
>=20
> >=20
> > 	Andrew
> >=20
>=20
>=20
> --=20
> Florian

--ktvssrjhc76hiycg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlpmXjYACgkQ2O7X88g7
+pqX3xAAnyjfr3jAvs7Vv5bNbOMyEJTU+a5WTr84VJ3CwFUyi2zjIybfqF73UV82
lfftR9+kpdaO5dJ43IVK+bBEfcF7mIxhlgfXGHelEN+RVyFQUgMFBMybJxxF77oc
wpnSoCwIzxwJqblI7tGepBRy0SnAT3makfiCVpQ4pej0VCLHrOQaEEJXcYXIEWvm
MuITK2tlhkS6pyoadKeQnXQpYeeWibm7R9kchXxPZhr5lD3OgD6CLmcEKEDKlQ2W
aL9uVqB3/tGA/AWr3u7W74apR/rjWIPXPAMGoMNVtXhoMH4RrVOv3C/PvW5vvI69
7OwRBIBiOzVid2vm7Mw/FLJ0I6s3aYXu7AjEXms6TOiA1ODoBvcLuW+BN+WplW9y
sPDb4sB5PtfQx79qjfXjRbhUxEH48ONaAjK55yefiVyUagsr1dhwXdH9sq3Pl7ow
FIO93HxDYdMkubk00Yc0fChyuhEgWwFv1JJQBl+rv/hvBLMX7ZRmMPA9M4Nf8jW4
8UoMY8rlljpWwjxI31E+09wvL0Lo8Pcm1lRCpBI3fNDmloGHBeGg+RDJnn258YBg
ttiX97mWWeYtRoW6QlaFXTFQpZI8W5pq1nSzK068q3oVAlvfl80+Vh/M0k+3thTm
GLYbyHDOdiqfhreYJYGeXZxG9v0X6QkSsGZ6/BwwB3tpEtHmzzw=
=Isfv
-----END PGP SIGNATURE-----

--ktvssrjhc76hiycg--

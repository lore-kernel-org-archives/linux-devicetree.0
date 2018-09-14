From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: Re: [PATCH net-next 2/7] net: phy: mscc: add support for VSC8584 PHY
Date: Fri, 14 Sep 2018 15:29:30 +0200
Message-ID: <20180914132930.fphdm3dm2incetbq@qschulz>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
 <20180914131846.GG14865@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2cfxpmyvzbuyq6t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180914131846.GG14865@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org


--w2cfxpmyvzbuyq6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Sep 14, 2018 at 03:18:46PM +0200, Andrew Lunn wrote:
> > Most of the init sequence of a PHY of the package is common to all PHYs
> > in the package, thus we use the SMI broadcast feature which enables us
> > to propagate a write in one register of one PHY to all PHYs in the
> > package.
>=20
> Hi Quinten
>=20
> Could you say a bit more about the broadcast. Does the SMI broadcast
> go to all PHY everywhere on an MDIO bus, or only all PHYs within one
> package? I'm just thinking about the case you need two of these
> packages to cover 8 switch ports.
>=20

Ah sorry, that wasn't very explicit. That's a feature on the PHY side so
my wildest guess is that it wouldn't impact any other PHY outside of
this package. Affecting any other PHY on the bus is counter-intuitive to
me but I'll ask the HW engineers for confirmation.

Thanks,
Quentin

--w2cfxpmyvzbuyq6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEXeEYjDsJh38OoyMzhLiadT7g8aMFAlubt7oACgkQhLiadT7g
8aMP+g/+L2iC+PhfMSiTn/swWLrAkWxgR7/1NH4N7Kb5wIBJPN659JJnEUHtnQQd
HRu4vqlMEu9c6T6B6fo23w8xHvKSTtQdcPtKgX2AbtwvuNelfPTUtOVQYbdAzqKB
ZG0TKTL5BIFn49N9vwf9SpvVKFJ4e3+XU2/OMAO/PiG3hTwlcqH3JX5TXzDlBSUM
1w+MS/UMzqTRVNnXfCvyGk6/xtAcOIu/GCxCGQviP6iZWtewVrnowqY94FURE8h4
eF4Mc8udp3OLVUOh5Ki3DtWY42oRTG9KPqwDXzxKIgZ4V91n1USVOE8kPIZrvbW8
6N61KHuJTlwZfdcpl5VdUqkOfVfpclnCkJOQkmySZcn9OEGHNxAa/IHN+1eX6wOX
zbD0i7IccvHdjIfoAmQwpO5kO72x3XFaJhcZEq87LBpdcY6QodUJddqjlUdyeSae
BmJN4RhgNi+l3IFFYbOTAQY0o6dTdvSO1W2RzA0//IDeUSXBSirf+dow6vockwf6
cPOjUaq82xJlFzyucsGH1G4Xp6G/sZN1ML3ETnRKLRBIy34dREcfgOE2k5FAtcN4
hzv322g8YR+tuQ7EIXWwxQwM/osiCniaz8Zi7IzJ/aksFJBITLP24rLHEb/xEknL
nIOZfQaVOkE02pxyW/qPU7nUe66hnJUAwdcgr/TIk/hoIeKRVUs=
=Rb1D
-----END PGP SIGNATURE-----

--w2cfxpmyvzbuyq6t--

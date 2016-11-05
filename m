From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sat, 5 Nov 2016 23:08:48 +0100
Message-ID: <20161105220848.k6rrjmvvhdaeduma@perseus.defre.kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105210441.GB1216@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jfqf5kjkihecltua"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161105210441.GB1216-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jfqf5kjkihecltua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2016 at 10:04:41PM +0100, Andrew Lunn wrote:
> > +&mdio {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mdio_pins>;
> > +	status =3D "okay";
> > +
> > +	phy1: phy@1 {
> > +		status =3D "okay";
> > +		compatible =3D "marvell,88E1514", "marvell,88E1510", "ethernet-phy-i=
eee802.3-c22";
> > +		reg =3D <1>;
> > +	};
>=20
> phy.txt says:
>=20
> - compatible: Compatible list, may contain
>   "ethernet-phy-ieee802.3-c22" or "ethernet-phy-ieee802.3-c45" for
>   PHYs that implement IEEE802.3 clause 22 or IEEE802.3 clause 45
>   specifications. If neither of these are specified, the default is to
>   assume clause 22.
>=20
>   If the phy's identifier is known then the list may contain an entry
>   of the form: "ethernet-phy-idAAAA.BBBB" where
>      AAAA - The value of the 16 bit Phy Identifier 1 register as
>             4 hex digits. This is the chip vendor OUI bits 3:18
>      BBBB - The value of the 16 bit Phy Identifier 2 register as
>             4 hex digits. This is the chip vendor OUI bits 19:24,
>             followed by 10 bits of a vendor specific ID.
>=20
>   The compatible list should not contain other values than those
>   listed here.
>=20
> Please don't list the "marvell,*" names.

Will do for v2. arch/arm/boot/dts/keystone-* needs fixing in this
regard, too.

Best regards
Uwe

--jfqf5kjkihecltua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCgAGBQJYHlhsAAoJEMH8FHityuwJy+gH/RJfR+PlUnLcq65MIb0HWVxo
KvYk5X/WB1/XDuD5vG9H1NrcVqe3J290d6Fe4P3s/mSqWhT28o16OZAuojMZv5gk
FWonANQEbo6CGoqh2bQcm2cWIJ1H0ZD8G53q3FR8gQ30A0U5DbdJ20m5BRAFLdfr
omQiHLrQC3vIQyk+L4VtATMT43k115NsnugVsgSbPMxRG5eUtzFK0QIn3RT1O9XF
pqMynNV+nDhmffnSvL0QBday7s+r9yqAagQtcg9N/6abVTReYZEBohO0ymRD5x6Q
g1EoRolaOna5QCsQl4v1neSsgeYpV1zgAzaMBJKPLvtKy2FjQmBM7B6Fqv5xsOs=
=PudL
-----END PGP SIGNATURE-----

--jfqf5kjkihecltua--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

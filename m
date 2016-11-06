From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sun, 6 Nov 2016 20:32:25 +0100
Message-ID: <20161106193225.7tgnbitphktpdk6r@perseus.defre.kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105212326.GC1216@lunn.ch>
 <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
 <20161106104534.lsdyppz5qcnjcqe4@perseus.defre.kleine-koenig.org>
 <20161106111109.GD9617@lunn.ch>
 <20161106141716.fwgje74rhhixnixq@perseus.defre.kleine-koenig.org>
 <20161106162809.GA14042@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l537ktfuqbiasgbm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161106162809.GA14042-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin =?utf-8?B?U3RyYmHEjWth?= <martin.strbacka-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l537ktfuqbiasgbm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just noticed that I dropped the other recipents from the conversation.
I readded them also adding some context.

> > On Sun, Nov 06, 2016 at 05:28:09PM +0100, Andrew Lunn wrote:
> > > On Sun, Nov 06, 2016 at 11:45:34AM +0100, Uwe Kleine-K=F6nig wrote:
> > > > +     switch@0 {
> > > > +             compatible =3D "marvell,mv88e6176", "marvell,mv88e608=
5";
> > >=20
> > > All currently supported switches are compatible with the mv88e6085, in
> > > terms of probing. During the probe it can read an ID register to find
> > > out what specific switch it is, so you don't need additional details
> > > here. So please drop the marvell,mv88e6176, it will never be used.
> >=20
> > That's what I know from several imx devices, for example look at
> >=20
> > $ git grep imx25 arch/arm/boot/dts/imx25.dtsi
> >=20
> > There are several instances of imx25-something,
> > imx$earliersoc-something. Given there is a good reason for this, I
> > wonder why it's different here.
>=20
> Possibly because you cannot easily tell the variants apart using ID
> registers in the devices register space? For the switch it is very
> easy, port register 3 is the ID. It only becomes an issue when probe
> cannot find this register. There is a new generation mv88e6390 which
> i'm currently adding support for which has moved the port
> registers. So i need to add a new compatible string so probe knows
> where to look.

Even if you cannot easily distinguish between an "fsl,imx35-cspi" and an
"fsl,imx27-cspi" by inspecting hardware registers, it would be enough to
write in imx25.dtsi

	compatible =3D "fsl,imx35-cspi";

still we're writing

	compatible =3D "fsl,imx25-cspi", "fsl,imx35-cspi";

because it never hurts and is helpful when later some differences are
found and it documents the situation more accurately.

I wonder what the dt people have to say here.

> > > From what you say here, the switch is in mulit-chip mode, at address
> > > 0x10. So set the reg property to <0x10>.
> >=20
> > When using 0x10 I get
> >=20
> > 	mv88e6085 f1072004.mdio-mi:10: switch 0x176 probed: Marvell 88E6176, r=
evision 1
>=20
> Great.
>=20
> >=20
> > so now I have to find out how to use this.
>=20
> Just use them as normal interfaces. ip addr add 10.42.42.42/24 dev
> lan4, brctrl addif br0 lan2, ethtool -S lan1 etc.
>=20
> The whole idea is that they are just normal Linux network interfaces.

That's how I expected things to be, but

	uwe@omnia:~$ dmesg | tail
	...
	[ 2164.644589] libphy: mdio_driver_register: mv88e6085
	[ 2164.649823] mv88e6085 f1072004.mdio-mi:10: switch 0x176 probed: Marvell=
 88E6176, revision 1
	uwe@omnia:~$ ls /sys/class/net/
	eth0  eth1  eth2  lo

there are no additional interfaces. I will debug a bit further.

Best regards
Uwe

--l537ktfuqbiasgbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCgAGBQJYH4VGAAoJEMH8FHityuwJjrEH/jAxNVpcveyauR9ZdQ3/Cv7m
99zzAVCxF/xDNwKvoioGiyoTqshwmHqemRd9KDlFjj58PR8YAOBhjT9k1Gw9MSpm
xAZcTcQErXWa/SvSuyK9lapT0vJILnTrcz8k3zuQGp++L7+QnFSgf9V5t7MQf/X/
Ukz5sDcgG8fQHZmTt0ya/A1/u0S6GpG6wVjhKbwbT0HBOdBMSFNzPDl6NRvQIER8
JvPPp5hxedDHaLGE9gzZhYpCUog23SKKclG8aeDCHMjElsA98iPmpbRkuNn0SOsm
fFTxhDR5+77sRC5rctaniItMXzc8A7R2cMkk2QNT5SebBNj6JVKIPWxXx9d7LO0=
=Vt1B
-----END PGP SIGNATURE-----

--l537ktfuqbiasgbm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

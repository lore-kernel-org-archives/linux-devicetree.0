From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCHv1 3/6] ARM: dts: imx6q-bx50v3: Add internal switch
Date: Wed, 3 Jan 2018 16:24:52 +0100
Message-ID: <20180103152452.4lqrjxyxkfqlsnsu@earth.universe>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
 <20180103122609.5482-4-sebastian.reichel@collabora.co.uk>
 <5c87f610-4927-faca-40a7-3f83e7f00ff7@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aqwwgutstbzkrv5g"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c87f610-4927-faca-40a7-3f83e7f00ff7@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--aqwwgutstbzkrv5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 03, 2018 at 05:48:42PM +0300, Sergei Shtylyov wrote:
> Hello!
>=20
> On 01/03/2018 03:26 PM, Sebastian Reichel wrote:
>=20
> > B850v3, B650v3 and B450v3 all have a GPIO bit banged MDIO bus to
> > communicate with a Marvell switch. On all devices the switch is
> > connected to a PCI based network card, which needs to be referenced
> > by DT, so this also adds the common PCI root node.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > ---
> >   arch/arm/boot/dts/imx6q-bx50v3.dtsi | 37 ++++++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 37 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/im=
x6q-bx50v3.dtsi
> > index b915837bbb5f..689981e90e68 100644
> > --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> > @@ -92,6 +92,31 @@
> >   		mux-int-port =3D <1>;
> >   		mux-ext-port =3D <4>;
> >   	};
> > +
> > +	aliases {
> > +		mdio-gpio0 =3D &mdio0;
> > +	};
> > +
> > +	mdio0: mdio-gpio {
> > +		compatible =3D "virtual,mdio-gpio";
> > +		gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>, /* mdc */
> > +			<&gpio2 7 GPIO_ACTIVE_HIGH>; /* mdio */
> > +
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		switch@0 {
> > +				compatible =3D "marvell,mv88e6240";
>=20
>    Why suddenly 2 extra tabs instead of 1?

will be fixed in PATCHv2.

> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				reg =3D <0>;
> > +
> > +				switch_ports: ports {
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +				};
> > +		};
> > +	};
> >   };
> >   &ecspi5 {
> [...]
>=20
> MBR, Sergei

-- Sebastian

--aqwwgutstbzkrv5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlpM9bwACgkQ2O7X88g7
+prQdw//RySyNtqMD+yxuCYLpWRUGYBf2vF5c/Qsb2m6y25S3inAsVTrpxiriUEg
69Mzg10Lm+hiyj0bN+cmLFKjIWpZjqq+Ko13rbM4kWWvgrwFDg5ZDmGV1QqbNBBI
+VRda1Q5m1O4ykzAnR3+dcOm8GqK//k8emPg9WGrcjqAgpb/tYgFdabfUM0j9oIs
YILq42ctXo42Dm+XSPuYmMoC3u4JeMLYpYkNbiBMQIM6wYeExgkEoAJr86LzzCIK
piReLGFKkZ3lk2MhB074SGCExPqvVuXNdpQ9YV6nVgXPrfbJQc6rKbhj2Z96z/Ts
cTqV4KGPENUY13SIzvnEri2O6+y0xBmUgnseHQ0rn+/0cSXfBEVEc6OZxonfuYIU
Zwtg2Pi6P10m+HE80Iayj0H3qjtvohHJ5bHHYa9AioF8E8o0Z4R8cqJyuHwLyNyY
IoTw07l4ncL7P8H+iUazSQVr2b6WX1CkeD07y7V56NsOm1/LPUZirOCIZzWdfebN
LOGGYmsEMCxFMGZQw6S71dZyFYOt5QGkyu6z7OH26yIUzTzN/CLvOv7qUntqkD86
uOand1gdidtSXgKPboa6KjkteICrrg5kmui81JYX4VAt/RMQPhH4pOKd49PU98xO
NvrVAbyXGi7OLMpblWxn4Gw2veq49PzMDGIhTPRzYWrGpawYy9s=
=O28n
-----END PGP SIGNATURE-----

--aqwwgutstbzkrv5g--

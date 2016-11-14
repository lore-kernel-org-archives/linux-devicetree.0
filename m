From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 14 Nov 2016 21:16:41 +0100
Message-ID: <20161114201640.rr32iyjf5a53v33t@perseus.defre.kleine-koenig.org>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lciwoba7jhmz3ogm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479126185.15557.5-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomas.hlavacek-x+rMaJPWets@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Martin =?utf-8?B?U3RyYmHEjWth?= <martin.strbacka-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org
List-Id: devicetree@vger.kernel.org


--lciwoba7jhmz3ogm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Tomas,

On Mon, Nov 14, 2016 at 01:23:05PM +0100, tomas.hlavacek-x+rMaJPWets@public.gmane.org wrote:
> On Sat, Nov 5, 2016 at 9:38 PM, Uwe Kleine-K=F6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> wrote:
> > This machine is an open hardware router by cz.nic driven by a
> > Marvell Armada 385.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> > ---
> >=20
> > Hello,
> >=20
> > the following components are working:
> >=20
> >  - WAN port
> >  - eMMC
>=20
> But I not not sure about DDR50 mode. At least with kernel 4.4, that we use
> in production, we had to limit to SDR50 to overcome I/O errors and
> communication instability, if I can remember it correctly. So it might ne=
ed
> more testing with the current kernel.

I didn't test that extensively, but the eMMC serves my rootfs and I
didn't had any problems so far.

> > Still missing is support for the switch. Wireless fails to probe, didn't
> > debug this up to now. SFP is untested as is UART1.
>=20
> Actually SFP is connected to SGMII interface of eth1, which is routed
> through SERDES 5. The SGMII line is shared between the SFP and metallic P=
HY
> 88E1514. There is a autonomous high-speed switch connected to the SFPDET
> signal from SFP cage. It disconnects the metallic SFP and connects SGMII =
to
> SFP once the module is connected.
>=20
> The SFP is also connected to the I2C mux port 4 and to GPIO expander for
> reading/driving SFPDET, LOS, TXFLT, TXDIS signals:
>=20
> &i2c0 {
>        pinctrl-names =3D "default";
>        pinctrl-0 =3D <&i2c0_pins>;
>        status =3D "okay";
>        clock-frequency =3D <100000>;
>=20
>        i2cmux@70 {
>                compatible =3D "nxp,pca9547";
>                #address-cells =3D <1>;
>                #size-cells =3D <0>;
>                reg =3D <0x70>;
>                status =3D "okay";
>=20
> ...
>=20
>                i2c@7 {
>                        /* SFP+ GPIO expander */
>                        #address-cells =3D <1>;
>                        #size-cells =3D <0>;
>                        reg =3D <7>;
>=20
>                        sfpgpio: gpio@71 {
>                                compatible =3D "nxp,pca9538";
>                                reg =3D <0x71>;
>                                interrupt-parent =3D <&gpio1>;
>                                interrupts =3D <14 IRQ_TYPE_LEVEL_LOW>;
>                                gpio-controller;
>                                #gpio-cells =3D <2>;
>                        };

I have authored a nearly identical snippet, mine looks as follows:

+               i2c@7 {
+                       #address-cells =3D <1>;
+                       #size-cells =3D <0>;
+                       reg =3D <7>;
+
+                       pcawan: gpio@71 {
+                               compatible =3D "nxp,pca9538";
+                               reg =3D <0x71>;
+
+                               pinctrl-names =3D "default";
+                               pinctrl-0 =3D <&pcawan_pins>;
+
+                               interrupt-parent =3D <&gpio1>;
+                               interrupts =3D <14 IRQ_TYPE_LEVEL_LOW>;
+
+                               gpio-controller;
+                               #gpio-cells =3D <2>;
+
+                               interrupt-controller;
+                               #interrupt-cells =3D <2>;
+                       };
+               };

The interrupt-controller part doesn't seem to work though, at least

+               interrupt-parent =3D <&pcawan>;
+               interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;

in the phy node gives an error.


>                };
> 	};
> };
>=20
> We have our proprietary support hacked onto mvneta driver for disconnecti=
ng
> PHY on the fly. It is a bit nasty, so I suggest to ignore SFP in this DTS
> altogether and let's wait till "phylink based SFP module support" or
> something alike hits upstream, so we can base the SFP support on solid co=
de;
> unless somebody has a better idea, of course.
>=20
> >=20
> >=20
> > diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts
> > b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> > new file mode 100644
> > index 000000000000..d3cd8a4d713d
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> > @@ -0,0 +1,246 @@
> ...
> > +
> > +			/* USB part of the eSATA/USB 2.0 port */
>=20
> This comment is perhaps some error inherited from my development DTS. We =
do
> not have any eSATA, perhaps PCIe/USB 2.0 slot.

oh right. I changed it for v3.
=20
> >=20
> > +			usb@58000 {
> > +				status =3D "okay";
> > +			};
> > +
> > +
> > +&eth0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ge0_rgmii_pins>;
> > +	status =3D "okay";
> > +	phy-mode =3D "rgmii-id";
> > +
> > +	fixed-link {
> > +		speed =3D <1000>;
> > +		full-duplex;
> > +	};
> > +};
> > +
> > +&eth1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ge1_rgmii_pins>;
> > +	status =3D "okay";
> > +	phy-mode =3D "rgmii-id";
> > +
> > +	fixed-link {
> > +		speed =3D <1000>;
> > +		full-duplex;
> > +	};
> > +};
> > +
>=20
> Actually eth0 and eth1 (both are RGMII) are connected to the 88E6176 swit=
ch.
> The problem is that from what I have read so far the switch can not opera=
te
> in DSA mode with two CPU ports. We currently operate the switch in "normal
> mode" with the eth0 and eth1 set to fixed-link 1000/full and with
> proprietary driver (derived from OpenWRT switch drivers). I would say that
> these records for eth0 and eth1 are therefore redundant, because it does
> nothing without the switch support and it would most likely change once we
> have DSA driver (using only eth0).

Right. They do nothing currently. In my local tree I have a
specification for the switch which allows to read the phy registers of
the lan ports, but communication isn't possible yet. For this AFAIK I
need at least one of these. I mailed a few iterations with Andrew here,
but no success so far. Also dropping one cpu port from the definition
didn't help.

Best regards
Uwe

--lciwoba7jhmz3ogm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCgAGBQJYKhulAAoJEMH8FHityuwJgRIH/jLpOKME83AiW2uSSFYDbc89
9oGym14Ldk0lLG+WEhy1VlAnn46v+Nqpmv2YFbjg1kUfhNF7NpuY+uq9nCYLQJDq
S1warDOqT4ceE+kbiAQrd7NFvyalEYWwLpq2cdhe5ajxxTG2P1QYcckHAc+ddQ2I
Pbi12u/RJMnMl+zxaABbh1pG1REnmzlIqv7IipHrWUwpEWA1qUtuJcfssFRvZi3a
zSIUuql/DHx/si1q9mNpmPjTuXkem6DAbisLPAhoAWBWIopwmf+aGpikPGd8eMKK
jgHoesW0/IxmUdfqP0b9CWuO816AWsGr0WkliFQvd+JNfDRkVyok1GmS3EsDft8=
=X3C9
-----END PGP SIGNATURE-----

--lciwoba7jhmz3ogm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

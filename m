Return-Path: <SRS0=C0bj=SA=ucw.cz=pavel@kernel.org>
Date: Fri, 29 Mar 2019 21:40:08 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 leds-next 2/2] dt-bindings: leds: Document Turris
 Omnia LED controller binding
Message-ID: <20190329204008.GB4689@amd>
References: <20190328193428.19273-1-marek.behun@nic.cz>
 <20190328193428.19273-3-marek.behun@nic.cz>
 <20190329200003.77443bc4@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline
In-Reply-To: <20190329200003.77443bc4@nic.cz>
To: Marek Behun <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I have a question about how to design correctly the situation about
> global brigthness on this controller in the device tree.
>=20
> The thing is that these LEDs are, in hardware, controlled via PWM and
> SPI, but this is done via microcontroller running a proprietary
> firmware. So from the point of view of the CPU, should the LEDs be
> described in the device tree as connected to the mircocontroller
> direclty, or should pwm and spi nodes be created as well?

I don't think you need to describe interfaces between=20

> Next thing is that the values of the RGB channels for each LED is
> controlled via SPI, but the global brightness controlled byt the single
> PWM also controls the LED brightnesses globally.
>=20
> How should this be specified?

I'd say it does not need to be specified in the device tree. Device
tree tells us about the microcontroller, and driver knows the
rest. This is not generic hardware, this is microcontroller with
special programming.

Strictly speaking, we'd need to know about the LEDs, either;
cznic,turris-omnia-leds means we have 12 LEDs and what they mean. But
let's keep the LEDs, it will be easier that way.

								Pave

IOW: this is okay:


> > +Example:
> > +
> > +	led-controller@2b {
> > +		compatible =3D "cznic,turris-omnia-leds";
> > +		reg =3D <0x2b>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		led@0 {
> > +			reg =3D <0x0>;
> > +			label =3D "userB";
> > +			linux,default-trigger =3D "heartbeat";
> > +		};
> > +
> > +		led@1 {
> > +			reg =3D <0x1>;
> > +			label =3D "userA";
> > +		};
> > +
> > +		led@2 {
> > +			reg =3D <0x2>;
> > +			label =3D "pci3";
> > +		};
> > +
> > +		led@3 {
> > +			reg =3D <0x3>;
> > +			label =3D "pci2";
> > +		};
> > +
> > +		led@4 {
> > +			reg =3D <0x4>;
> > +			label =3D "pci1";
> > +		};
> > +
> > +		led@5 {
> > +			reg =3D <0x5>;
> > +			label =3D "wan";
> > +		};
> > +
> > +		led@6 {
> > +			reg =3D <0x6>;
> > +			label =3D "lan4";
> > +		};
> > +
> > +		led@7 {
> > +			reg =3D <0x7>;
> > +			label =3D "lan3";
> > +		};
> > +
> > +		led@8 {
> > +			reg =3D <0x8>;
> > +			label =3D "lan2";
> > +		};
> > +
> > +		led@9 {
> > +			reg =3D <0x9>;
> > +			label =3D "lan1";
> > +		};
> > +
> > +		led@a {
> > +			reg =3D <0xa>;
> > +			label =3D "lan0";
> > +		};
> > +
> > +		led@b {
> > +			reg =3D <0xb>;
> > +			label =3D "power";
> > +		};
> > +	};

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyegqgACgkQMOfwapXb+vLBNACglwiHb8CDRygEbC/cGTHLkYiu
5NIAn2JnjkcnC15898QVvPcG7dDanRtQ
=AcbG
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

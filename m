From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: add the Alpine v2 EVP
Date: Tue, 9 Feb 2016 11:18:33 +0100
Message-ID: <20160209101833.GD5388@kwain>
References: <1454922699-16785-1-git-send-email-antoine.tenart@free-electrons.com>
 <1454922699-16785-3-git-send-email-antoine.tenart@free-electrons.com>
 <2530828.WgKqLzsO0l@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2530828.WgKqLzsO0l@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rshitrit-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barak Wasserstrom <barak-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Mon, Feb 08, 2016 at 01:20:40PM +0100, Arnd Bergmann wrote:
> On Monday 08 February 2016 10:11:38 Antoine Tenart wrote:
> > index 000000000000..3e3080fa45e4
> > --- /dev/null
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	model =3D "Annapurna Labs Alpine v2";
> > +	compatible =3D "al,alpine-v2";
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +	};
>=20
> Move the aliases to the .dts files and drop the ones that are disabled.

Sure.

> > +
> > +		pcie-internal@0xfbc00000 {
>=20
> make this
>=20
> 		pci@fbc00000 {

Will do.

>=20
> > +			compatible =3D "pci-host-ecam-generic";
> > +			device_type =3D "pci";
> > +			#size-cells =3D <2>;
> > +			#address-cells =3D <3>;
> > +			#interrupt-cells =3D <1>;
> > +			reg =3D <0x0 0xfbc00000 0x0 0x100000>;
> > +			interrupt-map-mask =3D <0xf800 0 0 7>;
> > +			/* add legacy interrupts for SATA only */
> > +			interrupt-map =3D <0x4000 0 0 1 &gic 0 53 4>,
> > +					<0x4800 0 0 1 &gic 0 54 4>;
>=20
> What's wrong with the other IRQs? Not connected?

=46rom what I know the other IRQs are disconnected.

> > +
> > +		uart0: uart@fd883000 {
>=20
> 			serial@fd883000
>=20
>=20
> Almost all devices are in the 0xfd000000 range. Could this be a bus in the
> SoC that has all the devices attached to it? Maybe use a "ranges" property
> to reflect that. In doubt, use the register numbers from the data sheet i=
f you
> have one.

I'll try using a range property in the v2 of the series.

Thanks for the review!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWubz4AAoJEFxNi8it27zYCKYP/RhQq/ZV+QfdNNKKrqPVQdub
U4E5KVunaDmCfY6pns15NqLmnl7eSz84MIDmvykdYsFVRDpMYa3Dqmpq4g0esgkm
OgTsP8n6KKaHJuBoY8irSbxyR1WyZjW6Z7w/tp3WZmUZRlW/1aJofisLrtW3v8yv
jgdQIauH+GWzUoarwEDBGLwA2d82w91h1vpsNKibws0GOZ4tA4ufqPX6YsU+jA1O
U7kvGy9ZOtLTJhLHUswLEZ8/XCUz22Gnu9E/jA3dftemMt2w6IdVTx1S4Nx+sBr0
LyOaU3qmLb+2tVysldrRZizN42CJtIbpFWRWyna6nQKIBN7Kkmysp48i6LZTZli8
TZ2c2c4DEmQy5UvnRihPbDliMqhHSDyH03E/RGzZkloIlG/VUpgXB8RTjDZ98dDC
f3YVAWU7gmhFcxgW56BCx+vmPOmfj0qa/4TuG/GxNmDhR3T2vrBCxeZT9/W311gT
yx5z62TEgZ4UKy8azFGm4SbEAZbBHwjl438/5ZjjFgJZhI0b/RCJodKu61pGLSFZ
9+xPbr4xR+l1SFQS45qURU/JrSrsOeN91ap2O+2Da1d22vacYYUVy4R3NY8uMEDE
eM11kyrE4XiaC5VPyKiLOHI5CAZEv8BnbOa6ln3h4Gs/5sLwxQiOzBYQn9r7a66X
L24HYjYKDfru+86/sIIc
=lw+u
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

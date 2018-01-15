From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64: orangepi-zero-plus2: add usb
 otg
Date: Mon, 15 Jan 2018 16:33:54 +0100
Message-ID: <20180115153354.4anukmnd64yj3oec@flea.lan>
References: <1515748144-25204-1-git-send-email-jagan@amarulasolutions.com>
 <20180115080139.k2vrczo3hnvdt3df@flea.lan>
 <8080607.cgOBd57Bn1@ice-x220i>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7eigv6wzmtueo4cb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8080607.cgOBd57Bn1@ice-x220i>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7eigv6wzmtueo4cb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 04:05:07PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2018=E5=B9=B41=E6=9C=8815=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 C=
ST =E4=B8=8B=E5=8D=884:01:39=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Fri, Jan 12, 2018 at 02:39:04PM +0530, Jagan Teki wrote:
> > > Add usb otg support for orangepi-zero-plus2 board:
> > > - Add usb_otg node with dr_mode as 'otg'
> > > - USB0-IDDET connected to PA21
> > > - VBUS connected through DCIN which always on
> > >=20
> > > Tested mass storage function.
> > >=20
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > > Changes for v2:
> > > - Change dr_mode to peripheral
> > >=20
> > >  .../dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts    | 18
> > >  ++++++++++++++++++ 1 file changed, 18 insertions(+)
> > >=20
> > > diff --git
> > > a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts ind=
ex
> > > af43533..6511190 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> > > @@ -73,6 +73,10 @@
> > >=20
> > >  	};
> > > =20
> > >  };
> > >=20
> > > +&ehci0 {
> > > +	status =3D "okay";
> > > +};
> > > +
> > >=20
> > >  &mmc0 {
> > > =20
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&mmc0_pins_a>;
> > >=20
> > > @@ -111,6 +115,10 @@
> > >=20
> > >  	status =3D "okay";
> > > =20
> > >  };
> > >=20
> > > +&ohci0 {
> > > +	status =3D "okay";
> > > +};
> > > +
> > >=20
> > >  &uart0 {
> > > =20
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&uart0_pins_a>;
> > >=20
> > > @@ -122,3 +130,13 @@
> > >=20
> > >  	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > >  	status =3D "okay";
> > > =20
> > >  };
> > >=20
> > > +
> > > +&usb_otg {
> > > +	dr_mode =3D "peripheral";
> >=20
> > If VBUS is always on, this can only operate safely in host mode, not
> > peripheral.
>=20
> I think this kind of device is designed to directly drain power from the =
host=20
> in peripheral mode.

Then the commit log has it backwards, VBUS is not connected through
DCIN, DCIN is VBUS.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7eigv6wzmtueo4cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpcyeEACgkQ0rTAlCFN
r3TCbw//YVByVs3Ep8eZEocDMbsvr93PqF6zDz4AqPsDgHmiELinc5AnNFfA/JnC
jg5KVNpTUGZksbXP8y1Q282Wmlip+yfZdFzfDDuBunP/eScg4blG2IrVkyGpWxa7
3Mdr9sWJ+OdzUKZ4b8D4QFvUyp+Ihf2LLmPFUazhl7zvrc5C2d83KLv1TSZtUbXo
oBwMRaWu5pMSbu2ZRD0gi9vXGKjJD2YzGZedrdAN72jfcLjlqbQUuOb2nyByVdPv
9ZJbJ6ig4FgiFqP1A1VR36ZqRD7wia/zjliXwbBm5R2F/mW5A4vBOTZzXAg/tOs8
7vHUNEyxFU3HWope6X+qUyRHtn4mhD1REoVAyESOs1V8zMFJqWhH4hsPn8CNCZGs
e0H13OaDMvLtbmX94q+HvOi8zG4W1Guq0a5rF1A91IZnzNlV7zM1Iwm2rfWU2coS
B3Fz9lShZIdt7bmnoQ3NoGW5nA0lwrdFd8UFS1SvTMQ1OJRW43tbkFFxM5md0N5f
1Uyi4+ejZloDwSAk/pUB3EB/rLJ8KVnv6ivRG7IXHNgbReBOw7EGmRxUy+k36R//
Lko7+f//sbw46O0SPPv2gLuVdX9Ss+8Is+2tm6wGqclnf6NnYmHnKyO1c3yxiY9U
f1QKFZf/d8GJVnmtM6A+IFup2uxl95KB5JYTTWXnGSg8gHuV4+w=
=9QKT
-----END PGP SIGNATURE-----

--7eigv6wzmtueo4cb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

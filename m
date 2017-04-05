From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: add USB0 OHCI/EHCI related
 devicetree parts
Date: Wed, 5 Apr 2017 09:26:31 +0200
Message-ID: <20170405072631.ou4e5gafvagwpykq@lukather>
References: <20170404184518.33610-1-icenowy@aosc.io>
 <20170404184518.33610-2-icenowy@aosc.io>
 <20170405071508.yaur35xuli4jgkfb@lukather>
 <7828ffa0-f570-9841-a9e6-fe175f8169ac@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mgg3xuajsuvfzqcp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7828ffa0-f570-9841-a9e6-fe175f8169ac-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mgg3xuajsuvfzqcp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 03:17:19PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E5=9C=A8 2017=E5=B9=B404=E6=9C=8805=E6=97=A5 15:15, Maxime Ripard =E5=86=
=99=E9=81=93:
> > On Wed, Apr 05, 2017 at 02:45:17AM +0800, Icenowy Zheng wrote:
> > > As we added USB0 route auto switching support for A64, add related
> > > device tree parts to the A64 DTSI file (EHCI0/OHCI0 controllers and t=
he
> > > pmu0 memory area for PHY).
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 +++++++++++++++++=
+++++++
> > >  1 file changed, 24 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm=
64/boot/dts/allwinner/sun50i-a64.dtsi
> > > index 1c64ea2d23f9..a8916df99048 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > @@ -179,8 +179,10 @@
> > >  		usbphy: phy@01c19400 {
> > >  			compatible =3D "allwinner,sun50i-a64-usb-phy";
> > >  			reg =3D <0x01c19400 0x14>,
> > > +			      <0x01c1a800 0x4>,
> > >  			      <0x01c1b800 0x4>;
> > >  			reg-names =3D "phy_ctrl",
> > > +				    "pmu0",
> >=20
> > This breaks the older DTs, and that property isn't documented.
>=20
> It's already documented.
>=20
> In the H3 dual-route patchset I have already added this.
>=20
> ("  * "pmu0" for H3, V3s and A64")

This is not in linux-next then, sorry.

> P.S. to be compatible with older DTs, I think I should adjust
> the phy driver, make it enable dual-route function only when
> pmu0 is present.

That, or if we're quick enough, we can still add it to 4.11. There's a
bit of time left.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mgg3xuajsuvfzqcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5JwiAAoJEBx+YmzsjxAg/1EP/RMdtrhEDoEsLO+KTQqLDSo7
1h7bChzJDjX1h6AuGUDT9wiCcdOC+OIqbjO9J7pHvDFdvCt4uyhGTEOcUIgePWcF
3XzzXm8nEY66RI6WnGLzhQ3djJYVDuchten6WGQRnja69UGjOXRMmokQssNyYsUc
85qkiJ4qqz6/8CjUsA6h7fw1O/2keVt7aSObHhfygZQahu6CP9C838ctsMDA36Gq
WQ7KvY11lfwtRx9KESQcR4hN1Vod0GPsJjy9BhlqF6eSqOkp+Ql1uUE0jNTUEMW+
3+qfKobuL5IxigsIt2xh139U0qOkTbQSo7JrTpMTDESOQd84XdGTNPZ03FSraJdo
2C5+GncqKE0swyTAa0Z/2FEAK9MB67KubP+cFVp3G9ydcMpY4RWx+/dUaERsD4o8
TF27gOeZQ8p50vG9ROzhPzMqm/IAWmLobMOIv7zesAufn8kjVZ8Yvv+8L/WjgPfl
3S8MhKpbpPmsVPwFabhTbazMqK/x9qRv2VzpzxVlqdBq7PsG97mvanYJ69K2W1IT
7XfinOTwE1ap/RCNc2TzOc6USXMMSR+RVRzI10olE7EuURW0PiV9ul23uUG8LGOO
4Ob2zLqcr/ZPpMak59jpWdddD6pizp3/O5RNBPDvB2WZHlzjJUCoZxWBOomeb5fy
UzVMpKulilYOMSPzBDBC
=PvL6
-----END PGP SIGNATURE-----

--mgg3xuajsuvfzqcp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

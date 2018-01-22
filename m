From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun9i: Enable USB support on Cubieboard4
Date: Mon, 22 Jan 2018 09:38:33 +0100
Message-ID: <20180122083833.cnjsks3dj3uakcbt@flea.lan>
References: <20171216205809.5485-1-kettenis@openbsd.org>
 <CAGb2v66XNAHwAU1eosYjGKgYKkh9YiVEooE9e45RSVvPOvhYLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fokdjgen3ctkbkrs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66XNAHwAU1eosYjGKgYKkh9YiVEooE9e45RSVvPOvhYLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fokdjgen3ctkbkrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2018 at 02:12:04PM +0800, Chen-Yu Tsai wrote:
> Maxime,
>=20
> On Sun, Dec 17, 2017 at 4:58 AM, Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org> wro=
te:
> > On the Cubieboard4 HCI0 is directly connected to a USB connector,
> > and HCI2 is connected to a USB hub on the board.  HCI1 is available
> > with HSIC throug 2 pins on the GPIO expansion header, but left
> > disabled just like on the Optimus board.
> >
> > This patch also adds the VBUS regulators.
> >
> > Signed-off-by: Mark Kettenis <kettenis-7YlrpqBBQ3VAfugRpC6u6w@public.gmane.org>
>=20
> Any thoughts on this patch?
>=20
> It's similar to what I sent a few years back:
>=20
>     https://patchwork.kernel.org/patch/6359461/

Given the previous discussion, I guess we should have much more
comments on how it is designed.

There was some effort to have power sequence for USB devices described
in the DT here:
https://patchwork.kernel.org/patch/9800887/

I guess pinging Peter to know the current state would be a good way
forward.

> >  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 36 +++++++++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boo=
t/dts/sun9i-a80-cubieboard4.dts
> > index 4024639aa005..e38623265695 100644
> > --- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> > +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> > @@ -74,6 +74,24 @@
> >                 };
> >         };
> >
> > +       reg_usb1_vbus: usb1-vbus {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "usb2-drvbus";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               enable-active-high;
> > +               gpio =3D <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
> > +       };
> > +
> > +       reg_usb3_vbus: usb3-vbus {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "usb1-drvbus";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               enable-active-high;
> > +               gpio =3D <&pio 7 14 GPIO_ACTIVE_HIGH>; /* PH14 */
> > +       };

You should also have a proper parenthood relationship here, and not
just leave these two regulators hanging around.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fokdjgen3ctkbkrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlplowgACgkQ0rTAlCFN
r3S2/Q//dKh5g6qLYPnbP+GC6sSMV2/4kqyzN1AdL+XQm9nSMx2F3kFrmGizF3QA
EBh0LNz30HUAwRAqoarvr9AjsIT2bjg9RRlnpuMRpR7/pQ6p+rJTUvhVdRSwDMB1
84KYsOqNFWIF5E0wRbH1KuwxT6uIh725YgDHOHxCRazeAVmcQqzIJ2+ostptMEnj
j3nF2nGej8ep215ftJ2c+nJstFXfwe9HfbhVa74nQFNOAFDmeBRhY8DnH3J+o9WT
ipQBXzZZQXSbm4PQzGWJpA4T/l7/11FRZEGXXrC8IVY5ugJ5lcrmzM46x8H1yrQt
cW4uiuxE5REq2WS19Sx6Sst+EILa6W65xi9xh5vTn5R0mAqyKtcZV06OsZF/eufF
RT1in9qFlkzxu3Ie26eJYaR/MrLKHl1HaH1enj8zNX8vf8V0nDz0bY1UDWDW6jhr
cuyuOWzQzIwJzgFe1y9l8D6ujz74SWlKNNMA2uE+DNWFEbS3W1g0SGqYDs6KWJyR
/vW67baZoNepwjgubIzilBdjtK8YqLIgZX4hEwKgUxoJ8MfQt0wTe/l16BL/tKcx
pIKjubpMGtWYk2dOUVm7a164mTGf521Rxj/2kSC7DqgDV7+m4tCbdpnncK0sAJSr
Tzec11ETLP02dkhof5nVZ3nG8dbVnqYhlLNDLW/AyLZ9INsbRc0=
=zVPs
-----END PGP SIGNATURE-----

--fokdjgen3ctkbkrs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

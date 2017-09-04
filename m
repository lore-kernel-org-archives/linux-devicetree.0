From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: sun8i: h3: Enable AP6212
 WiFi on mmc1 on Nanopi M1 Plus
Date: Mon, 4 Sep 2017 10:04:15 +0200
Message-ID: <20170904080415.ptgjnkjwtdthp7ds@flea>
References: <1504283401-4263-1-git-send-email-embed3d@gmail.com>
 <1504283401-4263-2-git-send-email-embed3d@gmail.com>
 <495813cc0e2ea09e495bfe14d595b926@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ecju2d4hub3viizq"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCUSWTGQKGQEDZ4T34A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <495813cc0e2ea09e495bfe14d595b926-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ecju2d4hub3viizq
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 02, 2017 at 03:01:57PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-09-02 00:30=EF=BC=8CPhilipp Rossak =E5=86=99=E9=81=93=EF=
=BC=9A
> > From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >=20
> > The WiFi side of the AP6212 WiFi/BT combo module is connected to
> > mmc1. There are also GPIOs for enable and interrupts.
> >=20
> > Enable WiFi on this board by enabling mmc1 and adding the power
> > sequencing clocks and GPIO, as well as the chip's interrupt line.
> >=20
> > Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 25
> > +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> > b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> > index 6256f55..7d18c35 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> > @@ -48,6 +48,13 @@
> >=20
> >  	aliases {
> >  		serial1 =3D &uart3;
> > +		ethernet1 =3D &sdio_wifi;
>=20
> When the Wi-Fi module itself has fixed MAC address, there's
> no need for such an alias.

But the description is also accurate, which is what matters in the DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--ecju2d4hub3viizq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrQj/AAoJEBx+YmzsjxAgPXEP/0M5+0+MvJ3ITBIH+IFYHTLc
Pz28KPsrXor35lEI3XqAqxVv0eUTt4vm05nbp8ea98QNbPp/hyQQoLyG3VZwDa2T
t2Y6YYXs4rS2f+0+ll9srAvZ6sMNznydJagken4hj59z99K/2/u0DRZjN2vkQkzl
iOrMhZnGKlMv0O2bpNfEeumYvOUK+Cb+Thk+UQoZFDh13w4jolT7SF7qMJqtblQi
P3/Ok690WF7T52NOjzgbtU2SGQa0cmJQdr8HtBNagIWuW+wjglZy8QiW0xUCPY+a
Ii2qKyMUnell4930XK8Vcv6f2fibT8LoihSPfB1aBE36jp52OWACl348N3ltgDHw
0xBukfvun3S+vcMM8UlecbJHXEFxNT88l3j0HnKN02wXDBj+vRKyKkO+gzJ0TBML
Ezfp2dYD+k7w4TUKBe+tiHHk/5caK2wqvhvi0Z6nZpmt2JNJED+uKlr9YxpYQaAh
tKzXMijtaR6kH7+peA6/xSPVHG/tYVB03H8JyptYtdtGSfDTSOY7AZO4s+kHscmE
4k1IM1HqID6/yz0CU2jRWwCvC2Vd+dBs5QuuqpNCVvHG8G7XAISw5Dil9EKCjDj9
1PhZWKFDn6LozGwFph9SotNJS4Ob+dIIMrOv595uiGUKcjo+6H4/kpKiUAdglUwt
JPpqDHfdi9Bo3RtpBZl9
=JpTJ
-----END PGP SIGNATURE-----

--ecju2d4hub3viizq--

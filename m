From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add BCM53125 Device Tree nodes
Date: Sun, 26 Jun 2016 10:05:50 +0200
Message-ID: <20160626080550.GG4000@lukather>
References: <1465690459-30751-1-git-send-email-f.fainelli@gmail.com>
 <1465690459-30751-2-git-send-email-f.fainelli@gmail.com>
 <CAGb2v64u74cXG0R-MSMtDBxBpg2tFoifQwqbvWL-+3pG=GLVTQ@mail.gmail.com>
 <576F450B.3080207@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3607uds81ZQvwCD0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <576F450B.3080207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3607uds81ZQvwCD0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Sat, Jun 25, 2016 at 07:59:23PM -0700, Florian Fainelli wrote:
> Le 23/06/2016 22:48, Chen-Yu Tsai a =E9crit :
> >> diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot=
/dts/sun7i-a20-lamobo-r1.dts
> >> index 5ee43d8bf174..697582397dcf 100644
> >> --- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> >> +++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> >> @@ -110,13 +110,67 @@
> >>  &gmac {
> >>         pinctrl-names =3D "default";
> >>         pinctrl-0 =3D <&gmac_pins_rgmii_a>;
> >> -       phy =3D <&phy1>;
> >>         phy-mode =3D "rgmii";
> >>         phy-supply =3D <&reg_gmac_3v3>;
> >>         status =3D "okay";
> >>
> >> -       phy1: ethernet-phy@1 {
> >> -               reg =3D <1>;
> >> +       fixed-link {
> >> +               speed =3D <1000>;
> >> +               full-duplex;
> >> +       };
> >> +
> >> +       mdio1 {
> >=20
> > mdio will suffice.
>=20
> There is another label in sun7i-a20.dtsi named mdio which is for the
> MDIO controller node matching allwinner,sun4i-a10-mdio, which is not the
> one we want here, we want the MDIO controller associated with the
> Synopsys GMAC.

Yes, but it's in a different node, and you're not using any labels, so
I don't really see how that would conflict.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--3607uds81ZQvwCD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb4zeAAoJEBx+YmzsjxAgntQP/1MvlCOtV/07VByDJcDF+TsF
uCtSdYpu6kaiUCPlTeURPgBgP6R9Dr2Qt5WuCPq26tEwqWO/3YK/4mXHRS8d0HL8
N5ow9c36Nr6lK6OfZyzpZ7DkUUQ/0iVtO24KHVoQETtlENWMII6io46rDFgTysh7
dHESSFcgQhL7/cNz4kikebbGcJcrqoHtJlrF0PRv9qjCpBhxEGrhzndjwspLQe7e
37EFyrEbZOMLrOF11POujQ52BjXYswEo/XLR8LTG+cvAMZusWrR4FBMJMuszx9uu
Cr10vACHZfPmwzM9UnAWXMTtLOGHY0W2aN1Wh8Lj0I4kVj2Jk7BOcxi+n0hRmhxq
4a+VwNEAMViW7jRU8PfZpw2T1bKVc2gnm8Fn/3iRfr/YHRiFPckNh2j9Nx77af/2
gD3S1xti1NpD13b9g8DX72mdHmZWSg1Iaxm8MYd/rHhnvex2R527g9+G78TkTsKD
/HTdSSyzOZHDLmJIKMZFjBSS4sLeKyQbv8Oeac+4NOKMgj7cKHJBT7ca6YCDefKw
ptWvVo287pVX/ywAluIjDOcI8wfJ1jc9SBOd93nyVh8KsWawN9YdMkAi+BlwS7L1
UfIUocCP32ItWOkrTwSAhteFZU6u+AosGnW2V1d+vuw+YRbpwB/rkFgpCoiVCGnc
7Yi24rgi9veftc465/cR
=bWNT
-----END PGP SIGNATURE-----

--3607uds81ZQvwCD0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

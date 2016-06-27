From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add BCM53125 Device Tree nodes
Date: Mon, 27 Jun 2016 10:09:34 +0200
Message-ID: <20160627080934.GS4000@lukather>
References: <1465690459-30751-1-git-send-email-f.fainelli@gmail.com>
 <1465690459-30751-2-git-send-email-f.fainelli@gmail.com>
 <CAGb2v64u74cXG0R-MSMtDBxBpg2tFoifQwqbvWL-+3pG=GLVTQ@mail.gmail.com>
 <576F450B.3080207@gmail.com>
 <20160626080550.GG4000@lukather>
 <57701053.9090903@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JWOY2/vB4uO4FuME"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57701053.9090903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--JWOY2/vB4uO4FuME
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 26, 2016 at 10:26:43AM -0700, Florian Fainelli wrote:
> Le 26/06/2016 01:05, Maxime Ripard a =E9crit :
> > Hi Florian,
> >=20
> > On Sat, Jun 25, 2016 at 07:59:23PM -0700, Florian Fainelli wrote:
> >> Le 23/06/2016 22:48, Chen-Yu Tsai a =E9crit :
> >>>> diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/bo=
ot/dts/sun7i-a20-lamobo-r1.dts
> >>>> index 5ee43d8bf174..697582397dcf 100644
> >>>> --- a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> >>>> +++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
> >>>> @@ -110,13 +110,67 @@
> >>>>  &gmac {
> >>>>         pinctrl-names =3D "default";
> >>>>         pinctrl-0 =3D <&gmac_pins_rgmii_a>;
> >>>> -       phy =3D <&phy1>;
> >>>>         phy-mode =3D "rgmii";
> >>>>         phy-supply =3D <&reg_gmac_3v3>;
> >>>>         status =3D "okay";
> >>>>
> >>>> -       phy1: ethernet-phy@1 {
> >>>> -               reg =3D <1>;
> >>>> +       fixed-link {
> >>>> +               speed =3D <1000>;
> >>>> +               full-duplex;
> >>>> +       };
> >>>> +
> >>>> +       mdio1 {
> >>>
> >>> mdio will suffice.
> >>
> >> There is another label in sun7i-a20.dtsi named mdio which is for the
> >> MDIO controller node matching allwinner,sun4i-a10-mdio, which is not t=
he
> >> one we want here, we want the MDIO controller associated with the
> >> Synopsys GMAC.
> >=20
> > Yes, but it's in a different node, and you're not using any labels, so
> > I don't really see how that would conflict.
>=20
> Fair enough, I sent a v2 which uses "mdio-gmac" as a label, should I
> respin a v3 which just uses "mdio"?

Yes, please do, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--JWOY2/vB4uO4FuME
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcN8+AAoJEBx+YmzsjxAglQcP/3GTkK/fTPH0m7/lx3+flDPG
/xVMb7TeWKgx63L+Sek099hy8G/YjaMMmEN36HsrK4dazWv7RHMuUkJlQCKQO4Cy
gMOJ4VdkC05/cwFW12TwbqrnQRDDYTP5pXsnb9uOXu5y+1FLeWraDbdwcvHb6lrl
RPtVBDNzI2ky6b23Kq8r4jcsWUNGes6xU7viEwmjnM5SHjJwib/jUYHSfjF0xMhR
MlxAm4UkKTNhFfd1+4YpwbvD8OxRkYlnfzvbmqHGGolW8ozHV2x8irduozKceYz6
wZO2bRf5+aAjoVBYH80LLxhx908njyCmKE1FbQHkwNuiOivzHAZbqSP289zdQnxz
VgEY538iyhCBgvdxXfjc8HR024O85pQjAosTmCM/g4qspjp2eheiKMhmJOYSrkKI
Ctoy2wFsdQP/c9b73dy+suVq4obEuzkQSq10XCTz76KwmQfhZyX6xOFWz7a3ZYIN
SCO9HPbt6OPPLhg8eRLMDEFL8MdkE5JPsoslKoEl+8yPNY7GgOWFIfUr1Q7Q68Jn
ZW5frJjNTsfCiyCbrlqkvaogmNIg1fc4aEC+nd39O4yioNGFlgrGH9YqxWZ/9zPs
kR/LJs2AGAbs0+3vZy+BY1tl/YBoVlPlFHaMjZukBSww7T6v7bVmMr6OwyojchSj
VgGkzmW09UjX1KQBddZi
=SL9V
-----END PGP SIGNATURE-----

--JWOY2/vB4uO4FuME--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

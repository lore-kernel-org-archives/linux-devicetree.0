From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Move mcp23s08 from gpio
Date: Mon, 9 Oct 2017 12:33:57 +0200
Message-ID: <20171009103357.kcj2uqse6yv2xepm@earth>
References: <20171005075002.9901-1-poeschel@lemonage.de>
 <CACRpkdY=r8XBqHKrVeZ34jR8FJM-zmOUxCSMhEROc6fOjfwX-A@mail.gmail.com>
 <8063886.6te7U6k3td@lem-wkst-02>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l7xlvcujhttdbf27"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8063886.6te7U6k3td@lem-wkst-02>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--l7xlvcujhttdbf27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 09, 2017 at 11:39:02AM +0200, Lars Poeschel wrote:
> On Sun, Oct 8, 2017 at 01:58:52 CEST Linus Walleij wrote:
>=20
> CCing-in Sebastian Reichel who did the move to pinctrl and pinctrl suppor=
t as=20
> well.
>=20
> > On Thu, Oct 5, 2017 at 9:50 AM, Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org> wr=
ote:
> > > The mcp23s08 driver was moved from gpio to pinctrl. This moves it's
> > > devicetree binding doc as well. So driver and binding doc are in sync
> > > again.
> > >=20
> > > Signed-off-by: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
> >=20
> > Are there no new references to the generic pin control binding
> > needed as well?
>=20
> Well, yes there is one: As far as I can see it supports the bias-pull-up=
=20
> property.
> My first intention was to have the doc as we have it in the right place, =
but=20
> you are right: It needs an update as well. I can do this, but Sebastian,=
=20
> please keep an eye on that.
>=20
> As there are already patches depending on this patch (https://marc.info/?
> l=3Dlinux-gpio&m=3D150726650325394&w=3D4) I would suggest, that you pull =
in this=20
> patch as is and I do the little update on the doc as a seperate patch.

Yes, the driver supports being used as pin controller with the
"bias-pull-up;" property now. For example I use this with a RPi
to enable pull-ups for all pins:

gpio21: gpio@21 {
        compatible =3D "microchip,mcp23017";
        gpio-controller;
        #gpio-cells =3D <0x2>;
        reg =3D <0x21>;
        interrupt-parent =3D <&socgpio>;
        interrupts =3D <0x17 0x8>;
        interrupt-names =3D "mcp23017@21 irq";
        interrupt-controller;
        #interrupt-cells =3D <0x2>;
        microchip,irq-mirror;
        pinctrl-names =3D "default";
        pinctrl-0 =3D <&i2cgpio0irq &gpio21pullups>;

        gpio21pullups: pinmux {
                pins =3D "gpio0", "gpio1", "gpio2", "gpio3",
                       "gpio4", "gpio5", "gpio6", "gpio7",
                       "gpio8", "gpio9", "gpio10", "gpio11",
                       "gpio12", "gpio13", "gpio14", "gpio15";
                bias-pull-up;
        }; =20
};

-- Sebastian

--l7xlvcujhttdbf27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnbUJUACgkQ2O7X88g7
+prHIg/8Doq/Uas/Voxuuz8/F86YYlv8KAWR+uFicLkdLE82vwZb1HapDN/OW35+
yDCXkZxoktepUhukO8jq6tWUzACuckLyNtC76lL98/LaCDRe+C1zhGBG8vazSEG6
R52Ic2fu/LGgSixd2DN0Ybeg8NI5sPrRu0k2XA0MyxHPYXKJEeau6p31UvIFyMnw
LmOEyWL2Ij5ZngXsKyy50hF8Ed+fxqw8RnfgVaTMl+cdzVHCAhTmOVClPlEeGoXL
wBDOOA2LBoJ7JsZXB9gvsNWSDuNNVTyM1YY0E+ZYgv1ymUjNgodRDg2tWroFPMBo
GLveJrHbjvRYCpXMdCpfRtH7WcylTLWP+amkTSBJLuHrejNGmczzIft2VohNYBB3
xF7+5lHDiGeGyK7QyXkBVajz9rBcfDi7cafQGgFqzCtnEadA90bRINjxCp7iLw+P
5FnZep+PSPgRBT+DrQF8vGSLGwf+D52B+9ZcH1j0v8NsOGhR7GDYhVUcTWs3zCMD
m2lsSouCR63UVRCoyiaKkdpzlT71fZaaGl/X+BrkJYEepDmMuemcJ5PF0gD6AW+8
fvVdvYEoNtNbXshmpRBuVacYC5TNM7bODPtHfKi/EFTVpk4n6KByOjW1UWFGxMVy
cgDpCIcxkJabNETBgLs36pI5QQKd2Wl/H8/Q198n+3h5+dN+Www=
=aQuN
-----END PGP SIGNATURE-----

--l7xlvcujhttdbf27--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

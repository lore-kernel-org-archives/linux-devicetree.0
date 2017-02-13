From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v4 3/3] MIPS: ath79: Fix the USB PHY reset names
Date: Mon, 13 Feb 2017 09:30:07 +0100
Message-ID: <20170213093007.7b76fd7c@tock>
References: <1486324352-15188-1-git-send-email-albeu@free.fr>
        <1486324352-15188-3-git-send-email-albeu@free.fr>
        <20170211220129.GG24226@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3VoXh3x+sdCmcgfQ3sw6haQ"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170211220129.GG24226-4bYivNCBEGTR3KXKvIWQxtm+Uo4AYnCiHZ5vskTnxNA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/3VoXh3x+sdCmcgfQ3sw6haQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Feb 2017 22:01:29 +0000
James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:

> Hi Alban,
>=20
> On Sun, Feb 05, 2017 at 08:52:32PM +0100, Alban wrote:
> > From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> >=20
> > The binding for the USB PHY went thru before the driver. However the
> > new version of the driver now use the PHY core support for reset, and
> > this expect the reset to be named "phy". So remove the "usb-" prefix
> > from the the reset names.
> >=20
> > Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/phy/phy-ath79-usb.txt | 4 ++--
> >  arch/mips/boot/dts/qca/ar9132.dtsi                      | 2 +- =20
>=20
> <snip>
>=20
> > diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qc=
a/ar9132.dtsi
> > index 302f0a8..808c2bb 100644
> > --- a/arch/mips/boot/dts/qca/ar9132.dtsi
> > +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> > @@ -160,7 +160,7 @@
> >  	usb_phy: usb-phy {
> >  		compatible =3D "qca,ar7100-usb-phy";
> > =20
> > -		reset-names =3D "usb-phy", "usb-suspend-override";
> > +		reset-names =3D "phy", "suspend-override"; =20
>=20
> Does arch/mips/boot/dts/qca/ar9331.dtsi need updating too?

Right, I forgot the AR9331 had been added since then, I'll send a new
series.

Alban


--Sig_/3VoXh3x+sdCmcgfQ3sw6haQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoW6PAAoJEHSUmkuduC280acQAIT2+u5HojN3Bw2JIrqUp3XZ
49QEccjGIhhHpO30tp0qhqa0C6fLWoF0SQ7Vb2i0ECPGpEjezUMg5ri2FWUMTcyi
oDA92ZG9AA0jBG0U58TgolECPGlommEi5Qr+2dWHuoNdKgleXel8v72KKVRfIgqZ
zBfHjGyG4yRZQ6EoXg/fcSFAcy2BlkJgOX3ez88sedAQNGcPFjZV8216LsHWKiMM
yiuiHegxXsultB0O8GHc9lp2Vqb16O2zfCyk5eMTryeiIdpW+yzEYaC5rejDDVE2
tY/03adHFWZG7msU3/ZfYMs9DaKhsG4u+Pzrq33W9zrZGe45EhypHNVXVSY8YB4g
2nRddep4srCufKfHC5yfBq1XFAentMxqMwu1/+WEgVJPZu70yO9JlCBkmb2s4tD/
ZxRR3qtf66BlhomYJftwxEU5p1YOE8QNDcB/mv9prqVfm5n/B5ro4jhkOo3JQaxI
vOudSdIYHr2px+TGs3+TUzKBC7ee143261c/zQ2gEdtAxIXjS1tiW/SD/vuP71dz
4AtyEdKj1A8MXCnauiqnkppk+SGkVOoTJHW2g7bVSsQzcJqLF4DzVo7xjd2j48p2
1qoGkQB8nd9r+18Dc4qEt+HMFue13YcqaFEGOA8BmkOvfEc7O3x5YPibauYL0avT
/4D2ZpAiHeMbYsD5yFB/
=0uzD
-----END PGP SIGNATURE-----

--Sig_/3VoXh3x+sdCmcgfQ3sw6haQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

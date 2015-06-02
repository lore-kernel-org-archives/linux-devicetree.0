From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun6i: Add a dts file for the Mele A1000G quad
 top set box
Date: Tue, 2 Jun 2015 23:49:46 +0200
Message-ID: <20150602214946.GF23777@lukather>
References: <1433170979-13725-1-git-send-email-hdegoede@redhat.com>
 <20150602155816.GC23777@lukather>
 <556DF6DB.8040601@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PBu/a+gn9/ndsyD5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556DF6DB.8040601-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PBu/a+gn9/ndsyD5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2015 at 08:32:59PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 06/02/2015 05:58 PM, Maxime Ripard wrote:
> >On Mon, Jun 01, 2015 at 05:02:59PM +0200, Hans de Goede wrote:
> >>The Mele A1000G-quad and the Mele M9 have the same PCB, sofar we've bee=
n using
> >>the same dts for both models. Unfortunately this does not work for the =
otg
> >>controller, on the M9 this is routed to a micro-usb connector on the ou=
tside,
> >>while as on the A1000G-quad it is connected to an usb to sata bridge
> >>(which is not populated on the M9 pcb).
> >>
> >>This commit adds a new dts for the Mele-A1000G-quad to allow using
> >>different otg controller settings on the 2 boards.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  arch/arm/boot/dts/Makefile                                        | 1=
 +
> >>  arch/arm/boot/dts/{sun6i-a31-m9.dts =3D> sun6i-a31-a1000g-quad.dts} |=
 4 ++--
> >
> >Didn't we say that we were trying to set the vendor name in the DTs
> >now, at least for the new ones?
>=20
> I think we said that Paul would write a proposal to standardize
> naming for future boards, but that never materialized.
>=20
> >I can fix this and apply it if it's ok for you.
>=20
> I'm fine with throwing -mele- in there, or not, what ever you
> prefer.

Ok, applied and fixed the name.

This is probably going to be the last patch pulled for 4.2, unless
something important shows up in the next few days.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PBu/a+gn9/ndsyD5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVbiT6AAoJEBx+YmzsjxAgQHAP/1Bk7vKAatEVYoXHsScskFH+
EsQt2pygWVG7IEmGtLnQiIpzhoVA6URpq93COhoKIbv9dRjVov3OZl1wSRxWFg5/
BpBIGH+1scCmGO9ZLajQawXe9PmgNjzhmXVfk6y/M074x6L4pFEvDhMJL+aXkpxs
Rt5/0VVQI3Pskr3wCy+77bMpx+yezVqkkb12PHQ+nIAZa57x7W0LjUCxuPGgzoxR
NyeiIUHDgEeviywjmNpZpOFW7TNgjn4a0qbpdIel2WomrDcWmjnHS8XyolcCrdlx
qL5Oe9/pclQrh82m0YBH0LgfkbnRXxEniGrMNH9hx3K9Z1UUXM3nEMrQHaK3TOEm
KyWIAmEOdKwfejvA1z3pFQB/UubvkHpWtBfKDzkn3SatkvzYhMHbgBRMrWVlBUzB
kynqwUgHdAlgcQJSTOqDeXPW7STahBwYgmrD4teX656KyCcOl1k399zl1JHchpeK
8hpm6BXrsZArZGnygZCCHf84GuwGgXVdThLuk0GV9q+sR53SYsP+7QxiwKeEeQLa
jUfrtqX2QiGK3rhx28HaUsu63BFR0loNGy+7Z7aMziq23tImCEy1vOPYlp8f1lf2
AN+MFqWVujV5Gute21hWS9IV6G1tInI+PEsvoHhCCT3s4kivQZz+wbU+D05timv9
MUvsWy0blaC3qXT0TP2X
=OOcY
-----END PGP SIGNATURE-----

--PBu/a+gn9/ndsyD5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

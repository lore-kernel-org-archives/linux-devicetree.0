From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: devicetree: root node
 serial-number property documentation
Date: Wed, 06 May 2015 16:26:13 +0200
Message-ID: <1430922373.2577.24.camel@collins>
References: <1430206196-3483-1-git-send-email-contact@paulk.fr>
	 <CAL_JsqKbSgZ4gXVc=FG_RKic-JM4_Mhzdh3Lh26NCa6zrc74dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-JQH0TbBdpW1BTjDhWNLO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKbSgZ4gXVc=FG_RKic-JM4_Mhzdh3Lh26NCa6zrc74dA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-JQH0TbBdpW1BTjDhWNLO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2015 =C3=A0 08:26 -0500, Rob Herring a =C3=A9crit :
> On Tue, Apr 28, 2015 at 2:29 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wro=
te:
> > Open firmware is already using the serial-number property for passing t=
he
> > device's serial number from the bootloader to the kernel. In addition, =
lshw
> > already has support for scanning this property.
> >
> > The serial number is a string that somewhat represents the device's ser=
ial
> > number. It might come from some form of storage (e.g. an eeprom) and be
> > programmed at factory-time by the manufacturer or come from identificat=
ion
> > bits available in e.g. the SoC (note that the soc_id property in the So=
C bus
> > should hold a full account of those bits).
> >
> > The serial number is taken as-is from the bootloader, so it is up to th=
e
> > bootloader to define where the serial number comes from and what length=
 it
> > should be. Some use cases for the serial number require it to have a ma=
ximum
> > length (e.g. for USB serial number) and some other cases imply more res=
trictions
> > on what the serial number should look like (e.g. in Android, the ro.ser=
ialno
> > property is usually a 16-bytes (plus one null byte) representation of a=
 64 bit
> > number).
> >
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> What Russell was referring to for submitting is his patch tracker:
>=20
> http://www.arm.linux.org.uk/developer/patches/

Thanks for the hint, that's done now.

> > ---
> >  Documentation/devicetree/booting-without-of.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/booting-without-of.txt b/Document=
ation/devicetree/booting-without-of.txt
> > index 7768518..95fc385 100644
> > --- a/Documentation/devicetree/booting-without-of.txt
> > +++ b/Documentation/devicetree/booting-without-of.txt
> > @@ -828,6 +828,10 @@ address which can extend beyond that limit.
> >    name may clash with standard defined ones, you prefix them with your
> >    vendor name and a comma.
> >
> > +  Additional properties for the root node:
> > +
> > +    - serial-number : a string representing the device's serial number
> > +
> >    b) The /cpus node
> >
> >    This node is the parent of all individual CPU nodes. It doesn't
> > --
> > 1.9.1
> >


--=-JQH0TbBdpW1BTjDhWNLO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVSiSFAAoJEIT9weqP7pUM0EkP/3cR67ULJyRcHcySA9vTS171
AKvVxM7lEs8YWNM/Ys7IgwElKA18Eh1LdqF1MvqtBen1yYJq6DvER1nt9j/lilyP
hThVu0SgWG8jI+7+Yfa6DeXDEhufrgDBMCoCtTREx2GWweFsG3q/ciT/8HghBtJ6
oidcFAHMH9jq27VRwkOse0aStDYVBZF4ocrMvMI09HdHXDHnIssHyuxHNnMnguZ0
opcfKBwn5Si8GVCZXxE1GLW0ANlM7ktvqntNWcGJt91ILXE5JrDqbqG1I+62uf/+
99KQwK/Ono1OKl+b2ZlH72r6fwxBDms4EpfwLP8O7fhN69NwffzM3qwPl01IPs+g
fvrYdfuCzDJIfG8AZk4GmnzM2d4+hwJnQU6yu5I5iMTSYpwbHyxTMxQOYJsHua1t
wkP6jVQbIv3Yjwu6/RsMirV17eps/lF6LqgYgHLbcGUBsvyU05SJCCBZuN+7Yvj/
5kduQhj3TyhGFrB/0VLMZYtSiybzpAgtlgMd9uiHpUKTbxxXALS4sAkRndJRyWfj
Op52fuuTvowDmzXj86gjkojQr2aZkQuzAl0eKe+RxtrMXEurJoLIlF3p8lsFWlaV
RWO8/yBAo34stE7Uga0DyxiLn8BjV9NZNgR03HO1ks51CUzklMSbSuqEgEAfnp6Z
/3M4NS40+wHfF3oGFnJh
=r7Ts
-----END PGP SIGNATURE-----

--=-JQH0TbBdpW1BTjDhWNLO--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

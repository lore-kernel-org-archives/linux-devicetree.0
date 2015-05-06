From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Wed, 06 May 2015 11:37:26 +0200
Message-ID: <1430905046.2577.1.camel@collins>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
	 <1429351135-11842-2-git-send-email-contact@paulk.fr>
	 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
	 <1430145747.3081.5.camel@collins>
	 <20150428160910.GE12732@n2100.arm.linux.org.uk>
	 <1430581582.5339.0.camel@collins>
	 <20150506090105.GC2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Sg01ovqq8MURl/x8eoyd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506090105.GC2067-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-Sg01ovqq8MURl/x8eoyd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2015 =C3=A0 10:01 +0100, Russell King - ARM Linux a
=C3=A9crit :
> On Sat, May 02, 2015 at 05:46:22PM +0200, Paul Kocialkowski wrote:
> > Le mardi 28 avril 2015 =C3=A0 17:09 +0100, Russell King - ARM Linux a =
=C3=A9crit :
> > > On Mon, Apr 27, 2015 at 04:42:27PM +0200, Paul Kocialkowski wrote:
> > > > Well, of_property_read_string is only defined when CONFIG_OF is set
> > > > (base.c is always built in drivers/of but the directory is only inc=
luded
> > > > when CONFIG_OF is set).
> > > >=20
> > > > Of course, on ARM, we now expect that it is the case, but it seems =
like
> > > > good practice to check for it, since it could theoretically be disa=
bled.
> > >=20
> > > That is _not_ "is the case" - there are a number of non-OF platforms.=
..
> > > including some which will probably never be converted.
> >=20
> > Right, so I think v4 should be fine too, given the empty functions in
> > case CONFIG_OF is not set.
>=20
> Yes, can you please put them in my patch system so we can get this
> applied?

What exactly do you mean?=20

I sent v4 to linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org and
devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org with you and Rob in the CC list, on the 28th
of April.

> Rob - does your ack apply to the v4 patch?
>=20
> Thanks.
>=20


--=-Sg01ovqq8MURl/x8eoyd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVSeDWAAoJEIT9weqP7pUMjR8P/0/dNsYV6rnSzVoTcCIVhxcv
P3uc4A1rIQGQQozN9aiMHWlSzeUBI21ohejjeN9Ey5oc9fLiUCsyov0UUX47+GeA
+2+HoWNMco2G5J1tPSf/oAObB72jOmOOpCf7sNeSoE7h+Gta1JKfviEG5xNcIazJ
A8JEFok6PyL+MLzw/pUEL69qlkKcqUZ9luwGOyHunTYuxc7Xk3YGr777gSDJkoqp
VYd6lq0AbC4ec5GicgUOX38ir3mp9NztPQIvnuVaQ3rWa0oorUOGAC1kEycJEhyD
oB8inUIFDQ+KGwItaOxk9xkvSykR7PPZvMfxBtOUCzVSiVbljgSDQMrNTVzkifXA
Edut5uK8a7ZnMfKYROIbwn3TO8shrIss852W/sOIjailHQM+MyljM9NytcnOXnx2
9CWvQ53irHk4ajg3YL6scmGfsfeku+yOY0ie2hxnjlMpY3k9g4A/SHMFqBYYpuyo
T/K5mk7VlDVI/UklNwFPpdIqcLj5qPFNr3iqXhIcHLjPbDov9Gud8WLNVs3ACH1q
1+ADRr74SqaIu6b1Q5K36FjVlaZyl09+9ziziza7pTr22cu34veNtsU0D2dfo+TD
anpKKQHsXb1ZDXniTqduD71yTLEZRERvt6VfQSJ2mafw0nwJ8gvypeQYmoyVwqGG
/Jhoy3r6rnFB34Ss0WJd
=hCBg
-----END PGP SIGNATURE-----

--=-Sg01ovqq8MURl/x8eoyd--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Sat, 18 Apr 2015 11:45:13 +0200
Message-ID: <1429350313.2424.1.camel@collins>
References: <1429296235-14123-1-git-send-email-contact@paulk.fr>
	 <1429296235-14123-2-git-send-email-contact@paulk.fr>
	 <20150418091310.GI12732@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-xMvaE4B5l9Tr7wrTsnoK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150418091310.GI12732-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-xMvaE4B5l9Tr7wrTsnoK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 18 avril 2015 =C3=A0 10:13 +0100, Russell King - ARM Linux a
=C3=A9crit :
> Hi,
>=20
> On Fri, Apr 17, 2015 at 08:43:55PM +0200, Paul Kocialkowski wrote:
> >  static int __init init_machine_late(void)
> >  {
> > +#ifdef CONFIG_OF
> > +	unsigned long dt_root;
> > +	int size;
> > +
> > +	dt_root =3D of_get_flat_dt_root();
> > +
> > +	/* Scan for serial number */
> > +	system_serial =3D of_get_flat_dt_prop(dt_root, "serial-number", &size=
);
>=20
> I was really hoping for:
>=20
> 	if (of_property_read_string(of_root, "serial-number", &system_serial))
> 		system_serial =3D NULL;
>=20
> here.  I can't see a reason to use the flattened DT at this point as
> we've already parsed it.

Good point -- I'm not very used to using device-tree so I didn't think
of it, thanks for mentioning it.

At this point, I guess I can also add your Signed-Off-By to the patch.

> I'd also put this after the call to machine_desc->init_late().

Will do.


--=-xMvaE4B5l9Tr7wrTsnoK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVMiepAAoJEIT9weqP7pUMRksP/1EN3o1xNLfXjyvZCOICPP2H
JNW0HeWJ8zvcqf1wSBPfc1w0whzOx4Bgk0JqRnXkl3zZCxBjIZesgQtVJdx2NqUE
ECD6bZkIluLMKKFFXj6t4rkmrUicvcw1Ie64TG4wpUyWNMCEhGxAszIrqWtKmdeO
nSb7PWe0MyNIdrDYa04OuaDc2mLOu2TJFHX2eXSsEr1x44Z4kZlgfCuEC80N3NME
1/hIQOfJjz5FVC7ss5Lz/IqBuz7sKjsKtbnWmo63lk4bup1LwnkAU6G8QeEIkxb+
m6x0F/2catSk4k/YluPuIFtijr61Il1/WpP5LaGkfOG6U7kJ3jMopLYJF1YfZm13
Ud0SiUR/WTZ9I9878zGjWnxf2vjxzHFKopAsCch72W9QXpzceDbLY9dbJjy3e0/8
XRMlfLOCc3r9qFx8CDTujKrDfi8IWZjElE10O52M+ZZF3FDCAlxvlrlp5TXv+A6q
m4GICxwm44GtvHqZb9ex2Hl/aSNyv50PRFYGsAgVDWv1vgFwywYdmF3BtD+8yktv
glWeZe0BQjwfvGE3F7F6F8O+QteMS3Ht+AyjFZJAROzlcPD9BJ5KpIgDgpeKd/+B
xh5iX9sfQlRy60/P2ipfKwWh9PxOK6n53gZYiwmkMtBHkDUwcqYoOXW2VTqPJ/qI
FRr0fLUw8yDIR1OO0IB6
=Y3D3
-----END PGP SIGNATURE-----

--=-xMvaE4B5l9Tr7wrTsnoK--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

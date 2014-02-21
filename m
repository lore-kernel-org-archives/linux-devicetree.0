From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Fri, 21 Feb 2014 09:41:03 -0600
Message-ID: <20140221154103.GF31902@saruman.home>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local>
 <20140220182257.GF23217@saruman.home>
 <20140221120454.GD8783@e106331-lin.cambridge.arm.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBdJBemW82xJqIAr"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140221120454.GD8783-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--gBdJBemW82xJqIAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 21, 2014 at 12:04:54PM +0000, Mark Rutland wrote:
> > > +Example:
> > > + 		axi-usb2-device@42e00000 {
> > > +                        compatible =3D "xlnx,axi-usb2-device-4.00.a";
> > > +                        interrupt-parent =3D <0x1>;
> > > +                        interrupts =3D <0x0 0x39 0x1>;
> > > +                        reg =3D <0x42e00000 0x10000>;
> > > +                        xlnx,include-dma =3D <0x1>;
> > > +                };
> > > +
> >=20
> > you need to Cc devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org for this.
>=20
> Cheers Filipe; thanks for adding us to Cc :)

sure, but it's "Felipe" ;-)

> > > +	/* Map the registers */
> > > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	udc->base_address =3D devm_ioremap_nocache(&pdev->dev, res->start,
> > > +						 resource_size(res));
> >=20
> > use devm_ioremap_resource() instead.
>=20
> Also, res might be NULL. You should check that before dereferencing it.

not needed when using devm_ioremap_resource(), see the implementation.

--=20
balbi

--gBdJBemW82xJqIAr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTB3OPAAoJEIaOsuA1yqRE9XQQAKCF8qE6Em3POwTf1G0zHjiY
RUqPY1kpRzpUMjt8CFSpJfNNbK/tah1O4C4e+uhWyq96UNz6Duyak50n8A2zgd2b
T0/ElEGpRIpr1HPoxWgwZCY9ixI6YZC/2Z4K6wMeQqKYAkn09Yxk54S4fFqoYzI5
62qdceKo61ItYZ3XOXZCL3ouQxxX5qTDEZmiFwFgrBIEmtANKL6cOUgnGHWVp0sh
Z92XwAYzEOoCK/0PuD6abm2kz/sVVzu1vWo53pkztHAaFqi8fxvPM4Leo+6I4pbe
b6Vy4cIOcDlJNW5iJAUp0a626XcilD60g/fhmbDjwF0PpQJUK7/2OSov6GkbC+4K
u4vegxyNbPVwrfTwuiAurw/4sVaj7i2goZnLOjuf1iobI3AKnGvqWa9e7W0rDYXb
in3LAPcd0n6FocbR/e3NJ/3PlInGzKc1cUX5AWCGJIqJECzI19CsRnJgF2gPLH0l
+OLo6d/LMSlmQQwOsh70ZrcjqP4UU7Ks82HzK6ToM/KQvHunK2pcuM6DpE/buI8d
J/qF2N9ao5comj4kF9svmN2XNrqb8sAVvlm5FjAwdlMzm/JdWjfZ87yYodIksgpE
Hly188GtWWok3oBA4IGG98LnV61rw/dFNF/SOjtG+uNd1EX9TfkjGNl+qbXl5GlI
30r1UELSFOA8WjeSQcne
=V8Hg
-----END PGP SIGNATURE-----

--gBdJBemW82xJqIAr--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

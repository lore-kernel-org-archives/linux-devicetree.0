From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 6/6] libfdt: Add overlay application function
Date: Mon, 25 Jul 2016 20:20:41 +0200
Message-ID: <20160725182041.GN7419@lukather>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
 <20160720142044.27527-7-maxime.ripard@free-electrons.com>
 <20160724142908.GF24621@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rzq/nSLlHy1djmXS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160724142908.GF24621-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Rzq/nSLlHy1djmXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jul 25, 2016 at 12:29:08AM +1000, David Gibson wrote:
> > +static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_of=
f,
> > +				 int property)
> > +{
> > +	const char *value;
> > +	const char *label;
> > +	int len;
> > +
> > +	value =3D fdt_getprop_by_offset(fdto, property,
> > +				      &label, &len);
> > +	if (!value) {
> > +		if (len =3D=3D -FDT_ERR_NOTFOUND)
> > +			return -FDT_ERR_INTERNAL;
> > +
> > +		return len;
> > +	}
> > +
> > +	do {
> > +		const char *prop_string =3D value;
> > +		const char *path, *name;
> > +		uint32_t prop_len =3D strnlen(value, len);
>=20
> prop_len is a bad name, since it could well be less than the length of
> the whole property.
>=20
> > +		uint32_t path_len, name_len;
> > +		char *sep, *endptr;
> > +		int index;
> > +		int ret;
> > +
> > +		path =3D prop_string;
> > +		sep =3D memchr(prop_string, ':', prop_len);
> > +		if (!sep || (*sep !=3D ':'))
> > +			return -FDT_ERR_BADSTRUCTURE;
>=20
> As mentioned on some of the other patches in the series, I think we
> want a new error code for bad fixup / overlay information.
>=20
> > +
> > +		path_len =3D sep - path;
> > +		if (path_len =3D=3D prop_len)
> > +			return -FDT_ERR_BADSTRUCTURE;
>=20
> I'm pretty sure this is impossible if sep !=3D NULL.
>=20
> > +		name =3D sep + 1;
>=20
> But I think the case you actually need to test for is path_len =3D=3D
> (prop_len - 1), that will occur when : is the last character.
>=20
> > +		sep =3D memchr(name, ':', prop_len);
> > +		if (!sep || *sep !=3D ':')
> > +			return -FDT_ERR_BADSTRUCTURE;
>=20
> This still isn't quite safe.  If the property has no \0, and : is the
> last character in it, you'll access beyond the end of the property
> here.  It's probably easier if you just fail early if there is no \0 -
> that's probably easier if you use memchr(\0) instead of strnlen().
>=20
> > +
> > +		name_len =3D sep - name;
> > +		if ((path_len + 1 + name_len) =3D=3D prop_len)
> > +			return -FDT_ERR_BADSTRUCTURE;
>=20
> Again, off-by-one in this test, I think.  Since there are so many
> tricky edge cases here, it might be worth making testcases for them.

What do you want here? That we move the parsing code out of that loop,
make it public and put the prototype in libfdt_internal, or that we
craft some DT that would outline all the possible issues with that
function, and just test the return code of fdt_overlay_apply?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Rzq/nSLlHy1djmXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXllh5AAoJEBx+YmzsjxAgIwYQAJlznmRhPHtgMUk+POtkj7iH
fq+MyFgYjDlimmltIQZWvqT3pJ5OZVmNat2/45lNA7DYkPEuGCASmjQ29NCauHMW
4vYKZn4NQbEdui6biPG68GxKQkDw3CiYm9b8iBATi40jVloq+dAo76WmeRSpbsGq
wnyPR9jcuIy80PKM5q0vgj+aSc8RZB0yjOK1GSYQSgZ3HFhkZd1jREj9QPqdfOSi
o0370IOLFNQ+7RvdEFchs/QFHakEQcv1w350koHwfkhoioh183A1NCrnUCFwgIuk
A/tc/8EWIDoEagYdMaWgo8RGbsunkHMbjKU6mM3mJDLuvJELDSYZhrQ4qdtoq8g1
eAY2k9wJkmPXETwfvxs7M9DjvtVcu80Q0cPcBkiMQ6uG35mGlLRONq4XlkY06+N2
CxIoljNb1JUhF/2jM49Mn/tnUR+ntfxnjMidmDeXxc7Oh1iUYqGstCoqSjmnFLXb
HiyxFDm3gaoIYtN9ftYhFD99yHbHKHErfM6wfKiXEoq5FlkS5T8ssUomZnxQ7aJ/
e7lEHrwnVYu+WcQHVToAACiyASEgODkpPpndV0fc8eHhBjh4QcT9YBp0qAM84ZOY
mYibB9ItzHi19oGJGv5LqQ4fobn0EbCL+wWwX3drElY35XUVVGrTdGUUiVGV6Qsg
zlwCmAzPteiHmi7b/dnT
=Gg5o
-----END PGP SIGNATURE-----

--Rzq/nSLlHy1djmXS--

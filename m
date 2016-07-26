From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 6/6] libfdt: Add overlay application function
Date: Tue, 26 Jul 2016 10:18:59 +1000
Message-ID: <20160726001859.GF17429@voom.fritz.box>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
 <20160720142044.27527-7-maxime.ripard@free-electrons.com>
 <20160724142908.GF24621@voom.fritz.box>
 <20160725182041.GN7419@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160725182041.GN7419@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 08:20:41PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> On Mon, Jul 25, 2016 at 12:29:08AM +1000, David Gibson wrote:
> > > +static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_=
off,
> > > +				 int property)
> > > +{
> > > +	const char *value;
> > > +	const char *label;
> > > +	int len;
> > > +
> > > +	value =3D fdt_getprop_by_offset(fdto, property,
> > > +				      &label, &len);
> > > +	if (!value) {
> > > +		if (len =3D=3D -FDT_ERR_NOTFOUND)
> > > +			return -FDT_ERR_INTERNAL;
> > > +
> > > +		return len;
> > > +	}
> > > +
> > > +	do {
> > > +		const char *prop_string =3D value;
> > > +		const char *path, *name;
> > > +		uint32_t prop_len =3D strnlen(value, len);
> >=20
> > prop_len is a bad name, since it could well be less than the length of
> > the whole property.
> >=20
> > > +		uint32_t path_len, name_len;
> > > +		char *sep, *endptr;
> > > +		int index;
> > > +		int ret;
> > > +
> > > +		path =3D prop_string;
> > > +		sep =3D memchr(prop_string, ':', prop_len);
> > > +		if (!sep || (*sep !=3D ':'))
> > > +			return -FDT_ERR_BADSTRUCTURE;
> >=20
> > As mentioned on some of the other patches in the series, I think we
> > want a new error code for bad fixup / overlay information.
> >=20
> > > +
> > > +		path_len =3D sep - path;
> > > +		if (path_len =3D=3D prop_len)
> > > +			return -FDT_ERR_BADSTRUCTURE;
> >=20
> > I'm pretty sure this is impossible if sep !=3D NULL.
> >=20
> > > +		name =3D sep + 1;
> >=20
> > But I think the case you actually need to test for is path_len =3D=3D
> > (prop_len - 1), that will occur when : is the last character.
> >=20
> > > +		sep =3D memchr(name, ':', prop_len);
> > > +		if (!sep || *sep !=3D ':')
> > > +			return -FDT_ERR_BADSTRUCTURE;
> >=20
> > This still isn't quite safe.  If the property has no \0, and : is the
> > last character in it, you'll access beyond the end of the property
> > here.  It's probably easier if you just fail early if there is no \0 -
> > that's probably easier if you use memchr(\0) instead of strnlen().
> >=20
> > > +
> > > +		name_len =3D sep - name;
> > > +		if ((path_len + 1 + name_len) =3D=3D prop_len)
> > > +			return -FDT_ERR_BADSTRUCTURE;
> >=20
> > Again, off-by-one in this test, I think.  Since there are so many
> > tricky edge cases here, it might be worth making testcases for them.
>=20
> What do you want here? That we move the parsing code out of that loop,
> make it public and put the prototype in libfdt_internal, or that we
> craft some DT that would outline all the possible issues with that
> function, and just test the return code of fdt_overlay_apply?

I was thinking crafted DTs.  But I've realized that doing usefully is
pretty tricky, since overruns probably won't cause an immediate
problem most of the time.  I guess they'd trip errors under valgrind
at least (as long you make sure there's at least one byte's alignment
gap until the next tag).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlqxzAAoJEGw4ysog2bOStOcQALPbmyc3NbP8FzmNYEEgbZsR
VrLocD1idNiUV/0ynzXy9VOBjT60E0F4WOijqAOrjd0a6WUhYuqQWXibD8Xph+7/
VBJxM6FmrnLS2JTI82w+OHvWJguOGvoeucrheM+z5sxD+E3ZzylgANRRWGokdhUp
tYIDdy1UOBqOdiiN8Axmh8x7PiiwhFZkolphBCHEsvIYTUo01wEkkL3R5bPeuZOh
7uK78ljE2X0+9Mm4hdE4Vsglz786frL97q90VGssPfXlhfGqd7h/nHxQWdC801DL
2mlNhAAsGcSIOpDZ4ZPcqi7ualYn5ypEm1JgvIuPoCBQDqTxasZPg/DH7VwnJInY
doZcDTmGpZJkLXvQd0K0Yu7WWRTmGK0mr0Wu4kziwQd6orKbdhonTSg1+ir5vOG4
xmK4G/cxZniKIJqZk2fnMEAS/pxnNON3+j1tIxyPr/+jnhs/cRLmaGsr7Nr0SCfk
TnvZDnV0o3Ge2bvgQW1AAYU6a9AjrhAFXNi6XvkR7cp0nBUCZwK0Kil8eh2gy/c5
amRvJiye2ymtzqsamriEBjL96H+PyUIj9iNZd99+6ImAml9fW4nDf6C0Kd30AvnO
5fpvJ4hAe1IROMqX8pArgbjntq5mQvH1YFTdx2Hjw29VUwmX+D/Vpjob1xyEnFXR
MKDzIfGDMTTd8TolFjzv
=H0mV
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--

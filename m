From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] libfdt: Add a subnodes iterator macro
Date: Tue, 31 May 2016 10:54:33 +1000
Message-ID: <20160531005433.GH17226@voom.fritz.box>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464337729-7821-3-git-send-email-maxime.ripard@free-electrons.com>
 <20160531004719.GF17226@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h7PDjUG0eb3vQUSn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160531004719.GF17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--h7PDjUG0eb3vQUSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 10:47:19AM +1000, David Gibson wrote:
> On Fri, May 27, 2016 at 10:28:46AM +0200, Maxime Ripard wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The fdt_for_each_subnode() iterator macro provided by this patch can be
> > used to iterate over a device tree node's subnodes. At each iteration a
> > loop variable will be set to the next subnode.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Looks good, but needs a testcase.  Extending subnode_iterate would
> probably make sense.

Sorry, one other thing, as I noted on 2/4, I prefer the convention
where the loop counter (so the subnode offset in this case) is the
first argument to foreach style macros.

>=20
> > ---
> >  libfdt/libfdt.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >=20
> > diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> > index 36222fd4a6f4..331f32dd04b5 100644
> > --- a/libfdt/libfdt.h
> > +++ b/libfdt/libfdt.h
> > @@ -168,6 +168,31 @@ int fdt_first_subnode(const void *fdt, int offset);
> >   */
> >  int fdt_next_subnode(const void *fdt, int offset);
> > =20
> > +/**
> > + * fdt_for_each_subnode - iterate over all subnodes of a parent
> > + *
> > + * This is actually a wrapper around a for loop and would be used like=
 so:
> > + *
> > + *	fdt_for_each_subnode(fdt, node, parent) {
> > + *		...
> > + *		use node
> > + *		...
> > + *	}
> > + *
> > + * Note that this is implemented as a macro and node is used as iterat=
or in
> > + * the loop. It should therefore be a locally allocated variable. The =
parent
> > + * variable on the other hand is never modified, so it can be constant=
 or
> > + * even a literal.
> > + *
> > + * @fdt:	FDT blob (const void *)
> > + * @node:	child node (int)
> > + * @parent:	parent node (int)
> > + */
> > +#define fdt_for_each_subnode(fdt, node, parent)		\
> > +	for (node =3D fdt_first_subnode(fdt, parent);	\
> > +	     node >=3D 0;					\
> > +	     node =3D fdt_next_subnode(fdt, node))
> > +
> >  /*********************************************************************=
*/
> >  /* General functions                                                  =
*/
> >  /*********************************************************************=
*/
>=20



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--h7PDjUG0eb3vQUSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTODIAAoJEGw4ysog2bOSiWoQAK2BeH+t+jU6gQrGakCCqYqx
SbXWB68s0D8VdLvUIDsEoCdch3RpX9fry1xMXR6uvI39xP0IQTj0msYj8TRap866
WdSY0CaH9zLCbo+j4txjvX7fJpHEI+2627ZQchHGfou5/PL0JKFoPlAZuMdvUVCT
iO+koXRugnsXAXlesSTk5biZPHHLgDiBpgNUHdETAp+qBZAaiFOhV7+MUX5MGE8+
O481WnJnH/LGCzqN9T6vMtdxMM01jhp2rwr/PIisHgkNDB7Q6VLslmwT8XmvApVl
6lsHY30LD/mKrjhit/W0/U8rMqjxI98WbZnWLHkWcyH3ZjDKN5LVOT2iRXb8DUDZ
S3ThcCQUPUN/n+oYNMQF9nm2ywwqWYSsaQd0fXHPmBjEy3S7JZZqpm/E4pLX7Bi5
f47TKnScAiIn9EJ915IS4K4uoJ4fvo1L5ccne2lxOX0CKSLjxoaskr7lQRiN+zzT
d0Lq1/0mhEAWWr6aus9USBOeyCmDV5FWfmrAOHmDEeWZKke6deTZU/1ZSe4GdJTr
3hlNVHTrGE9YQTTwvn5rVrfXTQQfJKqDr6w1JlIjZW/ul6DMZj5ZALI2TpXgdOvS
o7km0pHJeMV1Nyn2Dra2qvtWEapGIBYy167TFMVUqLZMi8x+cYSu78UGmnwRkJlP
DZ7iYB5Mnd2KE7miHj/0
=608C
-----END PGP SIGNATURE-----

--h7PDjUG0eb3vQUSn--

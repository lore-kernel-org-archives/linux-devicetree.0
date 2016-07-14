From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Thu, 14 Jul 2016 19:02:19 +1000
Message-ID: <20160714090219.GO14615@voom.fritz.box>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <20160712143120.GC16355@voom.fritz.box>
 <20160713201216.GM4761@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160713201216.GM4761@lukather>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 10:12:16PM +0200, Maxime Ripard wrote:
> Hi David,
>=20
> I'll fix your comments, but I have a bunch of questions, see below.
>=20
> On Wed, Jul 13, 2016 at 12:31:20AM +1000, David Gibson wrote:
> > > +/**
> > > + * overlay_adjust_node_phandles - Offsets the phandles of a node
> > > + * @fdto: Device tree overlay blob
> > > + * @node: Offset of the node we want to adjust
> > > + * @delta: Offset to shift the phandles of
> > > + *
> > > + * overlay_adjust_node_phandles() adds a constant to all the phandles
> > > + * of a given node. This is mainly use as part of the overlay
> > > + * application process, when we want to update all the overlay
> > > + * phandles to not conflict with the overlays of the base device tre=
e.
> > > + *
> > > + * returns:
> > > + *      0 on success
> > > + *      Negative error code on failure
> > > + */
> > > +static int overlay_adjust_node_phandles(void *fdto, int node,
> > > +					uint32_t delta)
> > > +{
> > > +	unsigned char found =3D 0;
> >=20
> > Just use an int.  I should probably think about introducing bool to lib=
fdt.
> >=20
> > > +	int child;
> > > +	int ret;
> > > +
> > > +	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> > > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > > +		return ret;
> > > +
> > > +	if (!ret)
> > > +		found =3D 1;
> > > +
> > > +	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", del=
ta);
> > > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * If neither phandle nor linux,phandle have been found return
> > > +	 * an error.
> > > +	 */
> > > +	if (!found && !ret)
> > > +		return ret;
> >=20
> > Clearer to return 0 here, since ret must equal 0.
> >=20
> > Except.. it's not mandatory for a node to have a phandle, so this just
> > looks wrong, anyway.
>=20
> Hmmm, that's true. I have no idea how that can possibly work
> though. It should break at the very first node, since the root node
> will not have one...
>=20
> I'll look into this.

Ok.

> > > +
> > > +	fdt_for_each_subnode(child, fdto, node)
> > > +		overlay_adjust_node_phandles(fdto, child, delta);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * overlay_adjust_local_phandles - Adjust the phandles of a whole ov=
erlay
> > > + * @fdto: Device tree overlay blob
> > > + * @delta: Offset to shift the phandles of
> > > + *
> > > + * overlay_adjust_local_phandles() adds a constant to all the
> > > + * phandles of an overlay. This is mainly use as part of the overlay
> > > + * application process, when we want to update all the overlay
> > > + * phandles to not conflict with the overlays of the base device tre=
e.
> > > + *
> > > + * returns:
> > > + *      0 on success
> > > + *      Negative error code on failure
> > > + */
> > > +static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> > > +{
> > > +	/*
> > > +	 * Start adjusting the phandles from the overlay root
> > > +	 */
> > > +	return overlay_adjust_node_phandles(fdto, 0, delta);
> > > +}
> > > +
> > > +/**
> > > + * overlay_update_local_node_references - Adjust the overlay referen=
ces
> > > + * @fdto: Device tree overlay blob
> > > + * @tree_node: Node offset of the node to operate on
> > > + * @fixup_node: Node offset of the matching local fixups node
> > > + * @delta: Offset to shift the phandles of
> > > + *
> > > + * overlay_update_local_nodes_references() update the phandles
> > > + * pointing to a node within the device tree overlay by adding a
> > > + * constant delta.
> > > + *
> > > + * This is mainly used as part of a device tree application process,
> > > + * where you want the device tree overlays phandles to not conflict
> > > + * with the ones from the base device tree before merging them.
> > > + *
> > > + * returns:
> > > + *      0 on success
> > > + *      Negative error code on failure
> > > + */
> > > +static int overlay_update_local_node_references(void *fdto,
> > > +						int tree_node,
> > > +						int fixup_node,
> > > +						uint32_t delta)
> > > +{
> > > +	int fixup_prop;
> > > +	int fixup_child;
> > > +	int ret;
> > > +
> > > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > > +		const unsigned char *fixup_val, *tree_val;
> >=20
> > You might as well make fixup_val a u32 *, it should remove some casts
> > below.
>=20
> Yes, but then, if it's poorly formatted, we might get unaligned
> accesses too..

No.  The flattening format guarantees that property values are 32-bit
aligned, so since the property consists of nothing but u32s they'll
all remain aligned.

The difference with applying the fixups is that the properties could
have formats that are a mixture of u32s and strings or other unaligned
data, so the locations to be fixed may not be aligned.

> And we can't really use memcpy here, since we don't
> know the size of the property at compile time.

Um.. what?

>=20
> > > +		const char *name;
> > > +		int fixup_len;
> > > +		int tree_len;
> > > +		int i;
> > > +
> > > +		fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > > +						  &name, &fixup_len);
> > > +		if (!fixup_val)
> > > +			return fixup_len;
> > > +
> > > +		tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
> > > +		if (!tree_val)
> > > +			return tree_len;
> > > +		for (i =3D 0; i < fixup_len; i +=3D sizeof(uint32_t)) {
> >=20
> > This could lead to an unsafe dereference if fixup_len is not a
> > multiple of 4 (i.e. badly formatted fixup properyt).  Another reason
> > to use a u32 *.
>=20
> Then maybe the safest would be to simply check that the length is a
> multiple of 4, and return an error if it's not?

Yes, I think so.

> > > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > > index 6a2662b2abaf..054758298de9 100755
> > > --- a/tests/run_tests.sh
> > > +++ b/tests/run_tests.sh
> > > @@ -280,6 +280,14 @@ libfdt_tests () {
> > >      run_test get_alias aliases.dtb
> > >      run_test path_offset_aliases aliases.dtb
> > > =20
> > > +    # Overlay tests
> > > +    echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
> >=20
> >        ^^^^^
> >=20
> > What's this about?
>=20
> In current master tree, calling dtc with -@ will fail, since the
> support to compile the overlays is not upstream yet (afaik).
>=20
> This is just to make sur that the dtc binary is actually able to
> compile something we can run our test on. Otherwise we would have
> failed tests, while the code might or might not work, which seems bad.

Ah, yes.  I was mixing up the dtc patches with the libfdt patches.

Hrm.. it would be nice if the libfdt testcases, or at least some of
the, didn't require the patched dtc.  It might be worth making
examples with manually constructed __symbols__ and __fixups__ for this
purpose.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXh1UbAAoJEGw4ysog2bOSv8sP/0U5FEljF/167x9o8PclPsCn
wKxTYIdwkVgevM90Kxej7Jah7E0aME+zrXs8JFjrzOYk29LDUkK/bfZ1br6nXcAm
bulYT9+OjWg8clUSofGgIJnw/krvT6dVUf207aoRKGiu3n21xjZHgMVlunuW82Xl
n7w6SEuFY1PMiW0qX7EZtdg6nl+rakrpxR1kkg7vFWY3GYvv9V/6K8cBV7zj+f9p
s4LqZxlzyWZyURIx3SQswQLr529z7w4k2dkOMGvLuNMNgIvVhNXCX+Mrzv5wsMl2
gLUtXcfvexiAmjCTr8kzyg+rPvXqEDQgJOBI3LRIZ4avpIjgDsuchA9m+HHbLVHp
lTluWQkFctE3eRkZhJCJzXQ7u5ZuXlrG4O7ef2uZwaDCyeO1RNIcWhlCLtktg09M
yfWCVwRegowx9U3YsA2T2+Rp0F5BZQLOcWre8jyrj3a/fis8/x9EW6wOL8EJfHS4
wq+dSWyRkUntc3JRsFgzvXvTYTMCtWeRPqrLNYX7xPotdvuMrSbKxJwyzGqWXPGL
b07OZKgkERz1QHZpj0hOz6cPl5mqauVSL3VCpeAzC0G/22ihzrfX+Ls9bp40mEDp
MpIS3/CaEJRQGaC0xG048OAML727mUkouxCnvApsvaLNpAoYw2kWIK1sj+qq0OYH
+vx3DdFXRK56vNVnOTMo
=QGm6
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--

From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] libfdt: Add overlay application function
Date: Wed, 13 Jul 2016 22:12:16 +0200
Message-ID: <20160713201216.GM4761@lukather>
References: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
 <20160711195623.12840-7-maxime.ripard@free-electrons.com>
 <20160712143120.GC16355@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kunpHVz1op/+13PW"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160712143120.GC16355-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kunpHVz1op/+13PW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

I'll fix your comments, but I have a bunch of questions, see below.

On Wed, Jul 13, 2016 at 12:31:20AM +1000, David Gibson wrote:
> > +/**
> > + * overlay_adjust_node_phandles - Offsets the phandles of a node
> > + * @fdto: Device tree overlay blob
> > + * @node: Offset of the node we want to adjust
> > + * @delta: Offset to shift the phandles of
> > + *
> > + * overlay_adjust_node_phandles() adds a constant to all the phandles
> > + * of a given node. This is mainly use as part of the overlay
> > + * application process, when we want to update all the overlay
> > + * phandles to not conflict with the overlays of the base device tree.
> > + *
> > + * returns:
> > + *      0 on success
> > + *      Negative error code on failure
> > + */
> > +static int overlay_adjust_node_phandles(void *fdto, int node,
> > +					uint32_t delta)
> > +{
> > +	unsigned char found =3D 0;
>=20
> Just use an int.  I should probably think about introducing bool to libfd=
t.
>=20
> > +	int child;
> > +	int ret;
> > +
> > +	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
> > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > +		return ret;
> > +
> > +	if (!ret)
> > +		found =3D 1;
> > +
> > +	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta=
);
> > +	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
> > +		return ret;
> > +
> > +	/*
> > +	 * If neither phandle nor linux,phandle have been found return
> > +	 * an error.
> > +	 */
> > +	if (!found && !ret)
> > +		return ret;
>=20
> Clearer to return 0 here, since ret must equal 0.
>=20
> Except.. it's not mandatory for a node to have a phandle, so this just
> looks wrong, anyway.

Hmmm, that's true. I have no idea how that can possibly work
though. It should break at the very first node, since the root node
will not have one...

I'll look into this.

>=20
> > +
> > +	fdt_for_each_subnode(child, fdto, node)
> > +		overlay_adjust_node_phandles(fdto, child, delta);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * overlay_adjust_local_phandles - Adjust the phandles of a whole over=
lay
> > + * @fdto: Device tree overlay blob
> > + * @delta: Offset to shift the phandles of
> > + *
> > + * overlay_adjust_local_phandles() adds a constant to all the
> > + * phandles of an overlay. This is mainly use as part of the overlay
> > + * application process, when we want to update all the overlay
> > + * phandles to not conflict with the overlays of the base device tree.
> > + *
> > + * returns:
> > + *      0 on success
> > + *      Negative error code on failure
> > + */
> > +static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> > +{
> > +	/*
> > +	 * Start adjusting the phandles from the overlay root
> > +	 */
> > +	return overlay_adjust_node_phandles(fdto, 0, delta);
> > +}
> > +
> > +/**
> > + * overlay_update_local_node_references - Adjust the overlay references
> > + * @fdto: Device tree overlay blob
> > + * @tree_node: Node offset of the node to operate on
> > + * @fixup_node: Node offset of the matching local fixups node
> > + * @delta: Offset to shift the phandles of
> > + *
> > + * overlay_update_local_nodes_references() update the phandles
> > + * pointing to a node within the device tree overlay by adding a
> > + * constant delta.
> > + *
> > + * This is mainly used as part of a device tree application process,
> > + * where you want the device tree overlays phandles to not conflict
> > + * with the ones from the base device tree before merging them.
> > + *
> > + * returns:
> > + *      0 on success
> > + *      Negative error code on failure
> > + */
> > +static int overlay_update_local_node_references(void *fdto,
> > +						int tree_node,
> > +						int fixup_node,
> > +						uint32_t delta)
> > +{
> > +	int fixup_prop;
> > +	int fixup_child;
> > +	int ret;
> > +
> > +	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
> > +		const unsigned char *fixup_val, *tree_val;
>=20
> You might as well make fixup_val a u32 *, it should remove some casts
> below.

Yes, but then, if it's poorly formatted, we might get unaligned
accesses too.. And we can't really use memcpy here, since we don't
know the size of the property at compile time.

> > +		const char *name;
> > +		int fixup_len;
> > +		int tree_len;
> > +		int i;
> > +
> > +		fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
> > +						  &name, &fixup_len);
> > +		if (!fixup_val)
> > +			return fixup_len;
> > +
> > +		tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
> > +		if (!tree_val)
> > +			return tree_len;
> > +		for (i =3D 0; i < fixup_len; i +=3D sizeof(uint32_t)) {
>=20
> This could lead to an unsafe dereference if fixup_len is not a
> multiple of 4 (i.e. badly formatted fixup properyt).  Another reason
> to use a u32 *.

Then maybe the safest would be to simply check that the length is a
multiple of 4, and return an error if it's not?

> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > index 6a2662b2abaf..054758298de9 100755
> > --- a/tests/run_tests.sh
> > +++ b/tests/run_tests.sh
> > @@ -280,6 +280,14 @@ libfdt_tests () {
> >      run_test get_alias aliases.dtb
> >      run_test path_offset_aliases aliases.dtb
> > =20
> > +    # Overlay tests
> > +    echo "/dts-v1/; / {};" | $DTC -@ > /dev/null 2>&1
>=20
>        ^^^^^
>=20
> What's this about?

In current master tree, calling dtc with -@ will fail, since the
support to compile the overlays is not upstream yet (afaik).

This is just to make sur that the dtc binary is actually able to
compile something we can run our test on. Otherwise we would have
failed tests, while the code might or might not work, which seems bad.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kunpHVz1op/+13PW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhqCgAAoJEBx+YmzsjxAgNYkP/idSDSgU9Rmv/EL9Gx0xjwlw
YRU1203AzYQyB88pnVkppLc8e9/nEG+luMajGf8ZEHTVjasGzv8FcZDXjWGthJA7
QXyYqGbnDgR1ZKQZSJZTBy9dFPbam0lv/PBYFFhRIVewUWqOt8rA8BytleTtKSvw
ppB5MGv+BkQDz2ibjEs2mZxEv2EAI8laEgM4ys4xqz847kdWdiiVzqgLfI+qDkLc
NURRTAMXu4fz5eCy6lk3p3u9rJTCIyRoDOtHr3kKLn6K/d3WefTwxAmyiq/OyWgs
VYIxxMHEc+kX3ktOWG+5VPjEO7iFuJfsbHIsYbMEy4d9hEplBJqFUKQmbRghV+al
YsovZWrxTqREdtB7QL7Z/GoZB1+/1RwALgCntW0sxjQVRTnGuJNdoDo+cZzvBXKd
NP5TeyLo5jCZJ0f4ch3XMgausSVPnPzQfU98jaSZ3xKw04T/zI0B+0iD5YASqzG6
NnKfUUsbtOXoK0MIKiRiQnhSTsuJZhqItOSyeeE7WQ1A1Ui2t7Nll+LWB3EgaIKz
7V27oAaZrTvPHTPm84nGW3x2SjYd5j7xeMLNxzY7XHh+xtX/hUJ38YB7OdPkcsI0
pRPWNgQVi/YdG6hCWLDyKBc/VLx+h79oXX35vNo/N6T2TWeqZ5o3lamGD3oHWsSS
1WikT/WwtSkzQkqXtkLq
=0+6O
-----END PGP SIGNATURE-----

--kunpHVz1op/+13PW--

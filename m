From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/4] libfdt: Add overlay application function
Date: Thu, 2 Jun 2016 15:23:32 +1000
Message-ID: <20160602052332.GD22347@voom.fritz.box>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
 <1464337729-7821-6-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464337729-7821-6-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 10:28:49AM +0200, Maxime Ripard wrote:
> The device tree overlays are a good way to deal with user-modifyable
> boards or boards with some kind of an expansion mechanism where we can
> easily plug new board in (like the BBB, the Raspberry Pi or the CHIP).
>=20
> Add a new function to merge overlays with a base device tree.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  libfdt/Makefile.libfdt |   2 +-
>  libfdt/fdt_overlay.c   | 414 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  libfdt/libfdt.h        |  30 ++++
>  libfdt/libfdt_env.h    |   1 +
>  4 files changed, 446 insertions(+), 1 deletion(-)
>  create mode 100644 libfdt/fdt_overlay.c
>=20
> diff --git a/libfdt/Makefile.libfdt b/libfdt/Makefile.libfdt
> index 09c322ed82ba..098b3f36e668 100644
> --- a/libfdt/Makefile.libfdt
> +++ b/libfdt/Makefile.libfdt
> @@ -7,5 +7,5 @@ LIBFDT_soname =3D libfdt.$(SHAREDLIB_EXT).1
>  LIBFDT_INCLUDES =3D fdt.h libfdt.h libfdt_env.h
>  LIBFDT_VERSION =3D version.lds
>  LIBFDT_SRCS =3D fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.=
c fdt_empty_tree.c \
> -	fdt_addresses.c
> +	fdt_addresses.c fdt_overlay.c
>  LIBFDT_OBJS =3D $(LIBFDT_SRCS:%.c=3D%.o)
> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> new file mode 100644
> index 000000000000..1e68e903c734
> --- /dev/null
> +++ b/libfdt/fdt_overlay.c
> @@ -0,0 +1,414 @@
> +#include "libfdt_env.h"
> +
> +#include <fdt.h>
> +#include <libfdt.h>
> +
> +#include "libfdt_internal.h"
> +
> +static uint32_t fdt_overlay_get_target_phandle(const void *fdto, int nod=
e)

I'd prefer to see 'node' renamed to indicate what node is needed
here.  Maybe 'fragment' as below.

Btw, static functions don't need the fdt_ prefix, and are probably
better off without it, since it provides an additional visual hint
that a function is not exported.

> +{
> +	const uint32_t *val;
> +	int len;
> +
> +	val =3D fdt_getprop(fdto, node, "target", &len);
> +	if (!val || (len !=3D sizeof(*val)))
> +		return 0;

For consistency, it's probably worth returning 0 in all failure cases,
including (val =3D=3D 0xffffffff).

> +	return fdt32_to_cpu(*val);
> +}
> +
> +static int fdt_overlay_get_target(const void *fdt, const void *fdto,
> +				  int fragment)
> +{
> +	uint32_t phandle;
> +	const char *path;
> +
> +	/* Try first to do a phandle based lookup */
> +	phandle =3D fdt_overlay_get_target_phandle(fdto, fragment);
> +	if (phandle)
> +		return fdt_node_offset_by_phandle(fdt, phandle);
> +
> +	/* And then a path based lookup */
> +	path =3D fdt_getprop(fdto, fragment, "target-path", NULL);
> +	if (!path)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	return fdt_path_offset(fdt, path);
> +}
> +
> +static int fdt_overlay_adjust_node_phandles(void *fdto, int node,
> +					    uint32_t delta)
> +{
> +	int property;
> +	int child;
> +
> +	fdt_for_each_property(fdto, node, property) {

There's no need for this loop - you can just use two
fdt_setprop_inplace() calls, ignoring FDT_ERR_NOTFOUND (as long as
only one of them returns that).

> +		const uint32_t *val;
> +		const char *name;
> +		uint32_t adj_val;
> +		int len;
> +		int ret;
> +
> +		val =3D fdt_getprop_by_offset(fdto, property,
> +					    &name, &len);
> +		if (!val || (len !=3D sizeof(*val)))
> +			continue;
> +
> +		if (strcmp(name, "phandle") && strcmp(name, "linux,phandle"))
> +			continue;
> +
> +		adj_val =3D fdt32_to_cpu(*val);
> +		adj_val +=3D delta;
> +		ret =3D fdt_setprop_inplace_u32(fdto, node, name, adj_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdto, child, node)
> +		fdt_overlay_adjust_node_phandles(fdto, child, delta);
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_adjust_local_phandles(void *fdto, uint32_t delta)
> +{
> +	int root;
> +
> +	root =3D fdt_path_offset(fdto, "/");
> +	if (root < 0)
> +		return root;

fdt_path_offset(xx, "/") is *never* necessary.  The offset of the root
node is always 0 by definition.

> +
> +	return fdt_overlay_adjust_node_phandles(fdto, root, delta);
> +}
> +
> +static int _fdt_overlay_update_local_references(void *fdto,

Don't use _ prefixes on function names - they're reserved in C (the
kernel gets away with it because it controls the whole environment).

> +						int tree_node,
> +						int fixup_node,
> +						uint32_t delta)
> +{
> +	int fixup_prop;
> +	int fixup_child;

This is pretty complicated, but that's mostly due to the overly
complicated encoding of local fixups in the overlay format.  I've been
discussing that elsewhere.

> +	fdt_for_each_property(fdto, fixup_node, fixup_prop) {
> +		const char *fixup_name, *tree_name;
> +		const uint32_t *val =3D NULL;
> +		uint32_t adj_val;
> +		int fixup_len;
> +		int tree_prop;
> +		int tree_len;
> +		int ret;
> +
> +		fdt_getprop_by_offset(fdto, fixup_prop,
> +				      &fixup_name, &fixup_len);
> +
> +		if (!strcmp(fixup_name, "phandle") ||
> +		    !strcmp(fixup_name, "linux,phandle"))
> +			continue;

Hrm.. phandle properties in the fixups node would suggest a broken
overlay, but this is probably safest.

> +		fdt_for_each_property(fdto, tree_node, tree_prop) {
> +			val =3D fdt_getprop_by_offset(fdto, tree_prop,
> +						    &tree_name, &tree_len);
> +
> +			if (!strcmp(tree_name, fixup_name))
> +				break;
> +		}

You already have the name so you can just use getprop() (or
get_property()) rather than explicitly iterating through the
properties.

> +
> +		if (!val || !tree_len)
> +			return -FDT_ERR_NOTFOUND;
> +
> +		if (!tree_name)
> +			return -FDT_ERR_NOTFOUND;

You don't seem to test for the case that the loop across properties
never hit a match - this doesn't catch it, since tree_name could still
have a value from the last iteration.  I don't really see what the
point of checking tree_name here is at all.

> +		if (tree_len !=3D 4)
> +			return -FDT_ERR_NOTFOUND;

This is bogus.  Any property can include a reference to a phandle, not
just a 4-byte property which has *only* a reference to a phandle.  To
correctly apply the fixup you need to parse the contents of the
property in the __local__fixups__ subtree to determine the offset
within the property that needs adjustment.

> +		adj_val =3D fdt32_to_cpu(*val);
> +		adj_val +=3D delta;
> +		ret =3D fdt_setprop_inplace_u32(fdto, tree_node, fixup_name,
> +					      adj_val);

Likewise this needs adjustment to handle non-cell properties.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(fdto, fixup_child, fixup_node) {
> +		const char *fixup_child_name =3D fdt_get_name(fdto,
> +							    fixup_child, NULL);
> +		int tree_child;
> +
> +		fdt_for_each_subnode(fdto, tree_child, tree_node) {
> +			const char *tree_child_name =3D fdt_get_name(fdto,
> +								   tree_child,
> +								   NULL);
> +
> +			if (!strcmp(fixup_child_name, tree_child_name))
> +				break;
> +		}

Again, you can just use fdt_get_subnode() to find the matching node of
the main tree rather than manually iterating.

> +
> +		_fdt_overlay_update_local_references(fdto,
> +						     tree_child,
> +						     fixup_child,
> +						     delta);
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_update_local_references(void *dto, uint32_t delta)
> +{
> +	int root, fixups;
> +
> +	root =3D fdt_path_offset(dto, "/");
> +	if (root < 0)
> +		return root;

As above, no need for path_offset /.

> +	fixups =3D fdt_path_offset(dto, "/__local_fixups__");
> +	if (root < 0)
> +		return root;
> +
> +	return _fdt_overlay_update_local_references(dto, root, fixups,
> +						    delta);
> +}
> +
> +static int _fdt_overlay_fixup_phandle(void *fdt, void *fdto,
> +				      int symbols_off,
> +				      const char *path, const char *name,
> +				      int index, const char *label)
> +{
> +	const uint32_t *prop_val;
> +	const char *symbol_path;
> +	uint32_t *fixup_val;
> +	uint32_t phandle;
> +	int symbol_off, fixup_off;
> +	int prop_len;
> +	int ret;
> +
> +	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
> +				  &prop_len);
> +	if (!symbol_path)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	symbol_off =3D fdt_path_offset(fdt, symbol_path);
> +	if (symbol_off < 0)
> +		return symbol_off;
> +
> +	phandle =3D fdt_get_phandle(fdt, symbol_off);
> +	if (!phandle)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	fixup_off =3D fdt_path_offset(fdto, path);
> +	if (fixup_off < 0)
> +		return fixup_off;
> +
> +	prop_val =3D fdt_getprop(fdto, fixup_off, name,
> +			       &prop_len);
> +	if (!prop_val)
> +		return -FDT_ERR_NOTFOUND;
> +
> +	fixup_val =3D malloc(prop_len);

libfdt isn't supposed to use malloc(), since it's designed to work in
restricted environments like tiny bootloaders which may not have an
allocator.



> +	if (!fixup_val)
> +		return -FDT_ERR_INTERNAL;
> +	memcpy(fixup_val, prop_val, prop_len);
> +
> +	if (fdt32_to_cpu(fixup_val[index]) !=3D 0xdeadbeef) {
> +		ret =3D -FDT_ERR_BADPHANDLE;
> +		goto out;
> +	}

This needs fixing - newer things should use -1 instead of 0xdeadbeef
as the placeholder value (since 0xdeadbeef is a valid phandle)

> +
> +	fixup_val[index] =3D cpu_to_fdt32(phandle);
> +	ret =3D fdt_setprop_inplace(fdto, fixup_off,
> +				  name, fixup_val,
> +				  prop_len);

Looks like we want a setprop_inplace_partial() or something to avoid
the need to malloc() a whole extra copy of the property just to alter
4 bytes.

> +
> +out:
> +	free(fixup_val);
> +	return ret;
> +};
> +
> +static int fdt_overlay_fixup_phandle(void *fdt, void *fdto, int symbols_=
off,
> +				     int property)
> +{
> +	const char *value, *tmp_value;
> +	const char *label;
> +	int tmp_len, len, next;
> +	int table =3D 0;
> +	int i;
> +
> +	value =3D fdt_getprop_by_offset(fdto, property,
> +				      &label, &len);
> +	tmp_value =3D value;
> +	tmp_len =3D len;
> +
> +	do {
> +		next =3D strlen(tmp_value) + 1;
> +		tmp_len -=3D next;
> +		tmp_value +=3D next;
> +		table++;
> +	} while (tmp_len > 0);

Hm, I think you should be able to roll the two loops into one.

> +
> +	for (i =3D 0; i < table; i++) {
> +		const char *prop_string =3D value;
> +		const char *path, *name;
> +		char *prop_cpy, *prop_tmp;
> +		int index, stlen;
> +		char *sep;
> +
> +		stlen =3D strlen(prop_string);
> +		prop_cpy =3D malloc(stlen + 1);

Again, no malloc().

> +		if (!prop_cpy)
> +			return -FDT_ERR_INTERNAL;
> +
> +		strncpy(prop_cpy, prop_string, stlen);
> +		prop_cpy[stlen] =3D '\0';



> +		for (prop_tmp =3D prop_cpy; (sep =3D strchr(prop_tmp, ':'));
> +		     prop_tmp +=3D ((sep - prop_tmp) + 1))
> +			*sep =3D '\0';
> +
> +		prop_tmp =3D prop_cpy;
> +		path =3D prop_tmp;
> +		prop_tmp +=3D strlen(prop_tmp) + 1;
> +
> +		name =3D prop_tmp;
> +		prop_tmp +=3D strlen(prop_tmp) + 1;

the *_namelen() functions are designed specifically to avoid this
fiddly dicking around with making copies of strings and inserting
extra \0 characters.  Using those should let you avoid the malloc()
and copies.

Looks like a path_offset_namelen() might need to be added.

> +
> +		index =3D strtol(prop_tmp, NULL, 10);
> +		prop_tmp +=3D strlen(prop_tmp) + 1;

strtol() is a new dependency for libfdt.  That's ok, but it should be
noted in libfdt_env.h.

Also it should probably be strtoul() since offsets are necessarily
non-negative.

=2E.and you should pass an endptr value so you can check for errors.

> +
> +		value +=3D stlen + 1;
> +		len -=3D stlen + 1;


> +
> +		_fdt_overlay_fixup_phandle(fdt, fdto, symbols_off,
> +					   path, name, index, label);
> +
> +		free(prop_cpy);
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_fixup_phandles(void *dt, void *dto)
> +{
> +	int fixups_off, symbols_off;
> +	int property;
> +
> +	symbols_off =3D fdt_path_offset(dt, "/__symbols__");
> +	fixups_off =3D fdt_path_offset(dto, "/__fixups__");
> +
> +	fdt_for_each_property(dto, fixups_off, property)
> +		fdt_overlay_fixup_phandle(dt, dto, symbols_off, property);
> +
> +	return 0;
> +}
> +
> +static int fdt_apply_overlay_node(void *dt, void *dto,
> +				  int target, int overlay)

In general I'd prefer to see parameters that relate to the base DT
grouped together and parameters that relate to the overlay DT group
together.  So in this case: (dt, target, dto, overlay)

> +{
> +	int property;
> +	int node;
> +
> +	fdt_for_each_property(dto, overlay, property) {
> +		const char *name;
> +		const void *prop;
> +		int prop_len;
> +		int ret;
> +
> +		prop =3D fdt_getprop_by_offset(dto, property, &name,
> +					     &prop_len);
> +		if (!prop)
> +			return -FDT_ERR_INTERNAL;
> +
> +		ret =3D fdt_setprop(dt, target, name, prop, prop_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	fdt_for_each_subnode(dto, node, overlay) {
> +		const char *name =3D fdt_get_name(dto, node, NULL);
> +		int nnode;
> +		int ret;
> +
> +		nnode =3D fdt_add_subnode(dt, target, name);
> +		if (nnode < 0)
> +			return nnode;

You need to ignore FDT_ERR_EXISTS here, since overlays are allowed to
update existing nodes.

> +
> +		ret =3D fdt_apply_overlay_node(dt, dto, nnode, node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int fdt_overlay_merge(void *dt, void *dto)
> +{
> +	int root, fragment;
> +
> +	root =3D fdt_path_offset(dto, "/");
> +	if (root < 0)
> +		return root;

No path_offset(/)

> +	fdt_for_each_subnode(dto, fragment, root) {
> +		const char *name =3D fdt_get_name(dto, fragment, NULL);
> +		uint32_t target;
> +		int overlay;
> +		int ret;
> +
> +		if (strncmp(name, "fragment", 8))
> +			continue;
> +
> +		target =3D fdt_overlay_get_target(dt, dto, fragment);
> +		if (target < 0)
> +			return target;
> +
> +		overlay =3D fdt_subnode_offset(dto, fragment, "__overlay__");
> +		if (overlay < 0)
> +			return overlay;
> +
> +		ret =3D fdt_apply_overlay_node(dt, dto, target, overlay);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int fdt_overlay_apply(void *fdt, void *fdto)
> +{
> +	uint32_t delta =3D fdt_get_max_phandle(fdt) + 1;
> +	void *fdto_copy;
> +	int ret;
> +
> +	FDT_CHECK_HEADER(fdt);
> +	FDT_CHECK_HEADER(fdto);
> +
> +	/*
> +	 * We're going to modify the overlay so that we can apply it.
> +	 *
> +	 * Make sure sure we don't destroy the original
> +	 */
> +	fdto_copy =3D malloc(fdt_totalsize(fdto));

Again, no malloc() in libfdt - let the caller do allocation if they
want.

> +	if (!fdto_copy)
> +		return -FDT_ERR_INTERNAL;
> +
> +	ret =3D fdt_move(fdto, fdto_copy, fdt_totalsize(fdto));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_adjust_local_phandles(fdto_copy, delta);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_update_local_references(fdto_copy, delta);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_fixup_phandles(fdt, fdto_copy);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D fdt_overlay_merge(fdt, fdto_copy);
> +
> +out:
> +	free(fdto_copy);
> +	return ret;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index 7156b264b1e9..ebee808a7f92 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1716,6 +1716,36 @@ int fdt_add_subnode(void *fdt, int parentoffset, c=
onst char *name);
>   */
>  int fdt_del_node(void *fdt, int nodeoffset);
> =20
> +/**
> + * fdt_overlay_apply - Applies a DT overlay on a base DT
> + * @fdt: pointer to the base device tree blob
> + * @fdto: pointer to the device tree overlay blob
> + *
> + * fdt_overlay_apply() will apply the given device tree overlay on the
> + * given base device tree.
> + *
> + * Expect the base device tree to be modified, even if the function
> + * returns an error.
> + *
> + * returns:
> + *	0, on success
> + *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
> + *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
> + *		properties in the base DT
> + *	-FDT_ERR_BADPHANDLE, the phandles in the overlay do not have the right
> + *		magic
> + *	-FDT_ERR_INTERNAL,
> + *	-FDT_ERR_BADLAYOUT,
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADOFFSET,
> + *	-FDT_ERR_BADPATH,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTRUCTURE,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_TRUNCATED, standard meanings
> + */
> +int fdt_overlay_apply(void *fdt, void *fdto);
> +
>  /**********************************************************************/
>  /* Debugging / informational functions                                */
>  /**********************************************************************/
> diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
> index 9dea97dfff81..99f936dacc60 100644
> --- a/libfdt/libfdt_env.h
> +++ b/libfdt/libfdt_env.h
> @@ -54,6 +54,7 @@
> =20
>  #include <stddef.h>
>  #include <stdint.h>
> +#include <stdlib.h>
>  #include <string.h>
> =20
>  #ifdef __CHECKER__

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXT8LUAAoJEGw4ysog2bOSEQsP/086p66Kd4Awx/3+vz8EXP7+
x9fhDokotYZPbgag+sGPCs2mVr//7rCzZRNBoUv4Uccdf9bYhikWgqcK95DEkQvK
KW5q/unsBlIqd/ajSzad+WszC0Z3bADEQd0Zu3+V+354HSaendKpupN0iwEOtbNZ
t2ki5YCyKq2kjYF7AynIJ1wYtfoOjhNICLBmjqspi+gs9LGc0zqFg2Z/5UW2+SQW
HOlH76LDGa1fxFCLsazbVzVAExAYuYcEZoe/WEIgXLswTEDHbDqHXcd4FkNNRbHw
zrgDUYN773mDammHxz7vkB5hfRsOvy4NiNWozsa3T4r2hX4wc9xryVCteJX/583T
hrUYA2Ow1/KARVNouFoNN2rccEjGyFARrfrCwFBj49tROp6+eSuCoVeKMfs6xcr7
esUa+kGK3wY40GDBgohQ5udKH5n9s9/nv1c7w/Y1OHxTmFuqtE0GtOQoz7Y2j8DX
aMZ80E0rXMzinC8XNhlWEGMB9Ux8dmFPp2qrggWaEZmbrKLu5csW4fVt33xhFkFo
wm97EUjiUbqg1i8n9elMuinfaMuCLwh/yKknl6YN1hRELGs4edMDGPUyxl2OIsPn
Xn5UAuOX96IizbIXEOqqccznTiyOQFiSD+0RFxs4XZvEeLnz3tnq4irZOdZ3FYFX
CSWR0EYYnyLfYKDi3NQH
=jC2X
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--

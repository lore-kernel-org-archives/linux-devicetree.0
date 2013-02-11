From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/8] libfdt: Add function to find regions in an FDT
Date: Mon, 11 Feb 2013 13:47:36 +1100
Message-ID: <20130211024736.GG4948@truffula.fritz.box>
References: <1358801962-21707-1-git-send-email-sjg@chromium.org>
 <1358801962-21707-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6446333641288575211=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358801962-21707-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6446333641288575211==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cfJ13FhsvNR/yOpm"
Content-Disposition: inline


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2013 at 12:59:19PM -0800, Simon Glass wrote:
> Given a set of nodes and properties, find the regions of the device tree
> which describe those parts.
>=20
> A test is provided which builds a tree while tracking where the regions
> should be, then calls fdt_find_regions() to make sure that it agrees.
>=20
> Further tests will come as part of fdtgrep.

Ok, for starters I don't want to include this before the next dtc
release.  It's a pretty substantial addition.

Second, fdt_wip is definitely the wrong place for this.  fdt_wip.c is
for the Write-In-Place code (i.e. functions which alter the tree
contents, but don't need to move any existing data around).  AFAICT
this function only reads the tree, which would put it in fdt_ro.c.
However, it's such a big addition - and adds several new state
structures, I think it should go in an entirely new source file for
it.  That way people who don't use this piece of the library won't get
it included, even if they don't have a compiler which does function
sections.

Third, I'm having a bit of trouble wrapping my head around exactly
what the search function does, and how the various flags and pieces
interact.  A block comment with a general overview would be nice.

More specific comments below:

>=20
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  libfdt/fdt_wip.c     |  311 ++++++++++++++++++++++++++++++++++++++++++++=
++++
>  libfdt/libfdt.h      |  142 ++++++++++++++++++++++
>  tests/.gitignore     |    1 +
>  tests/Makefile.tests |    3 +-
>  tests/region_tree.c  |  324 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  tests/run_tests.sh   |    5 +
>  6 files changed, 785 insertions(+), 1 deletions(-)
>  create mode 100644 tests/region_tree.c
>=20
> diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
> index c5bbb68..ff0f940 100644
> --- a/libfdt/fdt_wip.c
> +++ b/libfdt/fdt_wip.c
> @@ -116,3 +116,314 @@ int fdt_nop_node(void *fdt, int nodeoffset)
>  			endoffset - nodeoffset);
>  	return 0;
>  }
> +
> +/* Maximum depth that we can grep */
> +#define FDT_MAX_DEPTH	32
> +
> +/* Decribes what we want to include from the current tag */
> +enum want_t {
> +	WANT_NOTHING,
> +	WANT_NODES_ONLY,
> +	WANT_NODES_AND_PROPS,
> +};
> +
> +/* Keeps track of the state at parent nodes */
> +struct fdt_subnode_stack {
> +	int offset;		/* Offset of node */
> +	enum want_t want;	/* The 'want' value here */
> +	int included;		/* 1 if we included this node, 0 if not */

What's the distinction between 'included' and 'want' and how do they
interact?

> +};
> +
> +/* The state of our finding algortihm */
> +struct find_reg {
> +	struct fdt_subnode_stack stack[FDT_MAX_DEPTH];	/* node stack */
> +	struct fdt_region *region;	/* Contains list of regions found */
> +	int count;			/* Numnber of regions found */
> +	const void *fdt;		/* FDT blob */
> +	int max_regions;		/* Maximum regions to find */
> +	int can_merge;		/* 1 if we can merge with previous region */
> +};
> +
> +/**
> + * fdt_add_region() - Add a new region to our list
> + *
> + * The region is added if there is space, but in any case we increment t=
he
> + * count. If permitted, and the new region overlaps the last one, we mer=
ge
> + * them.
> + *
> + * @info: State information
> + * @offset: Start offset of region
> + * @size: Size of region
> + */
> +static void fdt_add_region(struct find_reg *info, int offset, int size)
> +{
> +	struct fdt_region *reg =3D &info->region[info->count - 1];
> +
> +	if (info->can_merge && info->count &&
> +			info->count < info->max_regions &&

Shouldn't this be <=3D for the merge case?

> +			offset <=3D reg->offset + reg->size) {
> +		reg->size =3D offset + size - reg->offset;
> +	} else if (info->count < info->max_regions) {
> +		reg++;
> +		reg->offset =3D offset;
> +		reg->size =3D size;
> +		info->count++;
> +	}
> +}
> +
> +/**
> + * fdt_include_supernodes() - Include supernodes required by this node
> + *
> + * When we decided to include a node or property which is not at the top
> + * level, this function forces the inclusion of higher level nodes. For
> + * example, given this tree:
> + *
> + * / {
> + *     testing {
> + *     }
> + * }
> + *
> + * If we decide to include testing then we need the root node to have a =
valid
> + * tree. This function adds those regions.
> + *
> + * @info: State information
> + * @depth: Current stack depth
> + */
> +static void fdt_include_supernodes(struct find_reg *info, int depth)
> +{
> +	int base =3D fdt_off_dt_struct(info->fdt);
> +	int start, stop_at;
> +	int i;
> +
> +	/*
> +	 * Work down the stack looking for supernodes that we didn't include.
> +	 * The algortihm here is actually pretty simple, since we know that
> +	 * no previous subnode had to include these nodes, or if it did, we
> +	 * marked them as included (on the stack) already.
> +	 */
> +	for (i =3D 0; i <=3D depth; i++) {
> +		if (!info->stack[i].included) {
> +			start =3D info->stack[i].offset;
> +
> +			/* Add the FDT_BEGIN_NODE tag of this supernode */
> +			fdt_next_tag(info->fdt, start, &stop_at);
> +			fdt_add_region(info, base + start, stop_at - start);
> +
> +			/* Remember that this supernode is now included */
> +			info->stack[i].included =3D 1;
> +			info->can_merge =3D 1;
> +		}
> +
> +		/* Force (later) generation of the FDT_END_NODE tag */
> +		if (!info->stack[i].want)
> +			info->stack[i].want =3D WANT_NODES_ONLY;
> +	}
> +}
> +
> +int fdt_find_regions(const void *fdt,
> +		int (*h_include)(void *priv, int type, const char *data,
> +			int size),
> +		void *priv,
> +		struct fdt_region region[], int max_regions,
> +		char *path, int path_len, int flags)

So, in general I've tried to avoid having the libfdt interfaces
require the caller to buffer significant amounts of information.  So,
if it's possible (and I don't immediately see a reason for it not to
be) I'd prefer to see first_region()/next_region() type functions,
rather than requiring the callers to gather the whole region list at
once.

> +{
> +	int base =3D fdt_off_dt_struct(fdt);
> +	struct find_reg info;
> +	int nextoffset;
> +	int start =3D -1;
> +	int depth =3D -1;
> +	const char *str;
> +	enum want_t want =3D WANT_NOTHING;
> +	uint32_t tag;
> +	char *end;
> +
> +	/* Set up our state */
> +	info.fdt =3D fdt;
> +	info.can_merge =3D 1;
> +	info.count =3D 0;
> +	info.region =3D region;
> +	info.max_regions =3D max_regions;
> +
> +	/* Add the memory reserve map into its own region */
> +	if (flags & FDT_REG_ADD_MEM_RSVMAP) {
> +		fdt_add_region(&info, fdt_off_mem_rsvmap(fdt),
> +			fdt_off_dt_struct(fdt) - fdt_off_mem_rsvmap(fdt));
> +		info.can_merge =3D 0;	/* Don't allow merging with this */
> +	}
> +
> +	end =3D path;
> +	*end =3D '\0';
> +	nextoffset =3D 0;
> +
> +	/*
> +	 * Work through the tags one by one, deciding whether each needs to
> +	 * be included or not. We set the variable 'include' to indicate our
> +	 * decision. 'want' is used to track what we want to include - it
> +	 * allows us to pick up all the properties (and/or subnode tags) of
> +	 * a node.
> +	 */
> +	do {
> +		const struct fdt_property *prop;
> +		const char *name;
> +		int include =3D 0;
> +		int stop_at =3D 0;
> +		int offset;
> +		int val;
> +		int len;
> +
> +		/*
> +		 * Find the tag, and the offset of the next one. If we need to
> +		 * stop including tags, then by default we stop *after*
> +		 * including the current tag
> +		 */
> +		offset =3D nextoffset;
> +		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
> +		stop_at =3D nextoffset;
> +
> +		switch (tag) {
> +		case FDT_PROP:
> +			stop_at =3D offset;
> +			prop =3D fdt_get_property_by_offset(fdt, offset, NULL);
> +			str =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> +			val =3D h_include(priv, FDT_IS_PROP, str,
> +					    strlen(str) + 1);
> +			if (val =3D=3D -1) {
> +				include =3D want =3D=3D WANT_NODES_AND_PROPS;
> +			} else {
> +				include =3D val;
> +				/*
> +				 * Make sure we include the } for this block.
> +				 * It might be more correct to put this done
> +				 * by the call to fdt_include_supernodes() in
> +				 * the case where it adds the node we are
> +				 * currently in, but this is fairly
> +				 * equivalent.
> +				 */
> +				if ((flags & FDT_REG_SUPERNODES) && val &&
> +						!want)
> +					want =3D WANT_NODES_ONLY;
> +			}
> +
> +			/* Value grepping is not yet supported */
> +			break;
> +
> +		case FDT_NOP:
> +			include =3D want =3D=3D WANT_NODES_AND_PROPS;
> +			stop_at =3D offset;
> +			break;
> +
> +		case FDT_BEGIN_NODE:
> +			depth++;
> +			if (depth =3D=3D FDT_MAX_DEPTH)
> +				return -FDT_ERR_BADSTRUCTURE;

Hrm.  Perhaps we should add a new error code for "too deep".  After
all the structure of the tree is perfectly fine here, it's just this
search function can't cope with its depth.

> +			name =3D fdt_get_name(fdt, offset, &len);
> +			if (end - path + 2 + len >=3D path_len)
> +				return -FDT_ERR_NOSPACE;
> +
> +			/* Build the full path of this node */
> +			if (end !=3D path + 1)
> +				*end++ =3D '/';
> +			strcpy(end, name);
> +			end +=3D len;
> +			info.stack[depth].want =3D want;
> +			info.stack[depth].offset =3D offset;
> +
> +			/*
> +			 * If we are not intending to include this node, make
> +			 * sure we stop *before* its tag
> +			 */
> +			if (want =3D=3D WANT_NODES_ONLY ||
> +					!(flags & FDT_REG_DIRECT_SUBNODES)) {
> +				stop_at =3D offset;
> +				want =3D WANT_NOTHING;
> +			}
> +			val =3D h_include(priv, FDT_IS_NODE, path,
> +					end - path + 1);
> +
> +			/*
> +			 * If no information about this, try the compatible
> +			 * property. Here we are looking ahead in the tree.
> +			 */
> +			if (val =3D=3D -1) {
> +				str =3D fdt_getprop(fdt, offset,
> +						  "compatible", &len);
> +				val =3D h_include(priv, FDT_IS_COMPAT, str,
> +						    len);
> +			}
> +
> +			/* Include this if requested */
> +			if (val)
> +				want =3D WANT_NODES_AND_PROPS;
> +
> +			/* If not requested, decay our 'want' value */
> +			else if (want)
> +				want--;
> +
> +			/* Not including this tag, so stop now */
> +			else
> +				stop_at =3D offset;
> +
> +			/*
> +			 * Decide whether to include this tag, and update our
> +			 * stack with the state for this node
> +			 */
> +			include =3D want;
> +			info.stack[depth].included =3D include;
> +			break;
> +
> +		case FDT_END_NODE:
> +			include =3D want;
> +			if (depth < 0)
> +				return -FDT_ERR_BADSTRUCTURE;
> +
> +			/*
> +			 * If we don't want this node, stop right away, unless
> +			 * we are including subnodes
> +			 */
> +			if (!want && !(flags & FDT_REG_DIRECT_SUBNODES))
> +				stop_at =3D offset;
> +			want =3D info.stack[depth].want;
> +			depth--;
> +			while (end > path && *--end !=3D '/')
> +				;
> +			*end =3D '\0';
> +			break;
> +
> +		case FDT_END:
> +			/* We always include the end tag */
> +			include =3D 1;
> +			break;
> +		}
> +
> +		/* If this tag is to be included, mark it as region start */
> +		if (include && start =3D=3D -1) {
> +			/* Include any supernodes required by this one */
> +			if (flags & FDT_REG_SUPERNODES)
> +				fdt_include_supernodes(&info, depth);
> +			start =3D offset;
> +		}
> +
> +		/*
> +		 * If this tag is not to be included, finish up the current
> +		 * region
> +		 */
> +		if (!include && start !=3D -1) {
> +			fdt_add_region(&info, base + start, stop_at - start);
> +			start =3D -1;
> +			info.can_merge =3D 1;
> +		}
> +	} while (tag !=3D FDT_END);
> +
> +	if (nextoffset !=3D fdt_size_dt_struct(fdt))
> +		return -FDT_ERR_BADLAYOUT;

That should be BADSTRUCTURE, not BADLAYOUT.  BADLAYOUT means
structure/strings/memreserve blocks are not in the preferred order
w.r.t. each other.

> +
> +	/* Add a region for the END tag and a separate one for string table */
> +	fdt_add_region(&info, base + start, nextoffset - start);
> +	if (flags & FDT_REG_ADD_STRING_TAB) {
> +		info.can_merge =3D 0;
> +		fdt_add_region(&info, fdt_off_dt_strings(fdt),
> +			       fdt_size_dt_strings(fdt));
> +	}

You may want to give BADLAYOUT here, though, if the strings block is
before the structure block.

> +
> +	return info.count;
> +}
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c0075e7..0b3eacf 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -1489,4 +1489,146 @@ int fdt_del_node(void *fdt, int nodeoffset);
> =20
>  const char *fdt_strerror(int errval);
> =20
> +struct fdt_region {
> +	int offset;
> +	int size;
> +};
> +
> +/*
> + * Flags for fdt_find_regions()
> + *
> + * Add a region for the string table (always the last region)
> + */
> +#define FDT_REG_ADD_STRING_TAB		(1 << 0)
> +
> +/* Add the FDT_BEGIN_NODE tags of subnodes, including their names */
> +#define FDT_REG_DIRECT_SUBNODES	(1 << 1)
> +
> +/*
> + * Add all supernodes of a matching node/property, useful for creating a
> + * valid subset tree
> + */
> +#define FDT_REG_SUPERNODES		(1 << 2)
> +
> +/* Add a region for the mem_rsvmap table (always the first region) */
> +#define FDT_REG_ADD_MEM_RSVMAP		(1 << 3)
> +
> +/* Indicates what an fdt part is (node, property, value, compatible) */
> +#define FDT_IS_NODE			(1 << 0)
> +#define FDT_IS_PROP			(1 << 1)
> +#define FDT_IS_VALUE			(1 << 2)	/* not supported */
> +#define FDT_IS_COMPAT			(1 << 3)
> +
> +#define FDT_IS_ANY			15
> +
> +/**
> + * fdt_find_regions() - find regions in device tree
> + *
> + * Given a nodes and properties to include and properties to exclude, fi=
nd
> + * the regions of the device tree which describe those included parts.
> + *
> + * The use for this function is twofold. Firstly it provides a convenient
> + * way of performing a structure-aware grep of the tree. For example it =
is
> + * possible to grep for a node and get all the properties associated with
> + * that node. Trees can be subsetted easily, by specifying the nodes that
> + * are required, and then writing out the regions returned by this funct=
ion.
> + * This is useful for small resource-constrained systems, such as boot
> + * loaders, which want to use an FDT but do not need to know about all of
> + * it.
> + *
> + * Secondly it makes it easy to hash parts of the tree and detect change=
s.
> + * The intent is to get a list of regions which will be invariant provid=
ed
> + * those parts are invariant. For example, if you request a list of regi=
ons
> + * for all nodes but exclude the property "data", then you will get the
> + * same region contents regardless of any change to "data" properties.
> + *
> + * This function can be used to produce a byte-stream to send to a hashi=
ng
> + * function to verify that critical parts of the FDT have not changed.

Note that semantically null changes in order could still cause false
hash misses even with this subsetting.

> + * The nodes/properties to include/exclude are defined by a function
> + * provided by the caller. This function is called for each node and
> + * property, and must return:
> + *
> + *    0 - to exclude this part
> + *    1 - to include this part
> + *   -1 - if no information is available

You don't describe what this function does when told "no information
is available".  Really the option seems a bit pointless to me, why not
just leave the include by default or exclude by default decision to
the include function.

> + *
> + * For nodes, the function may be called twice, once with FDT_IS_NODE to=
 check
> + * the node name. If this returns -1 then the function is immediately ca=
lled
> + * again with FDT_IS_COMPAT to check the compatible string. Note that if
> + * there is no compatible string, then data =3D=3D NULL and size =3D=3D =
0. This means
> + * that the inclusion of a node can be controlled either by a node name =
or
> + * its compatible string.

This seems awkward to me.  Why not supply the fdt pointer and node
offset when calling the inclusion function for a node and have
h_include get whatever properties it needs to make that decision.

> + *
> + * There is no special handling of unit addresses, so the entire name mu=
st
> + * be given for nodes. Wildcards are not supported.

Given where?  The only names given in the interface are in the tree
itself.  Wildcards could be supported by the h_include function AFAICT.

> + * As an example, including node "/" means to include the root node and =
all
> + * root properties. A flag provides a way of also including supernodes (=
of
> + * which there is none for the root node), and another flag includes
> + * immediate subnodes, so in this case we would get the FDT_BEGIN_NODE a=
nd
> + * FDT_END_NODE of all subnodes of /.
> + *
> + * The subnode feature helps in a hashing situation since it prevents the
> + * root node from changing at all. Any change to non-excluded properties,
> + * names of subnodes or number of subnodes would be detected.
> + *
> + * When used with FITs this provides the ability to hash and sign parts =
of
> + * the FIT based on different configurations in the FIT. Then it is
> + * impossible to change anything about that configuration (include images
> + * attached to the configuration), but it may be possible to add new
> + * configurations, new images or new signatures within the existing
> + * framework.
> + *
> + * Adding new properties to a device tree may result in the string table
> + * being extended (if the new property names are different from those
> + * already added). This function can optionally include a region for
> + * the string table so that this can be part of the hash too. This is al=
ways
> + * the last region.
> + *
 > + * The FDT also has a mem_rsvmap table which can also be included, and =
is
> + * always the first region if so.
> + *
> + * The device tree header is not included in the region list. Since the
> + * contents of the FDT are changing (shrinking, often), the caller will =
need
> + * to regenerate the header anyway.
> + *
> + * @fdt:	Device tree to check
> + * @h_include:	Function to call to determine whether to include a part or
> + *		not:
> + *
> + *		@priv: Private pointer as passed to fdt_find_regions()
> + *		@type: Type of this part, FDT_IS_...
> + *		@data: Pointer to data (node name, property name, compatible
> + *			string, value (not yet supported)
> + *		@size: Size of data, or 0 if none
> + *		@return 0 to exclude, 1 to include, -1 if no information is
> + *		available
> + * @priv:	Private pointer passed to h_include
> + * @region:	Returns list of regions, sorted by offset
> + * @max_regions: Maximum length of region list
> + * @path:	Pointer to a temporary string for the function to use for
> + *		building path names
> + * @path_len:	Length of path, must be large enough to hold the longest
> + *		path in the tree
> + * @flags:	Various flags that control the region algortihm, see
> + *		FDT_REG_...
> + * @return number of regions in list. If this is >max_regions then the
> + * region array was exhausted. You should increase max_regions and try
> + * the call again. Only the first max_regions elements are available in =
the
> + * array.
> + *
> + * On error a -ve value is return, which can be:
> + *
> + *	-FDT_ERR_BADSTRUCTURE (too deep or more END tags than BEGIN tags
> + *	-FDT_ERR_BADLAYOUT
> + *	-FDT_ERR_NOSPACE (path area is too small)
> + */
> +int fdt_find_regions(const void *fdt,
> +		     int (*h_include)(void *priv, int type, const char *data,
> +				      int size),
> +		     void *priv,
> +		     struct fdt_region region[], int max_regions,
> +		     char *path, int path_len, int flags);
> +
>  #endif /* _LIBFDT_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cfJ13FhsvNR/yOpm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEYW8gACgkQaILKxv3ab8ZsmgCeKO7vh9TuPRLKfIALG+RsSzzc
fV8AnRDOItFViJaaivj7TCQy1EYbVRrj
=OaIW
-----END PGP SIGNATURE-----

--cfJ13FhsvNR/yOpm--

--===============6446333641288575211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6446333641288575211==--

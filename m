From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH RFC 3/5] Implement DT schema checker using hybrid approach
Date: Sun, 9 Mar 2014 23:17:01 +1100
Message-ID: <20140309121701.GH20356@voom.redhat.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
 <1392919611-10746-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z0mFw3+mXTC5ycVe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392919611-10746-4-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Z0mFw3+mXTC5ycVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2014 at 07:06:49PM +0100, Tomasz Figa wrote:
> This patch adds a proof of concept framework to implement schema checker
> using a combined C and DTSS based approach.
>=20
> Complex and generic bindings can be implemented directly in C and then
> instantiated from simple device-specific bindings using DTS-like DTSS
> language.
>=20
> This is based on Stephen Warren's C based DT schema checker proof of
> concept patch.
>=20
> [original C based DT schema checker proof of concept]
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> [further development into hybrid solution]
> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  Makefile         |   2 +-
>  Makefile.dtc     |   5 +-
>  checks.c         |  15 +++
>  dtc.c            |  17 ++-
>  dtc.h            |  26 +++++
>  dtss-lexer.l     | 291 +++++++++++++++++++++++++++++++++++++++++++++++
>  dtss-parser.y    | 341 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  schemas/schema.c | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  schemas/schema.h |  89 +++++++++++++++
>  srcpos.h         |   2 +
>  treesource.c     |  22 ++++
>  11 files changed, 1117 insertions(+), 4 deletions(-)
>  create mode 100644 dtss-lexer.l
>  create mode 100644 dtss-parser.y
>  create mode 100644 schemas/schema.c
>  create mode 100644 schemas/schema.h
>=20
> diff --git a/Makefile b/Makefile
> index 86f5ab3..0625fb8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -15,7 +15,7 @@ EXTRAVERSION =3D
>  LOCAL_VERSION =3D
>  CONFIG_LOCALVERSION =3D
> =20
> -CPPFLAGS =3D -I libfdt -I .
> +CPPFLAGS =3D -I libfdt -I . -I schemas
>  WARNINGS =3D -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>  	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
>  CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)
> diff --git a/Makefile.dtc b/Makefile.dtc
> index bece49b..bf19564 100644
> --- a/Makefile.dtc
> +++ b/Makefile.dtc
> @@ -12,7 +12,8 @@ DTC_SRCS =3D \
>  	livetree.c \
>  	srcpos.c \
>  	treesource.c \
> -	util.c
> +	util.c \
> +	schemas/schema.c
> =20
> -DTC_GEN_SRCS =3D dtc-lexer.lex.c dtc-parser.tab.c
> +DTC_GEN_SRCS =3D dtc-lexer.lex.c dtc-parser.tab.c dtss-lexer.lex.c dtss-=
parser.tab.c
>  DTC_OBJS =3D $(DTC_SRCS:%.c=3D%.o) $(DTC_GEN_SRCS:%.c=3D%.o)
> diff --git a/checks.c b/checks.c
> index 47eda65..7c85fcf 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -19,6 +19,7 @@
>   */
> =20
>  #include "dtc.h"
> +#include "schemas/schema.h"
> =20
>  #ifdef TRACE_CHECKS
>  #define TRACE(c, ...) \
> @@ -651,6 +652,18 @@ static void check_obsolete_chosen_interrupt_controll=
er(struct check *c,
>  }
>  TREE_WARNING(obsolete_chosen_interrupt_controller, NULL);
> =20
> +/*
> + * Schema checks
> + */
> +
> +static void check_schema(struct check *c, struct node *dt,
> +				       struct node *node)
> +{
> +	if (schema_check_node(dt, node))
> +		FAIL(c, "Schema check failed for %s", node->fullpath);
> +}
> +NODE_ERROR(schema, NULL);
> +
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
>  	&node_name_chars, &node_name_format, &property_name_chars,
> @@ -669,6 +682,8 @@ static struct check *check_table[] =3D {
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> +	&schema,
> +
>  	&always_fail,
>  };

Blech.  The whole point of the checks infrastructure is to keep track
of checks for different possible problems in the tree.  It has stuff
to handle possible interdependencies, and to keep checking what it
can, even if some checks have already failed.

And you throw that all away by handling all the schemas in a single
check.  Instead, each schema should be loaded as a separate check.
This also makes the C/schema hybrid approach much more natural, as
there's no artificial distinction between a schema/check implemented
directly in C and one loaded from a script/schema parser.

> diff --git a/dtc.c b/dtc.c
> index d36ccdc..1a5913b 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -20,6 +20,7 @@
> =20
>  #include "dtc.h"
>  #include "srcpos.h"
> +#include "schemas/schema.h"
> =20
>  /*
>   * Command line options
> @@ -49,7 +50,7 @@ static void fill_fullpaths(struct node *tree, const cha=
r *prefix)
> =20
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "dtc [options] <input file>";
> -static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:h=
v";
> +static const char usage_short_opts[] =3D "qI:O:o:V:d:R:S:p:fb:i:H:sW:E:x=
:hv";
>  static struct option const usage_long_opts[] =3D {
>  	{"quiet",            no_argument, NULL, 'q'},
>  	{"in-format",         a_argument, NULL, 'I'},
> @@ -67,6 +68,7 @@ static struct option const usage_long_opts[] =3D {
>  	{"phandle",           a_argument, NULL, 'H'},
>  	{"warning",           a_argument, NULL, 'W'},
>  	{"error",             a_argument, NULL, 'E'},
> +	{"schema",            a_argument, NULL, 'x'},
>  	{"help",             no_argument, NULL, 'h'},
>  	{"version",          no_argument, NULL, 'v'},
>  	{NULL,               no_argument, NULL, 0x0},
> @@ -97,6 +99,7 @@ static const char * const usage_opts_help[] =3D {
>  	 "\t\tboth   - Both \"linux,phandle\" and \"phandle\" properties",
>  	"\n\tEnable/disable warnings (prefix with \"no-\")",
>  	"\n\tEnable/disable errors (prefix with \"no-\")",
> +	"\n\tUse schema file"
>  	"\n\tPrint this help and exit",
>  	"\n\tPrint version and exit",
>  	NULL,
> @@ -105,10 +108,12 @@ static const char * const usage_opts_help[] =3D {
>  int main(int argc, char *argv[])
>  {
>  	struct boot_info *bi;
> +	struct boot_info *bi_schema;

Really?  Most of the boot_info structure makes no sense when parsing
schemas rather than an actual device tree.  Even if you're trying to
use a common parser (which I think is a mistake), then at least
implement a different wrapper which uses an appropriate output type.

>  	const char *inform =3D "dts";
>  	const char *outform =3D "dts";
>  	const char *outname =3D "-";
>  	const char *depname =3D NULL;
> +	const char *schema =3D NULL;
>  	bool force =3D false, sort =3D false;
>  	const char *arg;
>  	int opt;
> @@ -185,6 +190,10 @@ int main(int argc, char *argv[])
>  			parse_checks_option(false, true, optarg);
>  			break;
> =20
> +		case 'x':
> +			schema =3D optarg;
> +			break;
> +
>  		case 'h':
>  			usage(NULL);
>  		default:
> @@ -220,6 +229,12 @@ int main(int argc, char *argv[])
>  	else
>  		die("Unknown input format \"%s\"\n", inform);
> =20
> +	if (schema) {
> +		bi_schema =3D schema_from_source(schema);
> +		//dt_to_source(stdout, bi_schema);
> +		build_schema_list(bi_schema);
> +	}
> +
>  	if (depfile) {
>  		fputc('\n', depfile);
>  		fclose(depfile);
> diff --git a/dtc.h b/dtc.h
> index 9ce9d12..19d2d24 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -135,21 +135,43 @@ struct label {
>  	struct label *next;
>  };
> =20
> +enum {
> +	PROPERTY_DATA,
> +	PROPERTY_USE,
> +	PROPERTY_REQUIRE,
> +	PROPERTY_MATCH,
> +};
> +
> +#define PROPERTY_FLAG_OPTIONAL	(1 << 0)
> +
>  struct property {
>  	bool deleted;
>  	char *name;
>  	struct data val;
> +	unsigned int type;
> +	unsigned int flags;
> =20
>  	struct property *next;
> =20
>  	struct label *labels;
>  };
> =20
> +enum {
> +	NODE_DATA,
> +	NODE_USE,
> +	NODE_REQUIRE,
> +};
> +
> +#define NODE_FLAG_OPTIONAL	(1 << 0)
> +#define NODE_FLAG_INCOMPLETE	(1 << 1)
> +
>  struct node {
>  	bool deleted;
>  	char *name;
>  	struct property *proplist;
>  	struct node *children;
> +	int type;
> +	unsigned int flags;
> =20
>  	struct node *parent;
>  	struct node *next_sibling;
> @@ -297,4 +319,8 @@ struct boot_info *dt_from_source(const char *f);
> =20
>  struct boot_info *dt_from_fs(const char *dirname);
> =20
> +/* Schema source */
> +
> +struct boot_info *schema_from_source(const char *fname);
> +
>  #endif /* _DTC_H */
> diff --git a/dtss-lexer.l b/dtss-lexer.l
> new file mode 100644
> index 0000000..aee41f6
> --- /dev/null
> +++ b/dtss-lexer.l
[snip]
> diff --git a/dtss-parser.y b/dtss-parser.y
> new file mode 100644
> index 0000000..1c807da
> --- /dev/null
> +++ b/dtss-parser.y
[snip]

My mistake, there is a new lexer and parser, so there's no excuse for
the duplicated boot_info structure above.  Or for the tortured schema
syntax to make it look kind of like a device tree itself.

> diff --git a/schemas/schema.c b/schemas/schema.c
> new file mode 100644
> index 0000000..e5258cf
> --- /dev/null
> +++ b/schemas/schema.c
> @@ -0,0 +1,311 @@
> +/*
> + * Copyright (C) 2013 Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> + *
> + * Copyright (C) 2014 Samsung Electronics Co., Ltd.
> + *	Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of the
> + * License, or (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + *  General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
> + *                                                                   USA
> + */
> +
> +#include "schema.h"
> +
> +static struct schema_checker schema_list =3D {
> +	.next =3D &schema_list,
> +};
> +
> +int schema_check_node(struct node *root, struct node *node)
> +{
> +	const struct schema_checker *checker;
> +	int match;
> +	int checked =3D 0;
> +
> +	checker =3D schema_list.next;
> +	for (; checker !=3D &schema_list; checker =3D checker->next) {
> +		match =3D checker->matchfn(node, checker);
> +		if (!match)
> +			continue;
> +
> +		pr_info("Node %s matches checker %s at level %d\n",
> +			node->fullpath, checker->name, match);
> +
> +		checker->checkfn(root, node, checker);
> +		checked =3D 1;
> +	}
> +
> +	/*
> +	 * FIXME: this is too noisy right now. Make it optional until schemas
> +	 * for most bindings are implemented.
> +	 */
> +	if (!checked) {
> +		pr_warn("no schema for node %s\n", node->fullpath);
> +		return 0;
> +	}
> +
> +	/*
> +	 * FIXME: grab validation state from global somewhere.
> +	 * Using global state avoids having check return values after every
> +	 * function call, thus making the code less verbose and appear more
> +	 * assertion-based.
> +	 */
> +	return 0;
> +}
> +
> +int schema_match_path(struct node *node, const struct schema_checker *ch=
ecker)
> +{
> +	return !strcmp(node->fullpath, checker->u.path.path);
> +}
> +
> +int schema_match_compatible(struct node *node,
> +				const struct schema_checker *checker)
> +{
> +	struct property *compat_prop;
> +	int index;
> +	const char *node_compat;
> +	const char **test_compats;
> +
> +	compat_prop =3D get_property(node, "compatible");
> +	if (!compat_prop)
> +		return 0;
> +
> +	/*
> +	 * Match with any compatible value of schema with any compatible
> +	 * value of node being verified.
> +	 */
> +	for (node_compat =3D compat_prop->val.val, index =3D 0;
> +			*node_compat;
> +			node_compat +=3D strlen(node_compat) + 1, index++) {
> +		for (test_compats =3D checker->u.compatible.compats;
> +				*test_compats; test_compats++) {
> +			if (!strcmp(node_compat, *test_compats))
> +				return 1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +struct property *schema_get_param(struct node *params, const char *name)
> +{
> +	if (!params)
> +		return NULL;
> +
> +	return get_property(params, name);
> +}
> +
> +int schema_get_param_cell(struct node *params, const char *name, cell_t =
*val)
> +{
> +	struct property *prop;
> +
> +	prop =3D schema_get_param(params, name);
> +	if (!prop)
> +		return -ENOENT;
> +
> +	if (!prop->val.len)
> +		return -EINVAL;
> +
> +	*val =3D propval_cell(prop);
> +	return 0;
> +}
> +
> +struct property *require_property(struct node *node, const char *name)
> +{
> +	struct property *prop;
> +
> +	prop =3D get_property(node, name);
> +	if (!prop) {
> +		/*
> +		 * FIXME: set global error state. The same comment applies
> +		 * everywhere.
> +		 */
> +		pr_err("node '%s' missing '%s' property\n",
> +			node->fullpath, name);
> +	}
> +
> +	return prop;
> +}
> +
> +static void check_required_property(struct node *node, struct property *=
schema)
> +{
> +	struct property *prop;
> +
> +	prop =3D require_property(node, schema->name);
> +	if (!prop)
> +		return;
> +
> +	if (schema->val.len
> +	    && (schema->val.len !=3D prop->val.len
> +	    || memcmp(schema->val.val, prop->val.val, prop->val.len)))
> +		pr_err("node %s with wrong constant value of property %s\n",
> +			node->fullpath, schema->name);
> +}
> +
> +static void check_optional_property(struct node *node, struct property *=
schema)
> +{
> +	struct property *prop;
> +
> +	prop =3D get_property(node, schema->name);
> +	if (!prop)
> +		return;
> +
> +	check_required_property(node, schema);
> +}
> +
> +/*
> + * FIXME: Use a more generic solution, which does not rely on linker
> + * specific features.
> + */
> +extern const struct generic_schema __start_generic_schemas;
> +extern const struct generic_schema __stop_generic_schemas;
> +
> +static void check_generic_schema(struct node *root, struct node *node,
> +					const char *name,
> +					struct node *schema_node,
> +					bool required)
> +{
> +	const struct generic_schema *gs;
> +	int i;
> +	bool checked =3D false;
> +	unsigned int count =3D &__stop_generic_schemas - &__start_generic_schem=
as;
> +
> +	pr_info("running schema \"%s\"\n", name);
> +
> +	gs =3D &__start_generic_schemas;
> +	for (i =3D 0; i < count; ++i, ++gs) {
> +		if (strcmp(gs->name, name))
> +			continue;
> +
> +		gs->checkfn(gs, root, node, schema_node, required);
> +
> +		checked =3D true;
> +	}
> +
> +	if (!checked)
> +		pr_err("schema \"%s\" not found\n", name);
> +}
> +
> +static void check_dtss_schema(struct node *root, struct node *node,
> +			      const struct schema_checker *checker)
> +{
> +	struct property *prop_schema;
> +	struct node *schema =3D checker->node, *node_schema;
> +
> +	for_each_property(schema, prop_schema) {
> +		if (!strcmp(prop_schema->name, "compatible")
> +		    || !strcmp(prop_schema->name, "device_type"))
> +			continue;
> +
> +		switch (prop_schema->type) {
> +		case PROPERTY_DATA:
> +			if (prop_schema->flags & PROPERTY_FLAG_OPTIONAL)
> +				check_optional_property(node, prop_schema);
> +			else
> +				check_required_property(node, prop_schema);
> +			break;
> +
> +		case PROPERTY_REQUIRE:
> +			check_generic_schema(root, node, prop_schema->name,
> +						NULL, true);
> +			break;
> +
> +		case PROPERTY_USE:
> +			check_generic_schema(root, node, prop_schema->name,
> +						NULL, false);
> +			break;
> +		}
> +	}
> +
> +	for_each_child(schema, node_schema) {
> +		switch (node_schema->type) {
> +		case NODE_DATA:
> +			/* TODO: verify subnodes */
> +			break;
> +
> +		case NODE_REQUIRE:
> +			check_generic_schema(root, node, node_schema->name,
> +						node_schema, true);
> +			break;
> +
> +		case NODE_USE:
> +			check_generic_schema(root, node, node_schema->name,
> +						node_schema, false);
> +			break;
> +		}
> +	}
> +
> +	/* TODO: detect unknown properties */
> +}
> +
> +void build_schema_list(struct boot_info *schema_tree)
> +{
> +	struct node *root, *schema;
> +
> +	root =3D get_node_by_path(schema_tree->dt, "/");
> +	if (!root) {
> +		pr_err("schema file missing / node\n");
> +		return;
> +	}
> +
> +	for_each_child(root, schema) {
> +		struct schema_checker *sc =3D xmalloc(sizeof(*sc));
> +		struct property *prop;
> +
> +		sc->node =3D schema;
> +		sc->checkfn =3D check_dtss_schema;
> +		sc->name =3D schema->name;
> +
> +		for_each_property(schema, prop)
> +			if (prop->type =3D=3D PROPERTY_MATCH)
> +				goto found_match;
> +
> +		pr_err("schema '%s' without matching key\n", sc->name);
> +		free(sc);
> +		continue;
> +
> +found_match:
> +		if (!strcmp(prop->name, "compatible")) {
> +			int count;
> +			const char **compats;
> +			const char *compat;
> +
> +			count =3D propval_string_count(schema, prop) + 1;
> +			compats =3D xmalloc(count * sizeof(*compats));
> +
> +			sc->u.compatible.compats =3D compats;
> +
> +			while ((compat =3D propval_next_string(prop, compat))) {
> +				*compats =3D compat;
> +				++compats;
> +			}
> +			*compats =3D NULL;
> +
> +			sc->matchfn =3D schema_match_compatible;
> +			sc->next =3D schema_list.next;
> +			schema_list.next =3D sc;
> +		} else if (!strcmp(prop->name, "device_type")) {
> +			sc->u.type.type =3D propval_next_string(prop, NULL);
> +			sc->next =3D schema_list.next;
> +			schema_list.next =3D sc;
> +		} else if (!strcmp(prop->name, "path")) {
> +			sc->u.path.path =3D propval_next_string(prop, NULL);
> +			sc->matchfn =3D schema_match_path;
> +			sc->next =3D schema_list.next;
> +			schema_list.next =3D sc;
> +		} else {
> +			pr_err("wrong schema key type\n");
> +			free(sc);
> +		}
> +	}
> +}
> diff --git a/schemas/schema.h b/schemas/schema.h
> new file mode 100644
> index 0000000..9972a17
> --- /dev/null
> +++ b/schemas/schema.h
> @@ -0,0 +1,89 @@
> +#ifndef _SCHEMAS_SCHEMA_H
> +#define _SCHEMAS_SCHEMA_H
> +
> +#include "dtc.h"
> +
> +struct schema_checker;
> +
> +typedef int (schema_matcher_func)(struct node *node,
> +					const struct schema_checker *checker);
> +typedef void (schema_checker_func)(struct node *root, struct node *node,
> +					const struct schema_checker *checker);
> +
> +struct schema_checker {
> +	const char *name;
> +	schema_matcher_func *matchfn;
> +	schema_checker_func *checkfn;
> +	struct node *node;
> +	union {
> +		struct {
> +			const char *path;
> +		} path;
> +		struct {
> +			const char **compats;
> +		} compatible;
> +		struct {
> +			const char *type;
> +		} type;
> +	} u;
> +	struct schema_checker *next;
> +};

AFAICT all the above is only used internally in schema.c so there's no
need for it to be in a header.

> +
> +int schema_check_node(struct node *root, struct node *node);
> +
> +int schema_match_path(struct node *node, const struct schema_checker *ch=
ecker);
> +int schema_match_compatible(struct node *node,
> +				const struct schema_checker *checker);
> +
> +#define SCHEMA_MATCH_PATH(_name_, _path_) \
> +	struct schema_checker schema_checker_##_name_ =3D { \
> +		.name =3D #_name_, \
> +		.matchfn =3D schema_match_path, \
> +		.checkfn =3D checkfn_##_name_, \
> +		.u.path.path =3D _path_, \
> +	};
> +
> +#define SCHEMA_MATCH_COMPATIBLE(_name_) \
> +	struct schema_checker schema_checker_##_name_ =3D { \
> +		.name =3D #_name_, \
> +		.matchfn =3D schema_match_compatible, \
> +		.checkfn =3D checkfn_##_name_, \
> +		.u.compatible.compats =3D compats_##_name_, \
> +	};
> +
> +struct generic_schema;
> +
> +typedef void (generic_schema_checker_func)(const struct generic_schema *=
schema,
> +					   struct node *root, struct node *node,
> +					   struct node *params, bool required);
> +
> +struct generic_schema {
> +	const char *name;
> +	generic_schema_checker_func *checkfn;
> +};
> +
> +#define __used		__attribute__((__used__))
> +#define __section(S)	__attribute__ ((__section__(#S)))
> +
> +#define GENERIC_SCHEMA(_dt_name_, _name_)				\
> +	static const struct generic_schema generic_schema_##_name_	\
> +		__used __section(generic_schemas) =3D {			\
> +			.name =3D _dt_name_,				\
> +			.checkfn =3D generic_checkfn_##_name_,		\
> +	};
> +
> +struct property *require_property(struct node *node, const char *propnam=
e);
> +struct property *schema_get_param(struct node *params, const char *name);
> +int schema_get_param_cell(struct node *params, const char *name, cell_t =
*val);
> +
> +void build_schema_list(struct boot_info *schema_tree);
> +
> +#define schema_err(s,fmt,args...)	pr_err("%s: " fmt, (s)->name, ##args)
> +#define schema_warn(s,fmt,args...)	pr_warn("%s: " fmt, (s)->name, ##args)
> +#define schema_info(s,fmt,args...)	pr_info("%s: " fmt, (s)->name, ##args)
> +
> +#define node_err(n,fmt,args...)		pr_err("%s: " fmt, (n)->fullpath, ##arg=
s)
> +#define node_warn(n,fmt,args...)	pr_warn("%s: " fmt, (n)->fullpath, ##ar=
gs)
> +#define node_info(n,fmt,args...)	pr_info("%s: " fmt, (n)->fullpath, ##ar=
gs)
> +
> +#endif
> diff --git a/srcpos.h b/srcpos.h
> index f81827b..b761522 100644
> --- a/srcpos.h
> +++ b/srcpos.h
> @@ -75,7 +75,9 @@ struct srcpos {
>      struct srcfile_state *file;
>  };
> =20
> +#ifndef YYLTYPE
>  #define YYLTYPE struct srcpos
> +#endif
> =20
>  #define YYLLOC_DEFAULT(Current, Rhs, N)						\
>  	do {									\
> diff --git a/treesource.c b/treesource.c
> index bf7a626..e50285c 100644
> --- a/treesource.c
> +++ b/treesource.c
> @@ -25,6 +25,10 @@ extern FILE *yyin;
>  extern int yyparse(void);
>  extern YYLTYPE yylloc;
> =20
> +extern FILE *dtss_yyin;
> +extern int dtss_yyparse(void);
> +extern YYLTYPE dtss_yylloc;
> +
>  struct boot_info *the_boot_info;
>  bool treesource_error;
> =20
> @@ -46,6 +50,24 @@ struct boot_info *dt_from_source(const char *fname)
>  	return the_boot_info;
>  }
> =20
> +struct boot_info *schema_from_source(const char *fname)
> +{
> +	the_boot_info =3D NULL;
> +	treesource_error =3D false;
> +
> +	srcfile_push(fname);
> +	dtss_yyin =3D current_srcfile->f;
> +	dtss_yylloc.file =3D current_srcfile;
> +
> +	if (dtss_yyparse() !=3D 0)
> +		die("Unable to parse input tree\n");
> +
> +	if (treesource_error)
> +		die("Syntax error parsing input tree\n");
> +
> +	return the_boot_info;
> +}
> +
>  static void write_prefix(FILE *f, int level)
>  {
>  	int i;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z0mFw3+mXTC5ycVe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTHFu9AAoJEGw4ysog2bOSxRwP/0sCTD2u0yeXn4GK/96Rn09V
qicz8Jc1ynRpYMiDcq8X8vmYua9SNu6I7nqnj2ousAtdyLPjznP42SiEBA38T9ta
i43FwLQhP6XqocJocCxQQhH5zN+279a0FQ3LzlVUbOGUgdxPGEfndoiu5TAeX0JL
bDceQqL7qKBpK3twJoCh66IGkXxxwOsDJ1w87RytCLxfAsdtOXJDiCyDW5P9+4pj
ukVzuWdXgTue45V723TqXkAvMtc40j92Wx3IZt/7nB/o/9JVBYLefRpk0DLtUDPo
ugIe9KIE5xRXAPsHdMxfrgP6z6yGuBVKVMPmHrRLgFYDDGk4oLXnhxJOwA5J/LxS
EumqFUJy2x3sb/AU2+YEkpn08FHEGJFSGI8Fvvf7eciYDi8VBCg0Y3J9OItSDG8v
AyiB8wM2p8dT5XvG43mcSSzFNYeCfAneKVGiVAuorm59mnz1lEoZYfftpcr4YHkF
eBIt/x/5wk7mrHgHIOQ7aDFZJ9LDdxAKZWYUKzLZgnsycfxwmqvVf8GFOGb+jEJa
9lnMKi7IKvpxlgXZP1RhcGWfz6oa5m1WZwvu6+T73IWHnpAuTPgr7M/hdSU0AWwW
yMWBczpDDrBNRJnJ4jUzqk57mnUeYw1vDRhLfHxG59TIA+DDq28mp21tFOIXr2ac
PGgHD2qBSzkRXsoRhG2p
=Jo3b
-----END PGP SIGNATURE-----

--Z0mFw3+mXTC5ycVe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

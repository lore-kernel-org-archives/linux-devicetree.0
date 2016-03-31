From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 1/3] checks: Add infrastructure for setting bus type of
 nodes
Date: Thu, 31 Mar 2016 16:22:47 +1100
Message-ID: <20160331052247.GD416@voom.redhat.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458780021-5052-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 07:40:19PM -0500, Rob Herring wrote:
> In preparation to support bus specific checks, add the necessary
> infrastructure to determine the bus type for nodes. Initially, PCI and
> simple bus are supported.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> David,

Sorry it's taken me a while to look at this.  I've been a mixture of
busy and sick :/

> Hopefully this matches what you had in mind for bus checks.

It's getting there.

>=20
> Rob
>=20
>  checks.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h    | 11 +++++++++
>  2 files changed, 90 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 386f956..48e926e 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -527,6 +527,84 @@ static void fixup_path_references(struct check *c, s=
truct node *dt,
>  ERROR(path_references, NULL, NULL, fixup_path_references, NULL,
>        &duplicate_node_names);
> =20
> +static bool is_pci_bridge(struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!node)
> +		return false;
> +
> +	prop =3D get_property(node, "device_type");
> +	if (!prop)
> +		return false;
> +
> +	if (strcmp(prop->val.val, "pci") =3D=3D 0)
> +		return true;
> +
> +	return false;
> +}

So, I don't love using device_type here, since that's generally
discouraged in modern flat trees, but I don't know of a better way to
detect a pci bridge, so I guess it's ok. =20

> +struct bus_type pci_bus_type =3D {
> +        .expected_addr_cells =3D 3,
> +        .expected_size_cells =3D 2,

I'm a bit torn here.  Part of me wants to suggest a 'check_bridge'
function which handles this and can also make more subtle checks, but
then just the expected cells values will handle nearly all real cases
more succinctly.

> +        .is_type =3D is_pci_bridge,

'is_type' isn't clear whether it's checking a bus bridge or a bus
device, so it needs a rename.  'bridge_is_type' maybe?

> +};
> +
> +static bool is_simple_bridge(struct node *node)
> +{
> +	struct property *prop;
> +	int len =3D 0;
> +
> +	if (!node)
> +		return false;
> +
> +	/* root node is special case defaulting to simple-bus */
> +	if (!node->parent)
> +		return true;
> +
> +	prop =3D get_property(node, "compatible");
> +	if (!prop)
> +		return false;
> +
> +	do {
> +		const char *str =3D prop->val.val;
> +
> +		if (strcmp(str, "simple-bus") =3D=3D 0)
> +			return true;
> +		len +=3D strlen(str) + 1;
> +		str +=3D len;
> +	} while (len < prop->val.len);

Definitely want a helper function in livetree.c to do this check for a
compatible value.

> +	return false;
> +}
> +
> +struct bus_type simple_bus_type =3D {
> +	.expected_addr_cells =3D -1, /* For don't care */
> +	.expected_size_cells =3D -1,
> +	.is_type =3D is_simple_bridge,
> +};
> +
> +struct bus_type *bus_types[] =3D {
> +	&pci_bus_type,
> +	&simple_bus_type,
> +	NULL
> +};
> +
> +static void fixup_bus_type(struct check *c, struct node *dt,
> +				  struct node *node)
> +{
> +	struct bus_type **bus;
> +
> +	for (bus =3D bus_types; *bus !=3D NULL; bus++) {
> +		if (!(*bus)->is_type(node))
> +			continue;
> +
> +		node->bus_type =3D *bus;
> +		break;
> +	}
> +}
> +ERROR(bus_type, NULL, fixup_bus_type, NULL, NULL);
> +
>  /*
>   * Semantic checks
>   */
> @@ -685,6 +763,7 @@ static struct check *check_table[] =3D {
> =20
>  	&explicit_phandles,
>  	&phandle_references, &path_references,
> +	&bus_type,
> =20
>  	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
> diff --git a/dtc.h b/dtc.h
> index 56212c8..c1a1fe9 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -132,6 +132,16 @@ struct label {
>  	struct label *next;
>  };
> =20
> +struct check;
> +struct node;
> +
> +struct bus_type {
> +        int expected_addr_cells;
> +        int expected_size_cells;
> +        bool (*is_type)(struct node *node);
> +        void (*check_unit_addr)(struct check *c, struct node *dt, struct=
 node *node);
> +};
> +
>  struct property {
>  	bool deleted;
>  	char *name;
> @@ -158,6 +168,7 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +	struct bus_type *bus_type;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW/LQnAAoJEGw4ysog2bOSqM0P/jkYLlhwX+Y+0j98l/KM8Fbt
nVWdYD75OwKAUls3hrGHH4rmI1tl4fjDQvV+9wllsZKrLRkg/3glp3Zc55HDOAIX
1d6ta4NcxA9uDLOoT/oq0Kj98qVZdspwWLxoZJxjec3mWLeFDCkzefi8TzIrz4cc
H2JtBW5nLm3nDWJFy+XjOPa74Oxcn4DwbT/+2RgXEFBS5QWJjDVdxbf/+tmMZ4NC
kS81NAK3cVbj5dijbI0qz+jJWMHyHLBfj54Vj94jNUZuk+oSuTHA2vQl2lRGSF7w
aEB7wByyVpjNd8rAJjv5D7HoNpGB8e0jjtLHO4ly0iRoFy+qDatCJF0Ju2TTGmWo
OVxyv6G5ygOS1MNvrDdI+PjkLGKfoxLORFxpMYmb4Ue1Zhntqa3Dy2a75yLehuFP
i5GRlq5IDe9ueXBy8HJ0L6iNY+9adkPiFGJjpSoHTo/rTTCrdEXk2EcfFYKOFxVH
0LffwE8j924/jPugctL3SliEF2jh7dkjQpHz6VbxxYWdGFQgcVkzV4MDHEe/onJ1
7d7dv9x+AYhz4UQ0UylYL5dpChiNj0FkYjcB5pVm9c1vwc5yGgdp6oI9479QuUk8
w8JsI2vdctF6Osxv5iWLyKjwZ8d7Trl3n2gA22DoxBDMzxOYzglKiNNIbYwrFwTJ
gh9QtX1RPf5tVyXA6xbp
=4rO/
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--

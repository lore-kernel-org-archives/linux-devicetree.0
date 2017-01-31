From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: Add infrastructure for setting bus type of
 nodes
Date: Tue, 31 Jan 2017 11:26:34 +1100
Message-ID: <20170131002634.GD14879@umbus.fritz.box>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124174534.3865-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 11:45:33AM -0600, Rob Herring wrote:
> In preparation to support bus specific checks, add the necessary
> infrastructure to determine and set the bus type for nodes.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  dtc.h    | 11 +++++++++++
>  2 files changed, 62 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 8e310d69ca3d..5ef63a6a4317 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -587,6 +587,53 @@ static void fixup_path_references(struct check *c, s=
truct dt_info *dti,
>  }
>  ERROR(path_references, fixup_path_references, NULL, &duplicate_node_name=
s);
> =20
> +struct bus_type *bus_types[] =3D {
> +	NULL
> +};
> +
> +static void fixup_bus_type(struct check *c, struct dt_info *dti,
> +				  struct node *node)
> +{
> +	struct bus_type **bus;
> +
> +	for (bus =3D bus_types; *bus !=3D NULL; bus++) {

I think this would be clearer using ARRAY_SIZE() rather than the **
and NULL terminator.

> +		if (!(*bus)->bridge_is_type(node))
> +			continue;
> +
> +		node->bus_type =3D *bus;
> +		break;
> +	}
> +}
> +ERROR(bus_type, fixup_bus_type, NULL);
> +
> +static void check_bus_bridge(struct check *c, struct dt_info *dti,
> +			     struct node *node)
> +{
> +	struct bus_type *bt;
> +
> +	if (!node->bus_type)
> +		return;
> +
> +	bt =3D node->bus_type;
> +	if (bt->check_bridge)
> +		bt->check_bridge(c, dti, node);
> +}
> +WARNING(bus_bridge, check_bus_bridge, NULL);

Hrm.  So, we have a double multiplex here, and I'm not sure that it's
necessary.  First the table of checks themselves, then the table of
bus types.  Could we eliminate that simply by having each bus type
implement a check function which tests for that bus type then,
performans any checks for the bridge then sets the bus_type field.

It would mean that if there are multiple bus-specific things we want
to check about the bridge, we could put them into separate checks.
That might be clearer in some cases, and it means our existing
messages can show something informative via the check name which
failed, rather than just saying "(bus_bridge)" for anything wrong with
any bus bridge.

We could still use the bus_type field for "semi-generic" checks like
validating unit names that are the same in outline between different
buses, but differ in details.

> +static void check_bus_device(struct check *c, struct dt_info *dti,
> +			     struct node *node)
> +{
> +	struct bus_type *bt;
> +
> +	if (!node->parent || !node->parent->bus_type)
> +		return;
> +
> +	bt =3D node->parent->bus_type;
> +	if (bt->check_device)
> +		bt->check_device(c, dti, node);
> +}
> +WARNING(bus_device, check_bus_device, NULL);

Removing the double indirection would be a bit fiddlier for the bus
devices, but the same advantages apply.

>  /*
>   * Semantic checks
>   */
> @@ -753,6 +800,7 @@ static struct check *check_table[] =3D {
> =20
>  	&explicit_phandles,
>  	&phandle_references, &path_references,
> +	&bus_type,
> =20
>  	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
> @@ -764,6 +812,9 @@ static struct check *check_table[] =3D {
> =20
>  	&unit_address_vs_reg,
> =20
> +	&bus_bridge,
> +	&bus_device,
> +
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> diff --git a/dtc.h b/dtc.h
> index c6f125c68ba8..f27397cd7622 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -136,6 +136,16 @@ struct label {
>  	struct label *next;
>  };
> =20
> +struct check;
> +struct node;
> +struct dt_info;
> +
> +struct bus_type {
> +        bool (*bridge_is_type)(struct node *node);
> +        void (*check_bridge)(struct check *c, struct dt_info *dti, struc=
t node *node);
> +        void (*check_device)(struct check *c, struct dt_info *dti, struc=
t node *node);
> +};
> +
>  struct property {
>  	bool deleted;
>  	char *name;
> @@ -162,6 +172,7 @@ struct node {
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

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj9m5AAoJEGw4ysog2bOSEQ8P/0mx9VsqpgDYfxvm85NhV0EF
XQTwEzU2kRbv7HmWWtt4hTkvZzklIOoViqVRNSqgBnurT3L/iCiWvI3s5Y9VXEzd
pM5FQue2ssMPtLMj2AK3rbUV4Gii7p7F0t8TdSe19XoWK9f5nftpJa99r5FsLHdt
Jtl+xwmDuJ6Nft7/Yy8bwW4Rf7kpMUvS/s4XoE2I3lWPpIkNI+fhdOZTy6TsTpNR
NKfXbegywOf8ATf4lbkuORPkr5ee8+H62tJSJeODTL6L+pP3bY9TS3JQvZx4XejW
1WmJIFbXmr95KpGu1fN5CYf/z/gjBc8jpb6wNR23FzDj8A+4SiHq7AUdTK4j+BZK
IUUgmrHkxXS0vruDeJlukiJU8QYWODQzw66ev0IfhmCtjwVxi7kroYnvBDgiq7BX
f3wzlFNnqwFll5Q8RUJyFqHtfbiXhuDNMRSQpYn/7+MBXs3d9F31o2X2r233N9kP
bZcV+WuHONdi8doQkZoYXWim4xgGNmfJO+55TyrqulWhaxHzZXO1f1cQ80Bww84L
Yvg8I/R44KTL9/+U+aMCfq2KG7HfkuJl7lLU1RVFzpG2eyVsJWvjze01cYpHbudO
ygmA2RpuLyrPbe61tG6JqO85BVN31S5diLD8SOXe/pwgRWTXgYpdPwqhX1vg7EHZ
czQS8kfpJaR0b0TvanrI
=d8uB
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--

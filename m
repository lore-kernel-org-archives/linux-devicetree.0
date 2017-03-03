From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 2/3] checks: Add bus checks for simple-bus buses
Date: Fri, 3 Mar 2017 13:12:06 +1100
Message-ID: <20170303021206.GD4067@umbus.fritz.box>
References: <20170228224310.14162-1-robh@kernel.org>
 <20170228224310.14162-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170228224310.14162-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:43:09PM -0600, Rob Herring wrote:
> Add checks to identify simple-bus bus types and checks for child
> devices. Simple-bus type is generally identified by "simple-bus"
> compatible string. We also treat the root as a simple-bus, but only for
> child nodes with reg property.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
> - new patch
>=20
>  checks.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 5ed91ac50a10..c4865b4c8da0 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -817,6 +817,72 @@ static void check_pci_device_reg(struct check *c, st=
ruct dt_info *dti, struct no
>  }
>  WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
>=20
> +static const struct bus_type simple_bus =3D {
> +	.name =3D "simple-bus",
> +};
> +
> +static bool node_is_compatible(struct node *node, const char *compat)
> +{
> +	struct property *prop;
> +	const char *str;
> +
> +	prop =3D get_property(node, "compatible");
> +	if (!prop)
> +		return false;
> +
> +	for (str =3D prop->val.val; str < prop->val.val + prop->val.len; str +=
=3D strlen(str) + 1) {

This isn't safe if the compatible property is filled with garbage (not
'\0' terminated) - the strlen() could access beyond the end of the
property value.

> +		if (streq(str, compat))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static void check_simple_bus_bridge(struct check *c, struct dt_info *dti=
, struct node *node)
> +{
> +	if (node_is_compatible(node, "simple-bus") || !node->parent)
> +		node->bus =3D &simple_bus;

I don't think it's correct to assume the root bus is always a
simple-bus.  If it is, it really should be listed explicitly in the
root node's compatible property.

> +}
> +WARNING(simple_bus_bridge, check_simple_bus_bridge, NULL, &addr_size_cel=
ls);
> +
> +static void check_simple_bus_reg(struct check *c, struct dt_info *dti, s=
truct node *node)
> +{
> +	struct property *prop;
> +	const char *unitname =3D get_unitname(node);
> +	char unit_addr[17];
> +	unsigned int size;
> +	uint64_t reg =3D 0;
> +	cell_t *cells =3D NULL;
> +
> +	if (!node->parent || (node->parent->bus !=3D &simple_bus))
> +		return;
> +
> +	prop =3D get_property(node, "reg");
> +	if (prop)
> +		cells =3D (cell_t *)prop->val.val;
> +	else {
> +		prop =3D get_property(node, "ranges");
> +		if (prop && prop->val.len)
> +			/* skip of child address */
> +			cells =3D ((cell_t *)prop->val.val) + node_addr_cells(node);
> +	}
> +
> +	if (!cells) {
> +		if (node->parent->parent && !(node->bus =3D=3D &simple_bus))
> +			FAIL(c, dti, "Node %s missing or empty reg/ranges property", node->fu=
llpath);
> +		return;
> +	}
> +
> +	size =3D node_addr_cells(node->parent);
> +	while (size--)
> +		reg =3D (reg << 32) | fdt32_to_cpu(*(cells++));
> +
> +	snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
> +	if (!streq(unitname, unit_addr))
> +		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \=
"%s\"",
> +		     node->fullpath, unit_addr);
> +}
> +WARNING(simple_bus_reg, check_simple_bus_reg, NULL, &reg_format, &simple=
_bus_bridge);
> +
>  /*
>   * Style checks
>   */
> @@ -893,6 +959,9 @@ static struct check *check_table[] =3D {
>  	&pci_device_reg,
>  	&pci_device_bus_num,
>=20
> +	&simple_bus_bridge,
> +	&simple_bus_reg,
> +
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuND2AAoJEGw4ysog2bOSLqIQAIYIE4tmMPZxKfJiV6/u96em
yLRJwtYe0uOjBFSRPXmEa5A0MJj+MeNThnbU4dEDAt4rt/jAaij5E3I4iru8jO3b
cnrxcCtcqPDqK7CPzBi++OGu/s31JWo7spkBryR8Fc9h+g+7N9j6mR4Bo92lFWTZ
Z9W7NYKa6yZ24Gw7ypaH8q1+ho72rfsVKvTcTvZpdYGoTVao0h2xQw0fDIVw80EJ
S4/Cu97rziTf1aHof3jWEToXYY3/n8pyuV9De83v9I0CQwds3w2E9KI4rZusLoLx
1pCPvZTzyC8U4juUwZsu0964U+mB8e53ZQyEnZWT274FSI3YlqVI+LyzZc+3Zp7f
VbtVYEsf2OJ82IjoCgQA+CNryimwYOIMVp4sWC97W+6pmET/R8jrBgzeOLzfP3S5
jUgjQtGZVnkwQ3i4tugBkr4VcouWgFIIq5fujK8kSNvzPI9dnMXNx/NwXDo3ORp9
mcaivaEA9iIMkNcgWfT+SL0tUUF2F8KIrXCGSMdkEDoKXO6MgMwojrUqqQFQNZCt
4/BOt7xSa6A69aXwIG/rilGWHtXftAug+BodBZ9qLS1wZ2gNWBwBcFlA8SS5S3It
mgALINQMklQKr4kZqJHBBMKkSmUbpieGL4RS+6K4IODgQ52UhbRkicbzCeBkAKx5
KEGpFXARhVLM6/I801ZT
=bvHU
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

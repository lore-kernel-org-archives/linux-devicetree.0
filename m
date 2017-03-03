From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v3 1/3] checks: Add bus checks for PCI buses
Date: Fri, 3 Mar 2017 13:09:15 +1100
Message-ID: <20170303020915.GC4067@umbus.fritz.box>
References: <20170228224310.14162-1-robh@kernel.org>
 <20170228224310.14162-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170228224310.14162-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:43:08PM -0600, Rob Herring wrote:
> Add PCI bridge and device node checks. We identify PCI bridges with
> 'device_type =3D "pci"' as only PCI bridges should set that property. For
> bridges, check that node name is pci or pcie, ranges and bus-range are
> present, and #address-cells and #size-cells are correct.
>=20
> For devices, check the reg property fields are correct for the first
> element (the config address). Check that the unit address is formatted
> corectly based on the reg property. Device unit addresses are in the
> form DD or DD,F where DD is the device 0-0x1f and F is the function 0-7.
> Also, check that the bus number is within the expected range defined by
> bridge's bus-ranges.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Only some tiny details remaining.  With the exception of the details
mentioned below:

Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

> ---
> v3:
> - Use bus_type ptr for matching bus types
> - Add a name string to bus_type
> - Add a bus-range check
> - Improve the PCI device reg value checking
> - Use streq/strneq
> - fix FAIL call changes from current master
>=20
> v2:
> - Remove bus_type functions. Combine test for bus_type and bridge check
>   into single check.
> - Add a check that PCI bridge node name is pci or pcie.
>=20
>  checks.c | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h    |   5 +++
>  2 files changed, 141 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 0e8b978c360c..5ed91ac50a10 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -685,6 +685,138 @@ static void check_ranges_format(struct check *c, st=
ruct dt_info *dti,
>  }
>  WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
> =20
> +static const struct bus_type pci_bus =3D {
> +	.name =3D "PCI",
> +};
> +
> +static void check_pci_bridge(struct check *c, struct dt_info *dti, struc=
t node *node)
> +{
> +	struct property *prop;
> +	cell_t *cells;
> +
> +	prop =3D get_property(node, "device_type");
> +	if (!prop || strcmp(prop->val.val, "pci"))

Use streq() above, please.

> +		return;
> +
> +	node->bus =3D &pci_bus;
> +
> +	if (!strneq(node->name, "pci", node->basenamelen) &&
> +	    !strneq(node->name, "pcie", node->basenamelen))
> +		FAIL(c, dti, "Node %s node name is not \"pci\" or \"pcie\"",
> +			     node->fullpath);
> +
> +	prop =3D get_property(node, "ranges");
> +	if (!prop)
> +		FAIL(c, dti, "Node %s missing ranges for PCI bridge (or not a bridge)",
> +			     node->fullpath);
> +
> +	if (node_addr_cells(node) !=3D 3)
> +		FAIL(c, dti, "Node %s incorrect #address-cells for PCI bridge",
> +			     node->fullpath);
> +	if (node_size_cells(node) !=3D 2)
> +		FAIL(c, dti, "Node %s incorrect #size-cells for PCI bridge",
> +			     node->fullpath);
> +
> +	prop =3D get_property(node, "bus-range");
> +	if (!prop) {
> +		FAIL(c, dti, "Node %s missing bus-range for PCI bridge",
> +			     node->fullpath);
> +		return;
> +	}
> +	if (prop->val.len !=3D (sizeof(cell_t) * 2)) {
> +		FAIL(c, dti, "Node %s bus-range must be 2 cells",
> +			     node->fullpath);
> +		return;
> +	}
> +	cells =3D (cell_t *)prop->val.val;
> +	if (fdt32_to_cpu(cells[0]) > fdt32_to_cpu(cells[1]))
> +		FAIL(c, dti, "Node %s bus-range 1st cell must be less than or equal to=
 2nd cell",
> +			     node->fullpath);
> +	if (fdt32_to_cpu(cells[1]) > 0xff)
> +		FAIL(c, dti, "Node %s bus-range maximum bus number must be less than 2=
56",
> +			     node->fullpath);
> +}
> +WARNING(pci_bridge, check_pci_bridge, NULL,
> +	&device_type_is_string, &addr_size_cells);
> +
> +static void check_pci_device_bus_num(struct check *c, struct dt_info *dt=
i, struct node *node)
> +{
> +	struct property *prop;
> +	unsigned int bus_num, min_bus, max_bus;
> +	cell_t *cells;
> +
> +	if (!node->parent || (node->parent->bus !=3D &pci_bus))
> +		return;
> +
> +	prop =3D get_property(node, "reg");
> +	if (!prop)
> +		return;
> +
> +	cells =3D (cell_t *)prop->val.val;
> +	bus_num =3D (fdt32_to_cpu(cells[0]) & 0x00ff0000) >> 16;
> +
> +	prop =3D get_property(node->parent, "bus-range");
> +	if (!prop || prop->val.len !=3D (sizeof(cell_t) * 2)) {
> +		min_bus =3D max_bus =3D 0;

You can make this check dependent on the bridge check, then you
wouldn't need to handle the case of a bad bus-range property here.

> +	} else {
> +		cells =3D (cell_t *)prop->val.val;
> +		min_bus =3D fdt32_to_cpu(cells[0]);
> +		max_bus =3D fdt32_to_cpu(cells[0]);
> +	}
> +	if ((bus_num < min_bus) || (bus_num > max_bus))
> +		FAIL(c, dti, "Node %s PCI bus number %d out of range, expected (%d - %=
d)",
> +		     node->fullpath, bus_num, min_bus, max_bus);
> +}
> +WARNING(pci_device_bus_num, check_pci_device_bus_num, NULL, &reg_format);
> +
> +static void check_pci_device_reg(struct check *c, struct dt_info *dti, s=
truct node *node)
> +{
> +	struct property *prop;
> +	const char *unitname =3D get_unitname(node);
> +	char unit_addr[5];
> +	unsigned int dev, func, reg;
> +	cell_t *cells;
> +
> +	if (!node->parent || (node->parent->bus !=3D &pci_bus))
> +		return;
> +
> +	prop =3D get_property(node, "reg");
> +	if (!prop) {
> +		FAIL(c, dti, "Node %s missing PCI reg property", node->fullpath);
> +		return;
> +	}
> +
> +	cells =3D (cell_t *)prop->val.val;
> +	if (cells[1] || cells[2])
> +		FAIL(c, dti, "Node %s PCI reg config space address cells 2 and 3 must =
be 0",
> +			     node->fullpath);
> +
> +	reg =3D fdt32_to_cpu(cells[0]);
> +	dev =3D (reg & 0xf800) >> 11;
> +	func =3D (reg & 0x700) >> 8;
> +
> +	if (reg & 0xff000000)
> +		FAIL(c, dti, "Node %s PCI reg address is not configuration space",
> +			     node->fullpath);
> +	if (reg & 0x000000ff)
> +		FAIL(c, dti, "Node %s PCI reg config space address register number mus=
t be 0",
> +			     node->fullpath);
> +
> +	if (func =3D=3D 0) {
> +		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
> +		if (streq(unitname, unit_addr))
> +			return;
> +	}
> +
> +	snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
> +	if (streq(unitname, unit_addr))
> +		return;
> +
> +	FAIL(c, dti, "Node %s PCI unit address format error, expected \"%s\"",
> +	     node->fullpath, unit_addr);
> +}
> +WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);
> +
>  /*
>   * Style checks
>   */
> @@ -757,6 +889,10 @@ static struct check *check_table[] =3D {
> =20
>  	&unit_address_vs_reg,
> =20
> +	&pci_bridge,
> +	&pci_device_reg,
> +	&pci_device_bus_num,
> +
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> diff --git a/dtc.h b/dtc.h
> index 1ac2a1e3a4a5..af67eef339b0 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -136,6 +136,10 @@ struct label {
>  	struct label *next;
>  };
> =20
> +struct bus_type {
> +	const char *name;
> +};
> +
>  struct property {
>  	bool deleted;
>  	char *name;
> @@ -162,6 +166,7 @@ struct node {
>  	int addr_cells, size_cells;
> =20
>  	struct label *labels;
> +	const struct bus_type *bus;
>  };
> =20
>  #define for_each_label_withdel(l0, l) \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuNBJAAoJEGw4ysog2bOSLhUP/RVO5AeDD6DBUxpWdiW1mROP
yvdBfAmwV2WN3A8+vxTulXZODXKIFcknKQzY/Q9/b6crwNbIRTvDpw4FxlqeOXVv
iEY8Sb88WDHGAFuH53dq8PbgIgqur1QbpiVYr1Zy6Syl8LUM91/LmgxWkgzj7/1q
is+49Q//oRSibyRrBUUYNYsrNDxKrh/6iVBTAcGHsttF5FEtmaAAYNhQaZWjV18x
hBYqoQXSUWYVlAeasknb647/fHi88b+wkZ9lnCOpYx5UkTRZLjN296grN0LwenAz
IPnIlbZi90GdYTVM3fN2TRMEtRUcbQI3xd0bytCe/pcV1Ee8jnvWWtTmsUprSSii
FZsyk3L5GCJRFUzVEeDB+9UUj/XO1KXKQCxG4AO1gtK3fjsIj/KDedSzEFHX6Y16
oPXfiO6F1X263u/+nbzgJ8/c9L0Q/WFSv1T7NjQ1lg7PJGXeI6KSgpHT2aRjzS6z
olxmbBBkJdbej3I7Dex/MjMoaaoy3cMUWWGPK3qPHetiZTTylz1YTBr4Hi5mmcOj
97rgPZd4cj6cimitZGD7prgN7oZCpFYaIiORNRbcxaFFYM+j6jP8YarWfxBEfTww
zHK80tL12t6ratfqwUEKzN1FlVNuqXKNIAP2Pz5rk+9ps+r3CSibvukPR3x4f3Y3
rJ2m7gR374iTFUrtXZvH
=DBEs
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

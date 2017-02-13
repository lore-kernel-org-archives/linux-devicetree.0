From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 4/4] checks: Add bus checks for PCI buses
Date: Mon, 13 Feb 2017 16:03:55 +1100
Message-ID: <20170213050355.GZ25381@umbus>
References: <20170210164717.1234-1-robh@kernel.org>
 <20170210164717.1234-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PjJwPjbdn5RfZuWK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170210164717.1234-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--PjJwPjbdn5RfZuWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2017 at 10:47:17AM -0600, Rob Herring wrote:
> Add PCI bridge and device node checks. We identify PCI bridges with
> 'device_type =3D "pci"' as only PCI bridges should set that property. For
> bridges, check that ranges is present and #address-cells and
>=20
> For devices, the primary check is the reg property and the unit address.
> Device unit addresses are in the form DD or DD,F where DD is the
> device 0-0x1f and F is the function 0-7.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> v2:
> - Remove bus_type functions. Combine test for bus_type and bridge check
>   into single check.
> - Add a check that PCI bridge node name is pci or pcie.
>=20
>  checks.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  dtc.h    |  7 ++++++
>  2 files changed, 90 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 16d17d20caec..9ebb148f947a 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -702,6 +702,86 @@ static void check_ranges_format(struct check *c, str=
uct dt_info *dti,
>  }
>  WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
> =20
> +static const struct bus_type pci_bus =3D {
> +	.type =3D PCI_BUS_TYPE,

Since you can use the struct pointer itself as a handle on the bus
type, I don't think there's any value to having the enum-style type
value.  What _would_ be useful is a human readable bus type name.

> +};
> +
> +static void check_pci_bridge(struct check *c, struct dt_info *dti, struc=
t node *node)
> +{
> +	struct property *prop;
> +
> +	prop =3D get_property(node, "device_type");
> +	if (!prop || strcmp(prop->val.val, "pci"))
> +		return;
> +
> +	node->bus =3D &pci_bus;
> +
> +	if (strncmp(node->name, "pci", node->basenamelen) &&
> +	    strncmp(node->name, "pcie", node->basenamelen))
> +		FAIL(c, "Node %s node name is not \"pci\" or \"pcie\"",
> +			     node->fullpath);

Please use the strneq() macro - I frequently get confused about
whether strcmp()/strncmp() comparisons need an ! or not for equality
testing.  streq() / strneq() help me remember.

> +
> +	prop =3D get_property(node, "ranges");
> +	if (!prop)
> +		FAIL(c, "Node %s missing ranges for PCI bridge (or not a bridge)",
> +			     node->fullpath);
> +
> +	if (node_addr_cells(node) !=3D 3)
> +		FAIL(c, "Node %s incorrect #address-cells for PCI bridge",
> +			     node->fullpath);
> +	if (node_size_cells(node) !=3D 2)
> +		FAIL(c, "Node %s incorrect #size-cells for PCI bridge",
> +			     node->fullpath);
> +}
> +WARNING(pci_bridge, check_pci_bridge, NULL,
> +	&device_type_is_string, &addr_size_cells);
> +
> +static void check_pci_device(struct check *c, struct dt_info *dti, struc=
t node *node)
> +{
> +	struct property *prop;
> +	const char *unitname =3D get_unitname(node);
> +	char unit_addr[5];
> +	unsigned int dev, func, reg;
> +
> +	if (!node->parent || !node->parent->bus ||
> +	    (node->parent->bus->type !=3D PCI_BUS_TYPE))

You can just use node->parent->bus !=3D &pci_bus here.

> +		return;
> +
> +	prop =3D get_property(node, "reg");
> +	if (!prop)
> +		return;
> +
> +	reg =3D fdt32_to_cpu(*((cell_t *)prop->val.val));
> +
> +	dev =3D (reg & 0xf800) >> 11;
> +	func =3D (reg & 0x700) >> 8;
> +
> +	if (reg & 0xff000000)
> +		FAIL(c, "Node %s PCI reg address is not configuration space",
> +			     node->fullpath);
> +
> +	if (dev > 0x1f)
> +		FAIL(c, "Node %s PCI device number out of range",
> +			     node->fullpath);
> +	if (func > 7)
> +		FAIL(c, "Node %s PCI function number out of range",
> +		     node->fullpath);
> +
> +	if (func =3D=3D 0) {
> +		snprintf(unit_addr, sizeof(unit_addr), "%x", dev);
> +		if (!strcmp(unitname, unit_addr))
> +			return;
> +	}
> +
> +	snprintf(unit_addr, sizeof(unit_addr), "%x,%x", dev, func);
> +	if (!strcmp(unitname, unit_addr))
> +		return;

So as mentioned in my comments to 3/4, the test above, I would put
back into unit_address_vs_reg, using a callback in the bus_type which
formats a reg into the correct unit address.

> +
> +	FAIL(c, "Node %s PCI unit address format error, expected \"%s\"",
> +	     node->fullpath, unit_addr);
> +}
> +WARNING(pci_device, check_pci_device, NULL, &reg_format);
> +
>  /*
>   * Style checks
>   */
> @@ -775,6 +855,9 @@ static struct check *check_table[] =3D {
>  	&unit_address_vs_reg,
>  	&unit_address_format,
> =20
> +	&pci_bridge,
> +	&pci_device,
> +
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
> diff --git a/dtc.h b/dtc.h
> index c6f125c68ba8..c538ef4afafb 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -136,6 +136,12 @@ struct label {
>  	struct label *next;
>  };
> =20
> +#define PCI_BUS_TYPE	1
> +
> +struct bus_type {
> +	int type;
> +};
> +
>  struct property {
>  	bool deleted;
>  	char *name;
> @@ -162,6 +168,7 @@ struct node {
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

--PjJwPjbdn5RfZuWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoT44AAoJEGw4ysog2bOSqoUQAJ4HSjMoNpSxv+pmeMGDfW74
te/P/SD7LA2LJxBw4aKRvpi3XhKJmnudsNtu4GsnwC/24PkEn18L/RCUrvaXaXiy
Osbx8W3TTi2dbFuJZhWIt9voNxsHUyp5bB0AGzeEBXd1eT05YwBO3nqL5LZLoZPk
MCBJhiYVfYMwqZtjgaptQFNZqczE3o9qI9kKCoEbwbRNMZDmtCCu0ADCTYw/+CZo
QNF2v2l+v4l6izwQTsS5UKj4tEl98s6u3FfuIq7MU1Aiuh5iukwYP+D+YFghJSZj
QTTXX0XwWwv/UrX9nSXOq90d1tDOVCfiSjUiJvSV12Dtpk2B3grQpM39mrXKWY1g
Z+jgGJhpZ6nwfloBeQka3syCQW5roBaVy+8msYt3PwqWGwDgUPst5YuNBHj2SExN
L3YzbiTGf45hvGFsGMcp6XPQka6n+ryHZuuTvOarVvR5E+aV9n0GHGMf8Zayhlrf
mRTjFY9akeDeZpP+tbUnaiL3VDVgceQwtmaq7aOCIbblHQq4ezVES+JJFCZlg5eU
RtoF/yM0M7Gi8jadyArXwcHOMyCXk8EnWOQe3mxULhFfGMTkaNDrMi8C+pXG7PBh
PSYPyOWkKEj9gjBhMiSrDT2GjOFlUHepok2ynblmnOxRhjCLPopHuxFM/Qjj4yvE
SUFOCN7xOspuMSS17kY3
=00Vm
-----END PGP SIGNATURE-----

--PjJwPjbdn5RfZuWK--

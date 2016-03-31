From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 2/3] checks: Add unit-address checks for simple-bus and
 default
Date: Thu, 31 Mar 2016 16:29:12 +1100
Message-ID: <20160331052912.GE416@voom.redhat.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458780021-5052-2-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 07:40:20PM -0500, Rob Herring wrote:
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Minor nit: before doing these tests, we should probably add a check
which ensures that any bus bridge node *has* a #address-cells and
#size-cells value.

> ---
>  checks.c                                    | 87 +++++++++++++++++++++++=
++++--
>  tests/run_tests.sh                          |  4 ++
>  tests/unit-addr-leading-0s.dts              | 10 ++++
>  tests/unit-addr-leading-0x.dts              | 10 ++++
>  tests/unit-addr-simple-bus-comma.dts        | 18 ++++++
>  tests/unit-addr-simple-bus-reg-mismatch.dts | 18 ++++++
>  6 files changed, 142 insertions(+), 5 deletions(-)
>  create mode 100644 tests/unit-addr-leading-0s.dts
>  create mode 100644 tests/unit-addr-leading-0x.dts
>  create mode 100644 tests/unit-addr-simple-bus-comma.dts
>  create mode 100644 tests/unit-addr-simple-bus-reg-mismatch.dts
>=20
> diff --git a/checks.c b/checks.c
> index 48e926e..82a7f38 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -20,6 +20,11 @@
> =20
>  #include "dtc.h"
> =20
> +#define node_addr_cells(n) \
> +	(((n)->addr_cells =3D=3D -1) ? 2 : (n)->addr_cells)
> +#define node_size_cells(n) \
> +	(((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> +
>  #ifdef TRACE_CHECKS
>  #define TRACE(c, ...) \
>  	do { \
> @@ -578,12 +583,88 @@ static bool is_simple_bridge(struct node *node)
>  	return false;
>  }
> =20
> +static void default_unit_addr(struct check *c, struct node *dt, struct n=
ode *node)
> +{
> +	const char *unitname =3D get_unitname(node);
> +
> +	if (strstr(unitname, "0x") =3D=3D unitname) {
> +		FAIL(c, "Node %s unit address should not have leading \"0x\"",
> +		     node->fullpath);
> +		/* skip over 0x for next test */
> +		unitname +=3D 2;
> +	}
> +	if (unitname[0] =3D=3D '0' && isxdigit(unitname[1]))
> +		FAIL(c, "Node %s unit address should not have leading 0s",
> +		     node->fullpath);

Explicitly checking various aspects of the format seems a bit weird to
me.  Why not just generate the expected address from 'reg' and
strcmp()?

> +}
> +
> +static void simple_bus_unit_addr(struct check *c, struct node *dt, struc=
t node *node)
> +{
> +	const char *unitname =3D get_unitname(node);
> +	struct property *prop;
> +	uint64_t unitaddr, regaddr =3D 0;
> +	int n, addr_cells;
> +	cell_t *cell;
> +
> +	default_unit_addr(c, dt, node);
> +
> +	n =3D strspn(unitname, DIGITS "abcedf");
> +	if (n !=3D strlen(unitname))
> +		FAIL(c, "Node %s unit address should have only lower case hex digits",
> +		     node->fullpath);
> +
> +	unitaddr =3D strtoll(unitname, NULL, 16);
> +
> +	prop =3D get_property(node, "reg");
> +	if (!prop) {
> +		prop =3D get_property(node, "ranges");
> +		if (!prop || !prop->val.len)
> +			return;
> +
> +		cell =3D (cell_t *)prop->val.val;
> +		cell +=3D node_addr_cells(node);
> +	} else
> +		cell =3D (cell_t *)prop->val.val;
> +
> +	addr_cells =3D node_addr_cells(node->parent);
> +	while (addr_cells--)
> +		regaddr =3D (regaddr << 32) | fdt32_to_cpu(*cell++);
> +
> +	if (regaddr !=3D unitaddr)
> +		FAIL(c, "Node %s unit address does not match reg address (%zx !=3D %zx=
)",
> +		     node->fullpath, regaddr, unitaddr);

Again, parsing the unit address and comparing back to reg seems
backwards to me.

> +}
> +
>  struct bus_type simple_bus_type =3D {
>  	.expected_addr_cells =3D -1, /* For don't care */
>  	.expected_size_cells =3D -1,
>  	.is_type =3D is_simple_bridge,
> +	.check_unit_addr =3D simple_bus_unit_addr,
> +};
> +
> +struct bus_type default_bus_type =3D {
> +	.expected_addr_cells =3D -1, /* For don't care */
> +	.expected_size_cells =3D -1,
> +	.check_unit_addr =3D default_unit_addr,
>  };
> =20
> +static void check_unit_address_format(struct check *c, struct node *dt,
> +				      struct node *node)
> +{
> +	struct bus_type *bt;
> +
> +	if (!node->parent)
> +		return;
> +
> +	bt =3D node->parent->bus_type;
> +	if (!bt)
> +		bt =3D &default_bus_type;
> +
> +	if (bt->check_unit_addr)
> +		bt->check_unit_addr(c, dt, node);
> +}
> +NODE_WARNING(unit_address_format, NULL);

I'm not entirely convinced with the idea of the default unit address
checker.  I'm more inclined towards only checking when we have a known
bus type, then trying to expand those known bus types as much as we can.

>  struct bus_type *bus_types[] =3D {
>  	&pci_bus_type,
>  	&simple_bus_type,
> @@ -635,11 +716,6 @@ static void fixup_addr_size_cells(struct check *c, s=
truct node *dt,
>  WARNING(addr_size_cells, NULL, fixup_addr_size_cells, NULL, NULL,
>  	&address_cells_is_cell, &size_cells_is_cell);
> =20
> -#define node_addr_cells(n) \
> -	(((n)->addr_cells =3D=3D -1) ? 2 : (n)->addr_cells)
> -#define node_size_cells(n) \
> -	(((n)->size_cells =3D=3D -1) ? 1 : (n)->size_cells)
> -
>  static void check_reg_format(struct check *c, struct node *dt,
>  			     struct node *node)
>  {
> @@ -771,6 +847,7 @@ static struct check *check_table[] =3D {
>  	&addr_size_cells, &reg_format, &ranges_format,
> =20
>  	&unit_address_vs_reg,
> +	&unit_address_format,
> =20
>  	&avoid_default_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> index 7eb9b3d..4adc704 100755
> --- a/tests/run_tests.sh
> +++ b/tests/run_tests.sh
> @@ -447,6 +447,10 @@ dtc_tests () {
>      check_tests obsolete-chosen-interrupt-controller.dts obsolete_chosen=
_interrupt_controller
>      check_tests reg-without-unit-addr.dts unit_address_vs_reg
>      check_tests unit-addr-without-reg.dts unit_address_vs_reg
> +    check_tests unit-addr-leading-0x.dts unit_address_format
> +    check_tests unit-addr-leading-0s.dts unit_address_format
> +    check_tests unit-addr-simple-bus-comma.dts unit_address_format
> +    check_tests unit-addr-simple-bus-reg-mismatch.dts unit_address_format
>      run_sh_test dtc-checkfails.sh node_name_chars -- -I dtb -O dtb bad_n=
ode_char.dtb
>      run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_=
node_format.dtb
>      run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_p=
rop_char.dtb
> diff --git a/tests/unit-addr-leading-0s.dts b/tests/unit-addr-leading-0s.=
dts
> new file mode 100644
> index 0000000..7c8e2ce
> --- /dev/null
> +++ b/tests/unit-addr-leading-0s.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	node@001 {
> +		reg =3D <1 0>;
> +	};
> +};
> diff --git a/tests/unit-addr-leading-0x.dts b/tests/unit-addr-leading-0x.=
dts
> new file mode 100644
> index 0000000..7ed7254
> --- /dev/null
> +++ b/tests/unit-addr-leading-0x.dts
> @@ -0,0 +1,10 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	node@0x1 {
> +		reg =3D <1 0>;
> +	};
> +};
> diff --git a/tests/unit-addr-simple-bus-comma.dts b/tests/unit-addr-simpl=
e-bus-comma.dts
> new file mode 100644
> index 0000000..ea6f769
> --- /dev/null
> +++ b/tests/unit-addr-simple-bus-comma.dts
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	bus@10000000 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "simple-bus";
> +		ranges =3D <0x0 0x10000000 0x10000>;
> +
> +		node@0,1000 {
> +			reg =3D <0x1000 1>;
> +		};
> +	};
> +
> +};
> diff --git a/tests/unit-addr-simple-bus-reg-mismatch.dts b/tests/unit-add=
r-simple-bus-reg-mismatch.dts
> new file mode 100644
> index 0000000..2823377
> --- /dev/null
> +++ b/tests/unit-addr-simple-bus-reg-mismatch.dts
> @@ -0,0 +1,18 @@
> +/dts-v1/;
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	bus@10000000 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		compatible =3D "simple-bus";
> +		ranges =3D <0x0 0x10000000 0x10000>;
> +
> +		node@100 {
> +			reg =3D <0x1000 1>;
> +		};
> +	};
> +
> +};

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW/LWoAAoJEGw4ysog2bOS2J0QAKfWqo1eTd0S88KY+D36S8mQ
RY7VC8oWzPdBqDrNydSkrWridAjGIuQxgt4Af3cEPnwY0WrJ51UDLczFC5Ij9WSM
RxcdIlGDTSECwRl6jtwfwCcDcz0uJW30mHDbDnqb1uOsLJuoYirmAlqcBdGD887t
0kLi25dggv8r8DDGK9eeqzmtbP+r5ZYhUDjJcBxoWvl1ekDXYjHdJhoNT5YM1dMM
95O1+fOnRf76LrRI++0UeUB/CEUbdx5PPXkDm67k+6KSiomnVE7YvGID3V7sMhSK
TDriGcx1bh4pWmmaH8dieIVi5ibUpiiSMHycaKCJC3BSjUuiYyhfrJJ99pbZDATp
7trfyUc1rtBpILza6T11hbDEWaZ9oGbwXD6A8k4qoYB8Ps9M53LSDKd8LMsxKmXE
eONs6YFHA8atLKzrZSTTYs7z60x2NA8quV3UDHJUuhZYPHUrK5jtexVksjwDCjiX
C0xbBILt5fLsjMMDCOavJSMH7l0/RmhQCzXYKkYvazL5pdU9BKG+Z+/4a7qGwKZE
lyMwR3HQ9IgW6fVxh81ZYW87k//1MkaYopxx1n8iASpLxSdnCcKtX4aqcs6bYEjh
PgLY6+h3pK+hGplVt5Cl9jYYpySFLBfPd/NGatMU2NK+YfeVKeSctxW0917uFqX7
n1zfDEzjd5/lAfPK1awn
=H8AA
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--

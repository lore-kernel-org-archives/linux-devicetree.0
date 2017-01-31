From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] checks: Add Warning for stricter property name
 character checking
Date: Tue, 31 Jan 2017 11:32:13 +1100
Message-ID: <20170131003213.GE14879@umbus.fritz.box>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124174534.3865-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 11:45:30AM -0600, Rob Herring wrote:
> While '?', '.', '+', '*', and '_' are considered valid characters their
> use is discouraged in recommended practices. '#' is also only
> recommended to be used at the beginning of property names.

Hrm.  I'm not totally convinced about this.  PAPR definitely specifies
a few properties that include '#' not at the beginning.  I'm not sure
that IEEE1275 doesn't as well (it's not exactly easy to grep for a
single character).

I'm not sure about '?' either.  I didn't positively identify any
properties including it, but there are certainly OF configuration
variables specified by PAPR including '?', and I think those will be
exposed in the device tree as properties.

I'm not 100% sure about '*' either, I have a vague memory of some spec
that requires it, but I'm not certain.

AFAIK, excluding '.', '+' and '_' should be ok, except for device_type
which you already have special exception for.

> Testing this found one typo error with '.' used instead of ','. The
> rest of the warnings were all from underscores.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 3d18e45374c8..a0d4a9d968d7 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -239,6 +239,7 @@ ERROR(duplicate_property_names, check_duplicate_prope=
rty_names, NULL);
>  #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
>  #define DIGITS		"0123456789"
>  #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
> +#define PROPNODECHARSSTRICT	LOWERCASE UPPERCASE DIGITS ",-"
> =20
>  static void check_node_name_chars(struct check *c, struct dt_info *dti,
>  				  struct node *node)
> @@ -299,6 +300,38 @@ static void check_property_name_chars(struct check *=
c, struct dt_info *dti,
>  }
>  ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
> =20
> +static void check_property_name_chars_strict(struct check *c,
> +					     struct dt_info *dti,
> +					     struct node *node)
> +{
> +	struct property *prop;
> +
> +	for_each_property(node, prop) {
> +		const char *name =3D prop->name;
> +		int n =3D strspn(name, c->data);
> +
> +		if (n =3D=3D strlen(prop->name))
> +			continue;
> +
> +		/* Certain names are whitelisted */
> +		if (strcmp(name, "device_type") =3D=3D 0)
> +			continue;
> +
> +		/*
> +		 * # is only allowed at the beginning of property names not counting
> +		 * the vendor prefix.
> +		 */
> +		if (name[n] =3D=3D '#' && ((n =3D=3D 0) || (name[n-1] =3D=3D ','))) {
> +			name +=3D n + 1;
> +			n =3D strspn(name, c->data);
> +		}
> +		if (n < strlen(name))
> +			FAIL(c, "Character '%c' not recommended in property name \"%s\", node=
 %s",
> +			     name[n], prop->name, node->fullpath);
> +	}
> +}
> +WARNING(property_name_chars_strict, check_property_name_chars_strict, PR=
OPNODECHARSSTRICT);
> +
>  #define DESCLABEL_FMT	"%s%s%s%s%s"
>  #define DESCLABEL_ARGS(node,prop,mark)		\
>  	((mark) ? "value of " : ""),		\
> @@ -703,6 +736,8 @@ static struct check *check_table[] =3D {
>  	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
>  	&device_type_is_string, &model_is_string, &status_is_string,
> =20
> +	&property_name_chars_strict,
> +
>  	&addr_size_cells, &reg_format, &ranges_format,
> =20
>  	&unit_address_vs_reg,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYj9sNAAoJEGw4ysog2bOSS2IQAJxB1I1fu9tm4F2OArFDO/Ps
i9zoL1seZKuAUKZSof0FGfXXR0z6tBvFhG5N9Wl0yYizT/kW2MyuzltufhaydVpV
eUnbDleIojsraruhrYmMWE/0CdHKSOIZr9axCwAl8eVwsA++B90Wa0bEac79LWQj
WehLpm/4gdIcNaq0Z2LUSUCRSbGMMAKmiOEnQknS8cyJPXRa9UR7m8XrZq+uVbL5
FvzBuAZh9JtooWTXUCOuZMcpFp2tSCDt1ITrqWNDBt2kIxQbHOX4TpMo4rIhAJ5y
E/RBhNmts8aX7Gxq96VYV0pAAwt6pno+YtcdYft/wq4FLRHS+s37bVxfg9QN3YH7
q7bQGV5W8+PYjWhJNyeGekO3EYVh1mph/PaHWhQa+MnnLyO8JO5TYNcRCzJOBwRF
ZEyW9UWMUfyfOZX228crwSs+DVY+WSvDMUeZSgDbyiRGcI5jcIBDe22m3wX7MFLB
cuq/FVCtX8LVZby90qs9AnSxVBVzL64VlLQ828c9vwVdSusKqyo8O4+Pcz6o/2U/
EI5Gsw5fjiSWXCeAR/pW587wngPmJAWgLvMSp4h9Btpubsx8KNJKNZvJxjjH/oxR
mse/D2Qeh2K6ft87PTyOR4Zh6S1ZB7qoMxF0U1QlnNajyhwNNY/xsy0O/snpSF8v
MRpCIsHgTWD87e3iJPZY
=A8fX
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

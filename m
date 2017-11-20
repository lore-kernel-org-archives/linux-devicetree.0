From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 5/5] checks: add aliases node checks
Date: Mon, 20 Nov 2017 11:24:29 +1100
Message-ID: <20171120002429.GK19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hTKW8p8tUZ/8vLMe"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171117144515.10870-6-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hTKW8p8tUZ/8vLMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 08:45:15AM -0600, Rob Herring wrote:
> Add checks for aliases node that properties are a valid path and that the
> alias property names are a known, standard name.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

The check for valid paths is definitely good.  I'm not convinced by
the restrictive list of alias names though.

It's true that in trees originating from dts files, aliases don't have
a lot of purpose, but in trees from real OF that's not so.  It's
pretty reasonable for those to define arbitrary aliases for user
convenience - and the names here aren't even the common ones for that
purpose: those are "net", "disk" and "cd" so you can do things like
"boot disk" from the user interface without having to enter a hideous
path giving PCI and SCSI addresses.

> ---
>  checks.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index a785b81bea07..2c5b6c2eacb3 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -637,6 +637,48 @@ static void check_names_is_string_list(struct check =
*c, struct dt_info *dti,
>  }
>  WARNING(names_is_string_list, check_names_is_string_list, NULL);
> =20
> +static void check_alias_paths(struct check *c, struct dt_info *dti,
> +				    struct node *node)
> +{
> +	struct property *prop;
> +
> +	if (!streq(node->name, "aliases"))
> +		return;
> +
> +	for_each_property(node, prop) {
> +		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))
> +			FAIL(c, dti, "aliases property '%s' is not a valid node (%s)",
> +			     prop->name, prop->val.val);
> +	}
> +}
> +WARNING(alias_paths, check_alias_paths, NULL);
> +
> +static void check_known_aliases(struct check *c, struct dt_info *dti,
> +				    struct node *node)
> +{
> +	int i;
> +	struct property *prop;
> +	static char *aliases_strings[] =3D {
> +		"ethernet", "gpio", "i2c", "rtc", "serial", "spi"
> +	};
> +
> +	if (!streq(node->name, "aliases"))
> +		return;
> +
> +	for_each_property(node, prop) {
> +		for (i =3D 0; i < ARRAY_SIZE(aliases_strings); i++) {
> +			if (strstarts(prop->name, aliases_strings[i]))
> +				break;
> +		}
> +
> +		if (i =3D=3D ARRAY_SIZE(aliases_strings)) {
> +			FAIL(c, dti, "unknown alias name %s", prop->name);
> +			continue;
> +		}
> +	}
> +}
> +WARNING(known_aliases, check_known_aliases, NULL);
> +
>  static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
>  				  struct node *node)
>  {
> @@ -1355,6 +1397,8 @@ static struct check *check_table[] =3D {
>  	&gpios_property,
>  	&interrupts_property,
> =20
> +	&known_aliases,	&alias_paths,
> +
>  	&always_fail,
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hTKW8p8tUZ/8vLMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSIL0ACgkQbDjKyiDZ
s5I/aA//Yl10BHte+tNls3uXfVbc0cj3mxKXUQQVwYK1plOe1+EsZQs9xiuhIaj2
7wNa4Okg1MauIbWRYzEEqdOI/BRivtBeNz8gxw8BGvujS6QL332B88C9cWW3xhGm
+za6hIRQyrY/2PWs/3ZNa2wJGT8Yv1HxwS0EiR1MrUoD1xlnAdX0gLOj7wPuRPbn
tWc9wh6ReqGqdSHHJLpd53s+Z6EqbEfvrsNI938BSM4gk4u29MJwh19sief1XFa6
d8RcewuthwTJS4wfTm36QTGLpV/pU0DckuLt2f9g7PYrYCK7zqyoOtkaemyK46Eu
QhtsS8B1tA9BrVJwEekUX7UzO50wOl0zXMrT66uEYD4X2bD6zSE1J6seMUaZPWJk
3u9z3rOYvf2fcguplNElXHqBBzAJYC8uiVgGOF1mE9+6DBmb/mrvV1PwFowebLTv
qv+QJOneXjv/i5GIkTw9SSknkcZRbiXQjHROpjzfYyaj37l8pBa22U7c55kTVhVl
HxaohxByTK3VCDt7SxLvRfjTALUto0tORGcr6EGeVTC+UtI6V4Vlc9VnhKGp/m0G
rtSEBYMFrlIjIKqcpc8cxHzjJEUudixEIBmUJOWyC29cLt3QlfhxRkJlx/Idv5lD
unOsSrt0iYx/92wfrxH9N/roS5/QBYd5Rn5YYzgAHALqnVuqq68=
=nUZF
-----END PGP SIGNATURE-----

--hTKW8p8tUZ/8vLMe--

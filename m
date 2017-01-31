From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/5] checks: Add Warning for stricter node name character
 checking
Date: Tue, 31 Jan 2017 14:14:34 +1100
Message-ID: <20170131031434.GK14879@umbus.fritz.box>
References: <20170124174534.3865-1-robh@kernel.org>
 <20170124174534.3865-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124174534.3865-3-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 11:45:31AM -0600, Rob Herring wrote:
> While '#', '?', '.', '+', '*', and '_' are considered valid characters,
> their use is discouraged in recommended practices.
>=20
> Testing this found a few cases of '.'. The majority of the warnings were
> all from underscores.

Hmm.  The Opal firmware on POWER8 machines uses both '.' and '#' in
node names in some places.  So I'm not terribly convinced this is a
good idea.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index a0d4a9d968d7..0c78d69316bc 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -252,6 +252,17 @@ static void check_node_name_chars(struct check *c, s=
truct dt_info *dti,
>  }
>  ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
> =20
> +static void check_node_name_chars_strict(struct check *c, struct dt_info=
 *dti,
> +					 struct node *node)
> +{
> +	int n =3D strspn(node->name, c->data);
> +
> +	if (n < node->basenamelen)
> +		FAIL(c, "Character '%c' not recommended in node %s",
> +		     node->name[n], node->fullpath);
> +}
> +WARNING(node_name_chars_strict, check_node_name_chars_strict, PROPNODECH=
ARSSTRICT);
> +
>  static void check_node_name_format(struct check *c, struct dt_info *dti,
>  				   struct node *node)
>  {
> @@ -737,6 +748,7 @@ static struct check *check_table[] =3D {
>  	&device_type_is_string, &model_is_string, &status_is_string,
> =20
>  	&property_name_chars_strict,
> +	&node_name_chars_strict,
> =20
>  	&addr_size_cells, &reg_format, &ranges_format,
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYkAEYAAoJEGw4ysog2bOSieMQAOJSeDkb2ssfiUoH3CXdqSid
nc5sTNFGEFrZbdGlt+Pvbjs5MA2j2XVGci8PuUKAt0kiaD9k70Id8GYwKgxTV4SL
rsbmWl/Lj5vjDaehk1scnqv7MsueQ3nbbB7tLNIF7ajXpfa9u2lTt2h1YZuV1Oht
0QhO9qHCkAk/kzKvRkx2JobZy7ev64BFB7EOFjtl/9U5/nhaPiTkAOClehcMiwgh
1/oqeIyEB49xjVROo+0TiW1nvfX9xwzA1oTgdsvTbD+EZ2pNG1JBZjCbPxBrsPMJ
tY9zGfIwDVtM+Vk6PRL2Wv4+jwWmmAG0x4EquDHEiR8lJ2xfPZS5KtE9484tygQV
Nrf4k0mIo0xQcGg8drXRA9pgAKFunnplIZ456gnICGwbKbchv/xi0X5bqEcppVFj
Zc/X/leWiiSfDrLh90QK/nvMpA51auUeU3fjD2uwWMgQigz4jPRecEjNsS4G+ST3
4EhdrYdWzvikWthEcyFPXE40xYJB++KZ6bJpNr/bYltSCr9JfbtR6CiVGXsRFgsl
4FujqBbrrKQe/FLOmwww48VSMJAAUly6m6RBwDL7puS+0RCsnB/zNskDrgDB3QHI
qlNuqbuTDaYAA9wh1DAyvDWqkRuqgURMlSpwNY1eB9poG2/tIvNcStx++sJEL9nA
FDCAb11bOaZ31ChaCFyn
=ENVO
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--

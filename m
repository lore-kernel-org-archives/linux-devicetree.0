From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 4/5] checks: check for #{size,address}-cells without
 child nodes
Date: Mon, 20 Nov 2017 11:14:38 +1100
Message-ID: <20171120001438.GJ19214@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VSVNCtZB1QZ8vhj+"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171117144515.10870-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--VSVNCtZB1QZ8vhj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2017 at 08:45:14AM -0600, Rob Herring wrote:
> nodes with a 'reg' property nor a ranges property.
>=20
> An exception may be an overlay that adds nodes, but this case would
> need

Sentence doesn't seem finished..

In any case, I'm not sure this is a good idea.  It's not uncommon to
have bus bridge nodes that ought to have a well defined #address and
#size cells, but just don't happen to have any plugged devices yet.
An overlay that adds nodes is one possibility, but a bus where the
children can be probed is another.

The check for 'ranges' will get some of those cases, but a bus bridge
which doesn't directly map the child address space into the parents
(e.g. indirect access) is perfectly legitimate still.

>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 346b0256f9cb..a785b81bea07 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -982,6 +982,31 @@ static void check_avoid_default_addr_size(struct che=
ck *c, struct dt_info *dti,
>  WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
>  	&addr_size_cells);
> =20
> +static void check_avoid_unecessary_addr_size(struct check *c, struct dt_=
info *dti,
> +					     struct node *node)
> +{
> +	struct property *prop;
> +	struct node *child;
> +	bool has_reg =3D false;
> +
> +	if (!node->parent || node->addr_cells < 0 || node->size_cells < 0)
> +		return;
> +
> +	if (get_property(node, "ranges") || !node->children)
> +		return;
> +
> +	for_each_child(node, child) {
> +		prop =3D get_property(child, "reg");
> +		if (prop)
> +			has_reg =3D true;
> +	}
> +
> +	if (!has_reg)
> +		FAIL(c, dti, "unnecessary #address-cells/#size-cells without \"ranges\=
" or child \"reg\" property in %s",
> +		     node->fullpath);
> +}
> +WARNING(avoid_unecessary_addr_size, check_avoid_unecessary_addr_size, NU=
LL, &avoid_default_addr_size);
> +
>  static void check_obsolete_chosen_interrupt_controller(struct check *c,
>  						       struct dt_info *dti,
>  						       struct node *node)
> @@ -1306,6 +1331,7 @@ static struct check *check_table[] =3D {
>  	&simple_bus_reg,
> =20
>  	&avoid_default_addr_size,
> +	&avoid_unecessary_addr_size,
>  	&obsolete_chosen_interrupt_controller,
> =20
>  	&clocks_property,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VSVNCtZB1QZ8vhj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloSHm4ACgkQbDjKyiDZ
s5JC1BAAuWM/46F8fEXvi+K2F7D2jPCNEcMtTdG9yvumlTUioBqk412syhYSFepy
+EiWSyYoafb9r/8tUKQzDs4MrgpmBQKNlz78rZ7g3lh/x5piIuszP88Gvs90TzI7
cZ2gRjIGMqJdfBkqfDq6Ws1C/EY0iw6FKUw1OE510jiM4Vu4RjUSAig771j8YOwh
ttXGJ0tguR6M+IZSpUZTfYsRaAjvhqKAWgkzDt+6imOaHf6Y2HXjkf4KoVcSTd4F
Z0257VZbew+8p+WqniMLLbKqcgZaGpOQe3itHHOJ3b9aciJQdrn4IQRS05VMl/J8
TsziJVUDJ/pu9RbY9b348eXxQrnwEAuZYSNdQbJoY7AaeHOQbz2E/drcIsbsrd9m
u1iSvElg62r3yy6zM3kFyXH4sQ5Kg3CTS+zbfuDkKc63RJNA9GNe5JAfcSlIpmcx
zlnFksm2xTNKHDeE8+pYHR2iKZSfxAHK0BSbUQBuhd9swbeQG36ep1mxnLeQUiTq
BJs26Fs2n8+Y66zmqv+jXrFqdevd7rSNwSuNyT4EsxawbhTrDgWft+n35p0fb4Lm
lmRbdmUn4bBbeVGw4qbz/d+wG7w3101bt/XjCdlGdQTGWPAYUHchG/eu6Ao2aQ9x
uHvGqeQs6gtoOEICsnWXA6vnd1bogQzjXmNXaSQXgR/KUbRtRpg=
=w50M
-----END PGP SIGNATURE-----

--VSVNCtZB1QZ8vhj+--

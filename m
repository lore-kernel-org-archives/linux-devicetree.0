From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] livetree: avoid assertion of orphan phandles with
 overlays
Date: Fri, 27 Oct 2017 16:33:05 +0200
Message-ID: <20171027143305.GE7115@umbus>
References: <1508854458-9937-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508854458-9937-1-git-send-email-t-kristo-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Cc: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2017 at 05:14:18PM +0300, Tero Kristo wrote:
> Right now, check_interrupts_property fails with overlays, as the phandle
> for the interrupt-parent can be orphan. Avoid this by allowing the orphan
> node to pass the assert check.
>=20
> The process_checks() call is also moved later during init sequence,
> so that we can use the global variable generate_fixups to check if
> we are compiling an overlay.
>=20
> Signed-off-by: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>

Applied, with a bit of a tweak.

> ---
>  dtc.c      | 3 ++-
>  livetree.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/dtc.c b/dtc.c
> index 5ed873c..a0f4603 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -319,13 +319,14 @@ int main(int argc, char *argv[])
>  		dti->boot_cpuid_phys =3D cmdline_boot_cpuid;
> =20
>  	fill_fullpaths(dti->dt, "");
> -	process_checks(force, dti);
> =20
>  	/* on a plugin, generate by default */
>  	if (dti->dtsflags & DTSF_PLUGIN) {
>  		generate_fixups =3D 1;
>  	}
> =20
> +	process_checks(force, dti);
> +
>  	if (auto_label_aliases)
>  		generate_label_tree(dti, "aliases", false);
> =20
> diff --git a/livetree.c b/livetree.c
> index 6846ad2..d6a7681 100644
> --- a/livetree.c
> +++ b/livetree.c
> @@ -540,7 +540,7 @@ struct node *get_node_by_phandle(struct node *tree, c=
ell_t phandle)
>  {
>  	struct node *child, *node;
> =20
> -	assert((phandle !=3D 0) && (phandle !=3D -1));
> +	assert((phandle !=3D 0 && (phandle !=3D -1 || generate_fixups =3D=3D 1)=
));
> =20
>  	if (tree->phandle =3D=3D phandle) {
>  		if (tree->deleted)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnzQ58ACgkQbDjKyiDZ
s5LZVxAA4uBJCXhyOB7atAcDwrwdGNTM6FwnzS+vIbDdFtZP3XSuhXvnjWV3IX3C
FxIakIT+/boSXOXH0tabg2f7RSbXHXgKbyzJaQ6Y8qHsOZJ9pHrgaKkdJQx3cSaX
aDHKycd0IYF3CJ5p3TDCubF6ZvmnLrgRJDGTD4RUoYL/82JB5uABE3azol5vxImw
avsgFDZa/SyAVM81tn3Ny4pVcUmagZHTs78LZeSBk72/KAur2j0svnh7IJ1upIK2
swCRqhlWfHULbpHoG0W8HYxBWguHTkSb7RWPw6WBoGwJUEX5/sJCHfBfwAeVIvOr
k/zObv4f/PfPk/p0VhlXnXjpd6FdRgtg+Vy43nOw/+SKvZwyZ2YABMXKdngzEZYV
u3vVe7jBKL1lj+b1W1fGrJqQm5ySYDM9kZgy5k/7kXPbtbk76F2eZRAe/YQ7cris
ydurea5fKdKr1BBo9c83mFR4iRtX4v9IkKNWIwdfz2vO2dfUKycxdduwza4vb6Dj
gYBTJwonWMdPNr9f/BpPLewvVZUN/0a212r1DApCx6z6Hbd51SzEZwGKcMmhwpUU
NDQ21Ot5l1+EARgrkzFg1Ozbgyu1g74RbgYGXlB4OZO7V6KKQUwuCzmJF8tr3z7N
ovDY+Y++Zvudf7AFyfPZx5wUn0FWIAD4xtrNV/TZ4V65VyD5iOw=
=8oY3
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

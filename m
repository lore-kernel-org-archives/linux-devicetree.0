From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 3/3] checks: Add unit-address checks for PCI buses
Date: Thu, 31 Mar 2016 16:32:20 +1100
Message-ID: <20160331053220.GF416@voom.redhat.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-3-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0hHDr/TIsw4o3iPK"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458780021-5052-3-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 07:40:21PM -0500, Rob Herring wrote:
> PCI device unit addresses are in the form DD or DD,F where DD is the
> device 0-0x1f and F is the function 0-7. Add checks that the unit
> address matches this form.

Hmm.. we ought to be able to do a bit better than this, again by
constructing the expected unit address from reg.  While we're at it,
it probably makes sense to have that dependent on a check which makes
sure the first entry in a pci device's 'reg' is the config address.

Hmm.. I wonder if what might make sense is to have two whole
(possible) sublists of tests within the bus_type structure - one, a
list of checks to apply to bridge nodes and the other a list of checks
to apply to bus device nodes.

> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  checks.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/checks.c b/checks.c
> index 82a7f38..1d0fcfb 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -549,10 +549,30 @@ static bool is_pci_bridge(struct node *node)
>  	return false;
>  }
> =20
> +static void pci_unit_addr(struct check *c, struct node *dt, struct node =
*node)
> +{
> +	const char *unitname =3D get_unitname(node);
> +	unsigned int dev, func;
> +	int ret;
> +
> +	ret =3D sscanf(unitname, "%2x,%1x", &dev, &func);
> +	if (ret >=3D 1) {
> +		if (dev > 0x1f)
> +			FAIL(c, "Node %s PCI device number out of range",
> +			     node->fullpath);
> +	}
> +	if (ret =3D=3D 2) {
> +		if (func > 7)
> +			FAIL(c, "Node %s PCI function number out of range",
> +			     node->fullpath);
> +	}
> +}
> +
>  struct bus_type pci_bus_type =3D {
>          .expected_addr_cells =3D 3,
>          .expected_size_cells =3D 2,
>          .is_type =3D is_pci_bridge,
> +        .check_unit_addr =3D pci_unit_addr,
>  };
> =20
>  static bool is_simple_bridge(struct node *node)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW/LZkAAoJEGw4ysog2bOS+80P/Rwbt6KYhlnVFhyJMtJwePEa
d9fqaq+FcmmiLD1raa3bYNshw8fjCZLWQxXQYiH6iDgAYikNKTGl63Zoa1XpJ1WR
kw320UHxjE7GWK5U/wzz7nI8XquTu7YjnNCJ49om/lWDt9IwtwkGKCKZTySS5J6b
onJF0ktZklUScSr9h/Spq9oTgMPCy+mAj4sZwGUsE/fUw3st7X24o2crH5r4yJ7N
xkQgQVgP416Uekjxo1jLIdzSOi/12/imkSro9L4veX+kYbyFjI5cK+ylBH9UsXMe
SSaWMUZLvaFUCY9JUOEwnA2WM5M8VzIdTIYeO7y/kSagVsrQ+dIvpLI5zjS6jDEA
Yuir87EHlSD3eW5J9Q6bhx17F47WBYOmdzQ904Kbj68IvHX6jcHj+oOd4FPIcgOb
7hbIKbOU5Y8mb3miBgPVr0nuXqGEYiEQGrtnRP5h3JFNZYd1VKS7pg/Zij4qf6Do
4K/scIDqI4fHbiWUJgHGSCnG4c9Qs2p6xUG9ZTnyqbrnTjXFkU99oFVSJNrhdKhY
RJMdxoH/pZmmQwwQJeWKUAZr4PqMXXaAbGrv86r67d2T/Cu/mTq38HHyJCcYBlOW
izOpXZPIXhBM3WCqqXLoc3Dm/lDGu77kx07OKfByMa3eEQ64MzaFcnwVVBWOFF+K
ChUkCRau+dPZGh5dR2xC
=Kwnp
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--

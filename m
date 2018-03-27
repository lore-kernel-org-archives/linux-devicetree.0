Return-Path: <SRS0=NL1J=GR=vger.kernel.org=devicetree-compiler-owner@kernel.org>
Date: Wed, 28 Mar 2018 10:13:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH dtc] checks: Print duplicate node name instead of parent
 name
Message-ID: <20180327231330.GA3510@umbus.fritz.box>
References: <1522152811-28022-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
In-Reply-To: <1522152811-28022-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-compiler-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jon Loeliger <jdl@jdl.com>, devicetree-compiler@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2018 at 02:13:31PM +0200, Geert Uytterhoeven wrote:
> When refactoring node path printing, the code checking for duplicate
> node names was accidentally changed to print the name of the parent
> node, instead of the name of the duplicated child node.
>=20
> Fixes: 88960e3989073207 ("checks: centralize printing of node path in che=
ck_msg")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

> ---
> Also applies to Linux' scripts/dtc/checks.c.
> ---
>  checks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/checks.c b/checks.c
> index 1e6a88c81a998415..e6a38a87cc7d9aac 100644
> --- a/checks.c
> +++ b/checks.c
> @@ -255,7 +255,7 @@ static void check_duplicate_node_names(struct check *=
c, struct dt_info *dti,
>  		     child2;
>  		     child2 =3D child2->next_sibling)
>  			if (streq(child->name, child2->name))
> -				FAIL(c, dti, node, "Duplicate node name");
> +				FAIL(c, dti, child2, "Duplicate node name");
>  }
>  ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlq60BgACgkQbDjKyiDZ
s5LkuRAAlHFG2qOG5SrE0BkfyC8R4zJJygG9Ij6DKMGi5MaRw74ezFKTqE6YsoSi
VAo25bdIZrHm3tcPQCC224akuVvn7/iDgTrtJAA9urRLwoqIE///vuZ4H4cDfAEz
9gI4viY7Du5CJe4TQQKve9jhK2FyOxkUuJ9uzvtx7jMEQ1eCG3X8bqlWyFDhtO04
4AZ+OPIRXeYprD/1ePcUMdhcpOKo9CyhFx0ySgCIR2+G8pnRpnWdpdrmrlZUDDVy
pqjCm4lLKccFYC3sgNoQE5hATwF/W4iFyppys8QkQa107U5TTnKnmsua7Chx0Myx
iOhcpcSwzvbL/UHFjqzM00xwOJCjs3X0nR03C3Y3vqsKkHfaoGsz8jeTaWJVeOKO
8F5J5rQfAQVld6YIMSMUgZx0BiRYXFPYSFxvv2xNSbRduSBb2ZEG+xTqdLcBqqIq
gtnZauhbLhASPjGU5ScKzRGl6kVKajQpgydfn8OI2Rg5d3nJn+/wlgKY32L4xEOc
i46x1j6XkwNvspOejeC2M+toQQcIYSlZUzxe8wDVbfmohWwN8b7E9NCutzJcGHNF
DI1kEw5IboD0uG7CB1dmX0jUtuCEE8YWW/vCaGg7Jns0KyyefiBkTMgIoxIFNQAD
nCzxhE/r9haIi/FxBZmE9J18TaHNSEYhjQdexmYsJofQkqjv0u4=
=Xhkb
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

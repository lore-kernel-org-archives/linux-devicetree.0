From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] manual: Document missing options
Date: Wed, 14 Jun 2017 23:04:59 +0800
Message-ID: <20170614150459.GD2614@umbus>
References: <1497451827-15219-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497451827-15219-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:50:27PM +0300, Pantelis Antoniou wrote:
> The -d and -s options were undocumented. Add an entry in the manual.
>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Applied, thanks.

> ---
>  Documentation/manual.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 2f07350..d4e99e3 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -674,4 +674,8 @@ The fdtdump program prints a readable version of a fl=
at device tree file.
> =20
>  The syntax of the fdtdump command line is:
> =20
> -    fdtdump <DTB-file-name>
> +    fdtdump [options] <DTB-file-name>
> +
> +Where options are:
> +    -d,--debug          Dump debug information while decoding the file
> +    -s,--scan           Scan for an embedded fdt in given file

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZQVCYAAoJEGw4ysog2bOS4lEQAOXu+tCZjIPk+BdRheG8TKRw
CyY+R7suL+3nYNHCd1JLXGh7xJh+SR2WAwuwCr/wV3eBQwZrPIZggIN1K0GYX5RX
9VsE+phzIlxY+00j/6B7klVIJiPdG+H/B+sWmwt5LyBj4lu981YKaz8GjUBwgYZ9
gkH8pxJ2R3hn413z8P200aBNPh59fThr/qEGPlZeMxbS/P5OeNlcpR40g95jABQQ
5V9Omhd6KdbyKtaDg3M7lsvH3bitfXTSVgOP8XT/Bbo1qo2JNog6Cv694Rng20da
xCAaUp6g35vwXr0Gk1QwPXeNdfesQ0WL6gZYts8G29wZOcOLg4u8xn1FOEfUinT2
4hvI9D0iPr/1p2EKcYeVXiqoEMF9Dtyzjl5MycFO9A43SDazwaj121qF8xTR7d8u
IsJd7ENoC8DuiH9NyemOMwchrMEa6Mbe09k9XLJligeTNueSDPqtZmQRIBvLphjs
mTNd38RcWLYbpJicJMfckt+15ITq6gzOogZhYGQarggYU1LsWGAW8VlyUIMMSyVg
6BP+i4Gkj4epEfApVdwE4mmrI4j3iOxXCvcZ8NRx9QsIf52hJrcnELwaStRoe1j9
csSMlndH4BqXBMv/VrmW33JZT/lCI8EwX1oJmh/MIejuFKwGo+AXLCRcgz9f3RR+
n8bHa9XC7CRzG4FzR2W1
=Dns0
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--

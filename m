Return-Path: <SRS0=8Nua=OQ=vger.kernel.org=devicetree-compiler-owner@kernel.org>
Date: Fri, 7 Dec 2018 12:35:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: phandles using absolute paths in DT overlays
Message-ID: <20181207013513.GV768@umbus.fritz.box>
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6qFdnjy6dKaiDX/E"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
Sender: devicetree-compiler-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--6qFdnjy6dKaiDX/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
> Hi,
>=20
> Some early revisions of SoCs may have hardware bugs that need to be
> fixed up in DT.  Currently we are handling this by including DTS files
> and fixing up nodes and properties, to create different DTB files for
> different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
>=20
> As an alternative, I'm envisioning the use of DT overlays and the
> fdtoverlay tool, in the hope of simplifying the generation of DTBs for
> the various SoC/board combinations.
>=20
> Ideally, such DTBs would not contain symbols, to avoid inflating DTB
> size.  Hence if fixup overlays would not contain symbolic references,
> there would be no need for symbols.
>=20
> For anchors, the "&{/path/to/node@address}" syntax is working fine.
> For phandles, while documented on
> https://elinux.org/Device_Tree_Mysteries, and while working fine for the
> non-overlay case, dtc seems to have issues interpreting the DTB:
>=20
>     $ scripts/dtc/dtc -I dtb -O dts my.dtb  | less
>     <stdout>: ERROR (property_name_chars):
> /__fixups__:/path/to/node@deadbeef: Bad     character '/' in property
> name
>     ERROR: Input tree has errors, aborting (use -f to force output)
>=20
> With -f, the fixup generated seems to contain the expected value, though:
>=20
>     __fixups__ {
>         /path/to/node@deadbeef =3D "/fragment@0/__overlay__:power-domains=
:0";
>     };
>=20
> When using ftdoverlay, the situation is worse:
>=20
>     Failed to apply my.dtb (-1)
>=20
> Are these known issues?

Unfortunately, this can't work with the current overlay format.  We
have a specific syntax to allow the target of an overlay fragment to
specified as a path, but phandle references by path won't work.

The problem is that the encoding of the fixups node has the fixup
target as a property name, and as the error says '/' is an illegal
character in property names - for a bunch of good reasons, so we can't
just go and remove that restriction.

So to allow this we'd need to come up with a different encoding for
path-targeted fixups and add support for it in the various pieces of
the chain.

One way to do that would be to entirely rework the overlay format to
something more sensible, which would have a number of other benefits.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6qFdnjy6dKaiDX/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwJzk8ACgkQbDjKyiDZ
s5KDYw//W2uWy1hJ1NPKzvWkXETUMnlGXo7C1S7dIFUwm+zE9KFYK+WUlLSf9fOA
yQxGZ5YxK5zMwojIAujsXvbgbp8JEHzZSW+TdVju1M/p2rIEsGsQKzeUwaPhZiL4
rdIcouYPOWQdWTZkH6m1nvUF/xt38CMa9uK1W0s1+xqhX47KX3detaFh8uLheIxE
RmzCOd6o2iFQ5SBbCDXJVWxmzye4Du6OvMuV0q4BL5j9pyf3zhjRuqV9U9RPgS2j
vjZEpbn8sKw92gyv1QEfRm7HbYVf4uOUgU7igDn1yXe37gD065fUA+y4OCishfOH
E80Pjld76XCPr65F+Dvq2axEQvbwhcnMjax1pJ0nonw3McN5io38KldgbTOoD/2U
VYIudRRQ8qNVBOEj0eBxE0/E3zS+/iPtPd9kca5+RXe8/8IScvmR83I5CUMXHtPL
JA3ZeRcU5MLylUedxcMlZMJe4zOqJIHuyprQQwvRK2ZxD//Bg0NNrEUq9JGPAqY3
oS+eaQUK14SifSgRuEQFldkFBPrtuGoQgKTvhbYbSzVHHep7Ow57yXbI8anpb0ey
rmOW3+UGkqV13aXKXWYCWwMl4at19Lo4kBVJyzlNPtLaio+CsFKf/Ng5x3USDe6w
Xc0wQptNIVyPr/+r8KydmnDC0iFm0vYUcu6YuRBPbZGK/E7/CpU=
=JZ8+
-----END PGP SIGNATURE-----

--6qFdnjy6dKaiDX/E--

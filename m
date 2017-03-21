From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v4 1/3] checks: Add bus checks for PCI buses
Date: Tue, 21 Mar 2017 14:46:48 +1100
Message-ID: <20170321034648.GB13932@umbus.fritz.box>
References: <20170320144418.5021-1-robh@kernel.org>
 <20170320144418.5021-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170320144418.5021-2-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2017 at 09:44:16AM -0500, Rob Herring wrote:
> Add PCI bridge and device node checks. We identify PCI bridges with
> 'device_type =3D "pci"' as only PCI bridges should set that property. For
> bridges, check that node name is pci or pcie, ranges and bus-range are
> present, and #address-cells and #size-cells are correct.
>=20
> For devices, check the reg property fields are correct for the first
> element (the config address). Check that the unit address is formatted
> corectly based on the reg property. Device unit addresses are in the
> form DD or DD,F where DD is the device 0-0x1f and F is the function 0-7.
> Also, check that the bus number is within the expected range defined by
> bridge's bus-ranges.
>=20
> Reviewed-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, with a small change..

[snip]
> +WARNING(pci_device_reg, check_pci_device_reg, NULL, &reg_format);

=2E.adding pci_bridge to the dependency list here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY0KImAAoJEGw4ysog2bOSPhwQAMdYwOed/D/b6yJwUb5peZPf
SRekLQ1r3gAoNuU3p6Bwro78tnWD/qZxcouodo8/OTzjw5wlo788AWJ5K78z9isz
NGCIttQgWLNn7K66ut+Ai8w69+G2hIBclbBjwzOpAvYyfp6/g1QvAipoxdH0Ny4g
jVSGMTTLAlH4N7cFo7cImrmCN7Lu4CrMydMT0o5h2+sRgKdGw7Gcw+57gxE5VQj4
3PadVoZlwbZbRdfLwV5jwcKS6xVQMvJvrFhv0hWscO4Nd1jlCjmtXgMnJ20SDcU4
MnVbiKzYW2QHDnuipF/wctvJA4/rU9/2RVCTTadf31USaIKoi0njiWJY/Er6VV/4
5EEpm9jEHAfHtpUmgbEk19DlQ8AbBrKjNBxzrHbfLmwHdsChsER2JhD5k9On0YDT
IbCsGhalJSiKbMsClopZmljTDMCIPt0h7jB0HSgiwstdbHA6n/XxI8IE45lzEU4Z
3vh8rzGFtkOPbT9+FFOrqURh5Pf9Bwuop2OcFE0Ew+g5btuU1XjuESMw8jlWmAt9
mY2Asy/MnliSjXgoCHKQ2Ur6GCtDoK0CJUM9e5uyyWpj85WW4VTefEPnzj94G20v
iEpTxTNpLWILOU0GNP1vGJpW/rgSG1Gj73RdMgpjsdH2naXQPkX7exCFoW1ce9Ai
Pdr3dwurhN1VEWYEOVpk
=jecy
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

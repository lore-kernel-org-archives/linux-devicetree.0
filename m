Return-Path: <SRS0=XkBP=TX=gmail.com=thierry.reding@kernel.org>
Date: Thu, 23 May 2019 12:26:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V3 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190523102606.GF30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-8-git-send-email-nkristam@nvidia.com>
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:31PM +0530, Nagarjuna Kristam wrote:
> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller supports SS, HS and FS modes
>=20
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   10 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3807 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3818 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c

Looks good to me, but please address Chunfeng's comments:

Acked-by: Thierry Reding <treding@nvidia.com>

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmdTwACgkQ3SOs138+
s6HsmBAAs3zsZ3R7r94PXVAXdD0EvYx1TgGb0Xp/1R/e6nLD85CHeYOwwZ5OJnGH
fmsVUPYAM9S1I3NocnOgMf/eBl5fUCNY8g5EOgfh55j7svLM0hX+yIv8omje8AA4
e745dH6K369HN6bRf7JBrRQmg7P1gf7WUxDJbryUHWg+/aCgNCrVpOquswDczYFa
ThfkYWO6XnfdMeszP5oVQGlguDhBFAzpIs2pEtXR2YGzF3IbM8WzR22vTJtybAif
2HvvM7/lYsCgs3T21S2qEoHDz9i0MwQgFg9vT89iCgo2jsWL+V8Xq0cUPSEkHU40
yx6tsMZ96gwLg6kG8agN1gdXyXEDmueszhRwYcWCZZAHu4XflbtiO0mAN1KSZxNh
X4BeybKLkSUM/iqO1tDgtRU/46TZQKWNwO+bCUpMzntyfi76DbNdQH4Ltt49o3aH
5PkPkG/oc/sfFQx5ikNII+urMhHJIxzAS9+sNRMptQCCrzg4RB/RGyQdyb7fk6Je
pt0t4AM1HHGN1BdZ1ij1Q8m6cz6wyaZUjl1HKJFrZmaaFCkHchfGyvqJOSbH+iig
gJEm6rk12boPc3PzGgL9JsKx4S6P0TUnfQ92c5+DyeA3BTnpC6duvGopVT/yMDZq
BS7+1vbwYb+0XAtfEeEkPrnwG8k6MV0q0QYHHLZ+nE1HdR9APpc=
=vI9Z
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--

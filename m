Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:30:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 07/30] PCI: tegra: Enable opportunistic update FC and ACK
Message-ID: <20190415113025.GH29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-8-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-8-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2019 at 10:33:32PM +0530, Manikanta Maddireddy wrote:
> Enable opportunistic update FC and ACK to allow data link layer send
> pending ACKs and update FC packets when link is idle instead of waiting
> for timers to expire. This improves the PCIe performance due to better
> utilization of PCIe bandwidth.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/pci-tegra.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0a1EACgkQ3SOs138+
s6EClA//c3BkpNXqGgfWtua5UsJFYfVqeozrP97VI3dAucdMaQRCFH5lqY5N1vs6
4f9F4mpg1+EETSeEL3JeiXnw6nyE4+M/ghpMbf9dVEgWSbSb5Nwe2rqc2hnoW5jw
v3jl1iAtR6Q3DnKXBNEYtFdn2gQ8jN8mGskr00SrJ9wpkB2nbWZ2n76angR+L9qQ
HA3n0ICqbqITLpZcbp5lL0lNVyi0m9b7pQqx3TjS4GiSjCxpp0BbEFN1GDRianFJ
qweBOEHmXSofBOPhntnRHRQPAnhUbekv2swLlzIV7vSFBfmZX8HFcg48Wxg1zgeI
nZK72O63mwSRmL6abjO0prh5JEPT7ZE3a2pqu+puwi2iCYCKVa16EcN9U1xITL8K
1UG0Q6aGDE4/XOqqIJyyxj9BOcnNStIg8USDB/+7BKL+h2xVBGUI1mdQXhW/flKL
7gU+t2YNv5t22Tw1n6mDsFybbxOcwfE0KWQQdNxzEHCvmeZAW9b9PcQAssKV5I5X
BI6yYfSj36PybJTIOQzevg+W9F7IiG4lPvuah3pBiakaEDZjL6Y0R8YCcd0kQj5V
/nLFILOks7nXjjEmQxk05aszSOOHe22yvagRHxhgNyuXEQ2jGfV9Mo8RPLibZ5O0
AO08QUzzAIvRloydK3sXqyYqEKAQCpTz3gm4P6xhQeh5HLlsMaE=
=aPiO
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--

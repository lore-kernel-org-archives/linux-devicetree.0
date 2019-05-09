Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:23:32 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 16/28] PCI: tegra: Set target speed as Gen1 before
 starting LTSSM
Message-ID: <20190509142332.GM8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-17-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ARLBH93C7pgvpZY"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-17-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:13PM +0530, Manikanta Maddireddy wrote:
> PCIe link up fails with few legacy endpoints if root port advertises both
> Gen-1 and Gen-2 speeds in Tegra. This is because link number negotiation
> fails if both Gen1 & Gen2 are advertised. Tegra doesn't retry link up by
> advertising only Gen1. Hence, the strategy followed here is to initially
> advertise only Gen-1 and after link is up, retrain link to Gen-2 speed.
>=20
> Tegra doesn't support HW autonomous speed change. Link comes up in Gen1
> even if Gen2 is advertised, so there is no downside of this change.
>=20
> This behavior is observed with following two PCIe devices on Tegra,
>  - Fusion HDTV 5 Express card
>  - IOGear SIL - PCIE - SATA card
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Updated commit log to reflect why this issue is observed on Tegra with
> these particular cards
>=20
>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUN+MACgkQ3SOs138+
s6GQrRAAo+2k8UeW7UF1AajkUxrBvVxbQQRIy+pZSYqFbg6dy6nOnB4ZEDVsnEZS
gfxZhX8qStod8gWagEMF25nctyiVHuQGU+P07GJY3FIcOEx4Y/EYv0wW65H6OACD
gbscLMB5kXRLbVg26nY3SIjB2IZDG/nFXmfdkkDpsOurd4CPulleUAovtp6q1Sfe
BAcbDC4vQ5cov/Ms2oJeEtZMBJICGPCDyFLZRU0D+xhuDyEVvFVnmGWM5vPKGAzM
hfMXyU4uWkm6TYExw9LMUoFiH5n7NPC4FnbQSO+vLw/9JGtnBu/wXVMAn63IwqcF
ezOMxxOeQwGxxbr/aJCF7VGeCNdcxlJvyAlOwESK5nIiAvXHW5mlOAUpuLplIxsS
2cXr75echyXlZlIP4l52qZj8K31E17Y61MWaO0/dwXMw6nEyB9uirZ2pZeSHVFxo
apAO6EJoBjWLbIEzKr8DAaZYWdpzu+IArVwFm1+sbasQ7GDM9ail0Q77gXdg2jP7
GXRgT7qwctB93JPqrDfwM/0i7KkKXs2zkV19ga3/2Ae9F+SoaGCElYSOKsuUKQ+t
yEg+JROfGJik40qUz/Skr/QR2VB4IMBDEGalKdsq22krZuqCaIx+Py4RgQ69L7+G
pJYDV3BBPNdq6RQBP5uC1jyivg75l4kzUOxGMJBhgD2FFyVw0lQ=
=BWzF
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--

Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:38:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 24/28] arm64: tegra: Add PEX DPD states as pinctrl
 properties
Message-ID: <20190509143843.GW8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-25-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j2Klb18PAKd8hQ5U"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-25-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--j2Klb18PAKd8hQ5U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:21PM +0530, Manikanta Maddireddy wrote:
> Add PEX deep power down states as pinctrl properties to set in PCIe drive=
r.
> In Tegra210, BIAS pads are not in power down mode when clamps are applied.
> To set the pads in DPD, pass the PEX DPD states as pinctrl properties to
> PCIe driver.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard pinctrl names, default and idle
>=20
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

I'll pick this up into the Tegra tree once the rest of the set has been
merged.

Thierry

--j2Klb18PAKd8hQ5U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUO3MACgkQ3SOs138+
s6EqPg/9Hf1Lj2EaSE+1o808c0caXI47Ve9zySckGhNFOIJ+dmvrAs0CI0ZXWXuV
F03ZGRR9OqCx9rh8LXzPraHx2iPHR9sG5vsbCRTpddiH6ye9nQ0E+bvwapADwHNF
7pu1VD5F8tXXjd6FAblVKd2kBhej0e0pZySh4nNKjRe/kiyOisVOSDWV2qFc5xEI
KlFUcdDIe6lDIxfvVVobdcqxb4jA6ln4Coghefv9WiwvrTtQsFkTQoRIa2fIvffC
DgD2GxxkLC0P87iIbIhl3NPNgKavAQ12kEh5bD8wVuoDH1qCgTXMQYNyUZ4SOcwN
c+7jIVI2SiKlt5A55aBpz0Zn+jPNDH3pX2D3cjFigNM4OJwpam2Qd1said6C8CWu
mr4vcUv1kRwo4BmqtDoSs7cI42EaXclJBqG8LKHaSVUcMGYH4jIVzfpOrhgECcYL
xe18d2tWUv+OTJxLf1LXZFfu1sTx6fkltqODIsEsw2PPdYglXyZhqx/0yAbLSqAN
eIvlsI9gZY5jH5zq84BWaQTcsRhYKx+qwTyQqnigfEjnA9yVhLTdKxjODNjycImk
paqk29gGDtohGN8o9RfBTWbhq04UFSAyVeBYDtqMeMkTBIz9mezAtNoR4v33WHwf
Go5Nsipm6Wg/liA4+vB1lNti8GU7eVJItmJhxFxe+8QfZXmd6lQ=
=LNbR
-----END PGP SIGNATURE-----

--j2Klb18PAKd8hQ5U--

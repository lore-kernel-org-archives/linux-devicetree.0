Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:21:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 14/28] PCI: tegra: Add SW fixup for RAW violations
Message-ID: <20190509142149.GK8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-15-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-15-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:11PM +0530, Manikanta Maddireddy wrote:
> The logic which blocks read requests till AFI gets ACK for all outstanding
> writes from memory controller does not behave correctly when number of
> outstanding writes become more than 32 in Tegra124 and Tegra132.
>=20
> SW fixup is to prevent writes from accumulating more than 32 by,
>  - limiting outstanding posted writes to 14
>  - modifying Gen1 and Gen2 UpdateFC timer frequency
>=20
> UpdateFC timer frequency is equal to twice the value of register content
> in nsec. These settings are recommended after stress testing with differe=
nt
> values.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Changed update_fc_val to update_fc_threshold
>=20
>  drivers/pci/controller/pci-tegra.c | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUN30ACgkQ3SOs138+
s6HFQw/+PTC7RN71AKKN6opIjXVg0LiEMaoj3Q48f4ybfsn53m38RUQj8EhdxpMX
LXr8NflHDE0i1nJA/B1NXqAtVWASiM+4fPZOQHtHznUQip/910twhFMabhcxJ6sM
8vBcNe4pBDgnlpPltf/G/F4ztf8lYbffAdGM8X6swv955SVB3UL2g7LCpiwoawSZ
mpvKNTSdiwd+8okBeFvRcqu1WSnt9Gqd3JH99t1NM83IwU1kMCmJNG9BiwYmUMck
OD3grHpwffxRJde+MDZ0OPDOPhYxSJh1qQ2j9a682Vk4QYMtFzFnNXmFLweQqwV8
Ajp++bGjdSRbasjXXdaCyLa/o/z7sMZLTb793yy19PjF1mJR6SuSqLgmcMLaX/GB
pu4qhZGyfHVVGwvB9eo/JQ74/7Q0dJnW8oPnQULjf3wB/iSP3VC53bYQ+d0RcuoO
QSzBwCypk/91xA32xWxoG6xxV7xM4drsp4jplgFwGwldgEdxMIclBdZGxi5jdSLG
aJ1f/WhveIB6f3DVsMM55vwkNDW13fSMI9oD2hCUhYa3bOqbcw//FQz8ZZUhj82f
vuTJG/7XBLObZWea9AyAn5tpg/EFmWAHHGcwHsxTZUuL35b/fgPu0NGeZmtEQyNS
b90w0j9e6RV4xeGqaSas4ORQIybgJN6NTcTzehZrDfCMlHxPehQ=
=cly3
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--

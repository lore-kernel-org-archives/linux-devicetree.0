Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:18:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 08/28] PCI: tegra: Program UPHY electrical settings
 for Tegra210
Message-ID: <20190509141809.GH8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-9-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-9-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:05PM +0530, Manikanta Maddireddy wrote:
> UPHY electrical programming guidelines are documented in Tegra210 TRM.
> Program these electrical settings for proper eye diagram in Gen1 and Gen2
> link speeds.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Addressed coding style comments
>=20
>  drivers/pci/controller/pci-tegra.c | 107 +++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNqEACgkQ3SOs138+
s6HI5xAAs1HMkIoleQaWx0jFjF8PsMt6m8fDI1mHrO6miv2T9DBo+Uvo2U8mBzVA
MmGJJsVwtdyAjFZD6Da7Bj7IJz7lHO/kJ206ofLu2QrihW/tihrQ22Z3IikZY+eW
P1Qet1AsjVWRCi9q5bRoRLeewnOeNLMuiCVObQXztya9cM+oFjtuD9JIkO2Otg+L
QX6esV4Hg0b7zL5s7l7dDPenE4PYzA93XSFI/XrBGN6+cdD+rMuaVb7xhMzdKIRQ
eFiyLafjk/Pqmlll3cDSYGJW7gVK0YNG7hqPg2IIO5k87oRrn/yY9NHZwMpty6Dq
ksQqV+ebSPYs1bR32AHlyMISxJAHYk/i4KDA+/5ts6O4+6ntMqnP+R3wzRHw7FuI
suCgVVJUBB4Dm1dnqp63eNtPx0Oq5TlBpxfNl1WoO2Nh+M4OnPEMbsqsYueKGghp
/Wknrnp5MePs+MdAVYPPmxobY0Z/WdxoEU8wXS3Fu2h3pGe32sWYuC/at6BOGjWP
fM6z4J/QJfqe07zvstoigutj0lGQqZuKyJYVE9F8qTqilBj6rMNOfekjCao/lzRL
hAGIpuduucnNCTdRPZsGPWgXR8lH25htra6lxBFl84DxP6xOMxWzJiu2A/kwfoTI
FT2jVnziau/hQvb/EsmaJ6wJIVk8d3GGUof+AZChBL817XxVkpw=
=DMr2
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--

Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:22:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 15/28] PCI: tegra: Update flow control timer frequency
 in Tegra210
Message-ID: <20190509142239.GL8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-16-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-16-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:12PM +0530, Manikanta Maddireddy wrote:
> Recommended UpdateFC threshold in Tegra210 is 0x60 for best performance
> of x1 link. Setting this to 0x60 provides the best balance between number
> of UpdateFC packets and read data sent over the link.
>=20
> UpdateFC timer frequency is equal to twice the value of register content
> in nsec, i.e (2 * 0x60) =3D 192 nsec.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Changed update_fc_val to update_fc_threshold
>=20
>  drivers/pci/controller/pci-tegra.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUN68ACgkQ3SOs138+
s6EUIQ//fPLO3+kOgp+cWleSpS5tQI/b3oSJYHWpm4WDf+3W00jaAOngR/nppT+R
xZrL/NENwycIe9ShA3Fh1lOPKnYtTWEfjHj1lsWFMVvKqOykPQCpuQV74G2/BCF3
rSv67tehrwMAgndniHosmKcmu1Pw0gYMITujiodA4J7R9OIkgYsaCb00gNujYfHl
noT6w9b/s38NcSv1E8k4EvTd44YFfyWt1xrOW9QSuAFrqsKD79fFgwQmPr11e6P0
IYLM9ylf0S6Pm5q9WML1CELnThLbuFUwr0UfjlSoLu6siDfD/JC0rTj7m+EIgEYT
nh2Nb1QL8EsDIOLzxSq9h7ZdzQxnyGmGKpm4o1jGkacyjR4np90h8wJSeOZnBx31
+Yo54EFeEUvfwZxbVCz8C8+IP/AbBLqEhKAp+0ES6vH0RDO42KepGQUcalv22Akr
0ret0Bw5TCYw4kTPEsuDy5f0lziu4zqMICz+sATbzn9ptLqaP2KPLII2jEWUglPb
ws5w3+OOvsAGAU160egM4X6cpToY0x0wulj1gguXysASERKwMQ5Q+xZpUWXWVr32
1MiEUEvDPB41hQeqyHmvnMSVu8PfgzyjudOtHR4hzsH5zqXvD82mKVh12bIDBiob
lqtVwu2VdMRm8BBw8tSB+xH25dlRD7xKJD8YVksWMyPElMWFnh4=
=8+ux
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--

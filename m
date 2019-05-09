Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:20:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 13/28] PCI: tegra: Increase the deskew retry time
Message-ID: <20190509142042.GJ8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-14-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T4IYkFBVPN84tP7K"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-14-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--T4IYkFBVPN84tP7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:10PM +0530, Manikanta Maddireddy wrote:
> Sometimes link speed change from Gen2 to Gen1 fails due to instability
> in deskew logic on lane-0 in Tegra210. Increase the deskew retry time
> to resolve this issue.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Took care of typos in commit log and coding style comments.
>=20
>  drivers/pci/controller/pci-tegra.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--T4IYkFBVPN84tP7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNzoACgkQ3SOs138+
s6GFyw//UjWRcuBbosKqkaMjHIMkH+D9IMOPWLBt4TunKV+QiMrpK8z3IZD33n5V
u3rtlzCNksCAxMKprzcpJts1SVN+SI5NzyHnHUYmBC6PmVjycFdKGyste020q9Fn
5A0kow40Pi91FW69J3fYL2BkiqWFti6KskJcloxJHBgiLhNhlveBdWAYsPDuLqev
YsgRrIzXF2KpvgCq/M1HK6fi6J/sLuxFWVNVlp7BbAz1CwwQfIFF/n2VivI6S3mX
93+M1pZbmr3nfsG0JyF4CPdLL+bIp23/BJFMKMTbpBNyTPQ3VSQGrpC7PV/mH93k
l5pd0HY9m0Rs1WbdsZN19Qrx1ydo5BwOipM2PI5C7JTYy2flbJlJrG6/2TZ4rxqu
rTjqLYxznMYIg41dG5oJvt+cDtIeGoS0hOHjBnAhpet7RUbnZnMiTdNPch9XeNgd
jiDiVrcdLVOx8wy/QBGPeUMW7FmXqLXdWWfVw/hHJTRI3lzoi/nd5liZOfa5ozBS
83JzXf1HIg5pJgf1thwysmLe6c9791DmsVnM2R4z1p1GECI+O6BjVVAi6QqJHSW6
/bsVo2IOBUJUJF59xiCjHNxppsghQxj6LIlD6T3Z8/U0cMcUOAT+zXAJtLEa5woc
TUK6oXIVySs3SRnIJe/AopYXFS1uzwKze3HITVOSvjf5nfxzlak=
=7+t6
-----END PGP SIGNATURE-----

--T4IYkFBVPN84tP7K--

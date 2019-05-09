Return-Path: <SRS0=MMxF=TJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33453 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfEIOUG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 May 2019 10:20:06 -0400
Date: Thu, 9 May 2019 16:20:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 12/28] PCI: tegra: Enable PCIe xclk clock clamping
Message-ID: <20190509142002.GI8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-13-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-13-mmaddireddy@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:09PM +0530, Manikanta Maddireddy wrote:
> Enable xclk clock clamping when entering L1. Clamp threshold will
> determine the time spent waiting for clock module to turn on xclk after
> signaling it. Default threshold value in Tegra124 and Tegra210 is not
> enough to turn on xclk clock. Increase the clamp threshold to meet the
> clock module timing in Tegra124 and Tegra210. Default threshold value is
> enough in Tegra20, Tegra30 and Tegra186.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Took care of typos in commit log and coding style comments.
>=20
>  drivers/pci/controller/pci-tegra.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNxIACgkQ3SOs138+
s6HO2xAAkvI5x63ZPIRP0XJqegRNMwVI8Q8Qq2ywkDegjbNJew4Ddqf8HLiSUIep
m0P0+nFUC3ueZxsTalaA00w6Tfs+6E64PCWYmtbjoXMzX13Zkk2G657odg66eL7D
whjb0PIRMba0+nIdrN/YSRm8OU45+ZzBRQBMby25u6ijvMv8gV8856M13IrDPXUo
y5d29VHhYmt5FsVY7Oqnkw5q0NvTdmm4RdrrpGiTjoZDSc1j08QNM012dVOVC7iv
+LXvlZvE7FZ52A3nK/KVpIScxjHrkm5nNisI3kh9mP21sIPcxluMpZU2/w3nIjl8
yR7TAiSRKhg6E0bLO08/zNEsUS3PEMjeEkvfF4sNCHlBqqWjxZl7pj5lgTdY0bQ7
1CY8703sR9fb9G+O7m4uGTSGwJzz0pbmijyRzgD7jLdo3n/qi8jxF6tjuufTfnEp
yN9hdaUF6AdX5fRglNXQZdB5ZNXOMHFhdf24vfQSMe6vt0YA7EtiQOYpiy97zsGw
qTiDwPQAxhXuQhhhrpCnDOP8b0+Kyu5CpCIRiAAn8Ev50u8ypWzYmE35qSsLfNLa
evSdqYvzkxJ7l0/9L6WwV4vx1w4w4McVVe2gqiO4lRvLZPqj3Cp65Iu47AjQc8ZS
6aaOQNGSIlLjx5t7DmsMACpsBdqsiZh8XoOlkyMQoRr/RLnVQZ4=
=9Ujd
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--

From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH RFC 3/3] nand: pl353: Add driver for arm pl353 smc nand
 interface
Date: Mon, 31 Mar 2014 14:46:38 +0200
Message-ID: <533963AE.30405@monstr.eu>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com> <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, pekon@ti.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/27/2014 07:21 PM, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller nand interface.
> This controller is used in xilinx zynq soc for interfacing the nand
> flash memory.
>=20
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> ---
>  drivers/mtd/nand/Kconfig      |    8 +
>  drivers/mtd/nand/Makefile     |    1 +
>  drivers/mtd/nand/pl353_nand.c | 1122 +++++++++++++++++++++++++++++++++=
++++++++
>  3 files changed, 1131 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 90ff447..31c1d0c 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -510,4 +510,12 @@ config MTD_NAND_XWAY
>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is a=
ttached
>  	  to the External Bus Unit (EBU).
> =20
> +config MTD_NAND_PL353
> +	tristate "ARM Pl353 NAND flash driver"
> +	depends on MTD_NAND && ARM
> +	select PL353_SMC

Here should be probably depends on PL353_SMC.
I just found it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlM5Y64ACgkQykllyylKDCH+1ACcCvakTIoVaiVC/ixHNJ1sYzfq
lbUAnjx45bVGYZDfn40TFNOOQR3Cq1nd
=lZl0
-----END PGP SIGNATURE-----

--Aw4lsEHKOjuKwtjRTTjf7ualwFbVhnr49--

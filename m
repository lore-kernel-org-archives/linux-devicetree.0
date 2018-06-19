From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Add support for Avnet Ultra96 rev1 board
Date: Tue, 19 Jun 2018 10:36:57 +0200
Message-ID: <dcee0f07-967a-034b-1d95-576e0b458a89@monstr.eu>
References: <80d21c84d427cb6b4122efd3dea7f1c4ab4cf2be.1525261987.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="6zrnCMMaOPas4drc4d0BGaJruzJCwcT4r"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <80d21c84d427cb6b4122efd3dea7f1c4ab4cf2be.1525261987.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6zrnCMMaOPas4drc4d0BGaJruzJCwcT4r
Content-Type: multipart/mixed; boundary="mwZ8ia8sao6vWVPeO1Jym8xxE6Onedmee";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will.deacon@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
Message-ID: <dcee0f07-967a-034b-1d95-576e0b458a89@monstr.eu>
Subject: Re: [PATCH] arm64: zynqmp: Add support for Avnet Ultra96 rev1 board
References: <80d21c84d427cb6b4122efd3dea7f1c4ab4cf2be.1525261987.git.michal.simek@xilinx.com>
In-Reply-To: <80d21c84d427cb6b4122efd3dea7f1c4ab4cf2be.1525261987.git.michal.simek@xilinx.com>

--mwZ8ia8sao6vWVPeO1Jym8xxE6Onedmee
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 2.5.2018 13:53, Michal Simek wrote:
> Avnet Ultra96 rev1 board is commercialized Xilinx zcu100 revC/D
> internal board. The patch is reusing zcu100 revC files but changing
> model description and compatible strings which are used for example by
> libmraa.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
> I choose this option because there are houndreds of zcu100 boards
> created and this will enable support both versions.
>=20
> Record avnet prefix was sent by separate patch.
> ---
>  arch/arm64/boot/dts/xilinx/Makefile           |  1 +
>  .../boot/dts/xilinx/avnet-ultra96-rev1.dts    | 19 +++++++++++++++++++=

>  2 files changed, 20 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dts
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/Makefile b/arch/arm64/boot/dts/=
xilinx/Makefile
> index d452f80e7601..60f5443f3ef4 100644
> --- a/arch/arm64/boot/dts/xilinx/Makefile
> +++ b/arch/arm64/boot/dts/xilinx/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ZYNQMP) +=3D avnet-ultra96-rev1.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1232-revA.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1254-revA.dtb
>  dtb-$(CONFIG_ARCH_ZYNQMP) +=3D zynqmp-zc1275-revA.dtb
> diff --git a/arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dts b/arch/a=
rm64/boot/dts/xilinx/avnet-ultra96-rev1.dts
> new file mode 100644
> index 000000000000..88aa06fa78a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dts file for Avnet Ultra96 rev1
> + *
> + * (C) Copyright 2018, Xilinx, Inc.
> + *
> + * Michal Simek <michal.simek@xilinx.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "zynqmp-zcu100-revC.dts"
> +
> +/ {
> +	model =3D "Avnet Ultra96 Rev1";
> +	compatible =3D "avnet,ultra96-rev1", "avnet,ultra96",
> +		     "xlnx,zynqmp-zcu100-revC", "xlnx,zynqmp-zcu100",
> +		     "xlnx,zynqmp";
> +};
>=20

Rob/Mark: Do you see any issue with this patch?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--mwZ8ia8sao6vWVPeO1Jym8xxE6Onedmee--

--6zrnCMMaOPas4drc4d0BGaJruzJCwcT4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlsowKkACgkQykllyylKDCFc4QCfXdIDkzbxUIbcNV6Z0DxWCU2p
vqIAn1pe9S1OC3T79+ojvHafVdMabd1z
=zd4f
-----END PGP SIGNATURE-----

--6zrnCMMaOPas4drc4d0BGaJruzJCwcT4r--

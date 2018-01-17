From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 0/6] arm64: zynqmp: Various dts cleanups
Date: Wed, 17 Jan 2018 16:50:49 +0100
Message-ID: <c5acb769-a72b-fef3-d67e-5ca522353b4a@monstr.eu>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="MbOXid5s9ZDkm8ts5bq6jiNGkFv5UWO8M"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, VNSL Durga <vnsl.durga.challa@xilinx.com>, P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>, Kedareswara rao Appana <appanad@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Catalin Marinas <catalin.marinas@arm.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Will Deacon <will.deacon@arm.com>, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Moritz Fischer <mdf@kernel.org>, Alistair Francis <alistair.francis@xilinx.com>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@dowhile0.org>, "Edgar E. Iglesias" <edgar.igl>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MbOXid5s9ZDkm8ts5bq6jiNGkFv5UWO8M
Content-Type: multipart/mixed; boundary="QgHcugF3JvSV9egYQVRYTjcxIrhkjCyCT";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, VNSL Durga <vnsl.durga.challa@xilinx.com>,
 P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>,
 Kedareswara rao Appana <appanad@xilinx.com>, Rob Herring
 <robh+dt@kernel.org>, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Will Deacon <will.deacon@arm.com>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Moritz Fischer <mdf@kernel.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 linux-arm-kernel@lists.infradead.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Will Wong <willw@xilinx.com>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <c5acb769-a72b-fef3-d67e-5ca522353b4a@monstr.eu>
Subject: Re: [PATCH 0/6] arm64: zynqmp: Various dts cleanups
References: <cover.1516202975.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1516202975.git.michal.simek@xilinx.com>

--QgHcugF3JvSV9egYQVRYTjcxIrhkjCyCT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 17.1.2018 16:29, Michal Simek wrote:
> this patchset is adding minor dt pieces for ep108.
> Also adding SPDX headers, fixing minor coding style issue and extending=

> gem compatible string for all boards.
> The next patchset will add much more zynqmp based board.
>=20
> Thanks,
> Michal
>=20
>=20
>=20
> Anurag Kumar Vulisha (1):
>   arm64: zynqmp: Added OOB timing settings in zynqmp-ep108.dts
>=20
> Michal Simek (4):
>   arm64: zynqmp: Use zynqmp specific compatible string for macb
>   arm64: zynqmp: Fix alignment in dts files
>   arm64: zynqmp: Add SPDX license identifier
>   arm64: zynqmp: Add missing aliases for ep108
>=20
> P L Sai Krishna (1):
>   arm64: zynqmp: Add 8-bit bus width property for ep108
>=20
>  arch/arm64/boot/dts/xilinx/Makefile              |  1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108-clk.dtsi |  1 +
>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts      | 18 ++++++++++++++++=
+-
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           | 17 +++++++++-------=
-
>  4 files changed, 28 insertions(+), 9 deletions(-)
>=20

subject wasn't propagated properly that's why I am fixing it now. But
patches should be fine.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--QgHcugF3JvSV9egYQVRYTjcxIrhkjCyCT--

--MbOXid5s9ZDkm8ts5bq6jiNGkFv5UWO8M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlpfcNkACgkQykllyylKDCHWyACfWHsp3VKujQLdqRqIE6+ofTg7
tk4An0nGUISPAb4Ji7wMYqOzf2NoVscm
=4Oip
-----END PGP SIGNATURE-----

--MbOXid5s9ZDkm8ts5bq6jiNGkFv5UWO8M--

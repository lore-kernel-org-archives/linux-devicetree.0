From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2] ARM64: Add new Xilinx ZynqMP SoC
Date: Thu, 05 Mar 2015 15:27:47 +0100
Message-ID: <54F867E3.6070706@monstr.eu>
References: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek@xilinx.com> <54F862BE.7000901@arm.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ajvsUM4nFqw915ccLEAW6aXbrFjwBEVli"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F862BE.7000901@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robherring2@gmail.com>
Cc: devicetree@vger.kernel.org, Zach Pfeffer <zachp@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Eddie Huang <eddie.huang@mediatek.com>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ajvsUM4nFqw915ccLEAW6aXbrFjwBEVli
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On 03/05/2015 03:05 PM, Marc Zyngier wrote:
> Hi Michal,
>=20
> On 05/03/15 13:53, Michal Simek wrote:
>> Initial version of device tree for Xilinx ZynqMP SoC.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>>
>> Changes in v2:
>> -  move timer out of amba_apu bus because it is not on bus
>>    Reported by Mark
>> - FIC GICC and GICV addresses - Reported by Rob
>> - Fix copyright
>> - Enable cadence IP in defconfig
>> - Add support for macb multiqueue
>>
>>  arch/arm64/Kconfig                          |   5 +
>>  arch/arm64/boot/dts/Makefile                |   1 +
>>  arch/arm64/boot/dts/xilinx/Makefile         |   5 +
>>  arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts |  47 +++++
>>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 303 +++++++++++++++++++=
+++++++++
>>  arch/arm64/configs/defconfig                |   3 +
>>  6 files changed, 364 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/xilinx/Makefile
>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>=20
> [...]
>=20
>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/=
boot/dts/xilinx/zynqmp-ep108.dts
>> new file mode 100644
>> index 000000000000..0a3f40ecd06d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
>=20
> [...]
>=20
>> +		gic: interrupt-controller@f9010000 {
>> +			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>> +			#interrupt-cells =3D <3>;
>> +			reg =3D <0x0 0xf9010000 0x10000>,
>> +			      <0x0 0xf902f000 0x2000>,
>> +			      <0x0 0xf9040000 0x20000>,
>> +			      <0x0 0xf906f000 0x2000>;
>> +			interrupt-controller;
>=20
> Please add the missing GIC maintenance interrupt.

Ok. Will add interrupts =3D <1 9 0xf04>;

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--ajvsUM4nFqw915ccLEAW6aXbrFjwBEVli
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlT4Z+MACgkQykllyylKDCF8hwCgmBCljP9LNAAO7nd9iRgtxq+n
rTgAnAzrpFXl/lNSHk2XJl3ELFLV5JtS
=yvrQ
-----END PGP SIGNATURE-----

--ajvsUM4nFqw915ccLEAW6aXbrFjwBEVli--

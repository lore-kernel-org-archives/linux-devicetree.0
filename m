From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 3/8] arm64: zynqmp: Add support for Xilinx zcu102
Date: Fri, 2 Mar 2018 19:39:22 +0100
Message-ID: <f935102d-149f-cc67-e811-ab62caf4abd1@monstr.eu>
References: <cover.1519396753.git.michal.simek@xilinx.com>
 <dd5933d6a49247de4b3b7516ed7fab55d1b3eb90.1519396753.git.michal.simek@xilinx.com>
 <20180302164803.nb45aqgqvnzxuyn5@rob-hp-laptop>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="WzaLwjH3bGzo6lsmao0Dk6FFwLfnOPgCK"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302164803.nb45aqgqvnzxuyn5@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WzaLwjH3bGzo6lsmao0Dk6FFwLfnOPgCK
Content-Type: multipart/mixed; boundary="QmakYYkRx9Faw8gqwhXQvw4Qx76yZEwX5";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will.deacon@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <f935102d-149f-cc67-e811-ab62caf4abd1@monstr.eu>
Subject: Re: [PATCH v2 3/8] arm64: zynqmp: Add support for Xilinx zcu102
References: <cover.1519396753.git.michal.simek@xilinx.com>
 <dd5933d6a49247de4b3b7516ed7fab55d1b3eb90.1519396753.git.michal.simek@xilinx.com>
 <20180302164803.nb45aqgqvnzxuyn5@rob-hp-laptop>
In-Reply-To: <20180302164803.nb45aqgqvnzxuyn5@rob-hp-laptop>

--QmakYYkRx9Faw8gqwhXQvw4Qx76yZEwX5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2.3.2018 17:48, Rob Herring wrote:
> On Fri, Feb 23, 2018 at 03:40:25PM +0100, Michal Simek wrote:
>> This patch is adding revA, revB and rev1.0. There are also other
>> revisions between which should be backward compatible with previous
>> versions. Unfortunately all revs are still in use.
>>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>> Changes in v2:
>> - Remove i2c mw u-boot commands
>> - Use i2c-mux instead of i2cswitch
>> - Use clock generator without numbers.
>> - Use dash in node name zcu102 rev1.0
>> - Record compatible string to xilinx.txt
>>
>>  Documentation/devicetree/bindings/arm/xilinx.txt   |   5 +
>>  arch/arm64/boot/dts/xilinx/Makefile                |   3 +
>>  .../arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dts |  36 ++
>>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  | 550 ++++++++++++=
+++++++++
>>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts  |  42 ++
>>  5 files changed, 636 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dt=
s
>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>=20
>=20
> but...
>=20
>=20
>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts b/arch/=
arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
>> new file mode 100644
>> index 000000000000..ed3cc684931f
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * dts file for Xilinx ZynqMP ZCU102 RevB
>> + *
>> + * (C) Copyright 2016 - 2018, Xilinx, Inc.
>> + *
>> + * Michal Simek <michal.simek@xilinx.com>
>> + */
>> +
>> +#include "zynqmp-zcu102-revA.dts"
>> +
>> +/ {
>> +	model =3D "ZynqMP ZCU102 RevB";
>> +	compatible =3D "xlnx,zynqmp-zcu102-revB", "xlnx,zynqmp-zcu102", "xln=
x,zynqmp";
>> +};
>> +
>> +&gem3 {
>> +	phy-handle =3D <&phyc>;
>> +	phyc: phy@c {
>> +		reg =3D <0xc>;
>> +		ti,rx-internal-delay =3D <0x8>;
>> +		ti,tx-internal-delay =3D <0xa>;
>> +		ti,fifo-depth =3D <0x1>;
>> +	};
>> +	/* Cleanup from RevA */
>> +	/delete-node/ phy@21;
>> +};
>> +
>> +/* Different qspi 512Mbit version */
>=20
> Stray comment

will remove.

>=20
>> +
>> +/* Fix collision with u61 */
>> +&i2c0 {
>> +	i2cswitch@75 {
>=20
> Missed this name.
>=20
> This probably creates a new node rather than going into the existing=20
> tree. If this compiles, we should fix it to not allow the same=20
> unit-address twice.

hmm interesting I didn't see that before I sent this. There is a warning
but not error.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--QmakYYkRx9Faw8gqwhXQvw4Qx76yZEwX5--

--WzaLwjH3bGzo6lsmao0Dk6FFwLfnOPgCK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlqZmloACgkQykllyylKDCFtJwCggs+MAz4q5UwqQFsmZFXpz4fe
hF4An3WswcjKFeQfwB0AMYinZuvo/Yh3
=6/Qe
-----END PGP SIGNATURE-----

--WzaLwjH3bGzo6lsmao0Dk6FFwLfnOPgCK--

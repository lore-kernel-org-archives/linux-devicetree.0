From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 2/8] arm64: zynqmp: Add support for Xilinx zcu100-revC
Date: Fri, 2 Mar 2018 19:34:55 +0100
Message-ID: <c9d4bc3a-888e-3faf-4b1d-6ad309048078@monstr.eu>
References: <cover.1519396753.git.michal.simek@xilinx.com>
 <26229dbbeb0ced5db870a8cf636f6d3d5855199e.1519396753.git.michal.simek@xilinx.com>
 <20180302164037.5mzzc4ixxvph46bf@rob-hp-laptop>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="kbsh59HFKHPzad0hn73OVIEn68oZPEiM5"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302164037.5mzzc4ixxvph46bf@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kbsh59HFKHPzad0hn73OVIEn68oZPEiM5
Content-Type: multipart/mixed; boundary="6Oy8QFoVwyWDeAe1eQ0NcJQZDrVDJmbWi";
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
Message-ID: <c9d4bc3a-888e-3faf-4b1d-6ad309048078@monstr.eu>
Subject: Re: [PATCH v2 2/8] arm64: zynqmp: Add support for Xilinx zcu100-revC
References: <cover.1519396753.git.michal.simek@xilinx.com>
 <26229dbbeb0ced5db870a8cf636f6d3d5855199e.1519396753.git.michal.simek@xilinx.com>
 <20180302164037.5mzzc4ixxvph46bf@rob-hp-laptop>
In-Reply-To: <20180302164037.5mzzc4ixxvph46bf@rob-hp-laptop>

--6Oy8QFoVwyWDeAe1eQ0NcJQZDrVDJmbWi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2.3.2018 17:40, Rob Herring wrote:
> On Fri, Feb 23, 2018 at 03:40:24PM +0100, Michal Simek wrote:
>> This board has 2GB of memory, i2c, sd, wifi sdio, spis, uarts, display=

>> port and usbs.
>> Board is using fixed clocks because clock driver hasn't been merged ye=
t.
>=20
> Please get rid of the separate clocks dts file when it is merged.

Will do.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--6Oy8QFoVwyWDeAe1eQ0NcJQZDrVDJmbWi--

--kbsh59HFKHPzad0hn73OVIEn68oZPEiM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlqZmU8ACgkQykllyylKDCE1gQCggOmXIasnpUKolKc8n59HowKj
qCYAniFgkaKjktrG3i4pRLEzj1Hv3Ln0
=XM8W
-----END PGP SIGNATURE-----

--kbsh59HFKHPzad0hn73OVIEn68oZPEiM5--

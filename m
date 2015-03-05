From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2] ARM64: Add new Xilinx ZynqMP SoC
Date: Thu, 05 Mar 2015 15:08:26 +0100
Message-ID: <54F8635A.9020808@monstr.eu>
References: <cd616fa25dafee38f98e3b207e74450c5403f440.1425563597.git.michal.simek@xilinx.com> <20150305150322.19e378d9@free-electrons.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="g8V9BRgcVQRviciGk8SUqnO4p7gwJmtuL"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150305150322.19e378d9@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robherring2@gmail.com>, devicetree@vger.kernel.org, Zach Pfeffer <zachp@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Eddie Huang <eddie.huang@mediatek.com>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g8V9BRgcVQRviciGk8SUqnO4p7gwJmtuL
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On 03/05/2015 03:03 PM, Thomas Petazzoni wrote:
> Dear Michal Simek,
>=20
> On Thu,  5 Mar 2015 14:53:34 +0100, Michal Simek wrote:
>=20
>> +	pmu {
>> +		compatible =3D "arm,armv8-pmuv3";
>> +		interrupts =3D <0 143 4>,
>> +			     <0 144 4>,
>> +			     <0 145 4>,
>> +			     <0 146 4>;
>=20
> Any reason not to use
>=20
> #include <dt-bindings/interrupt-controller/arm-gic.h>
> #include <dt-bindings/interrupt-controller/irq.h>
>=20
> in order to write the more descriptive:
>=20
> 		interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> 			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>=20
> And ditto for all other interrupts properties?

I tend to not to use them because it is just hassle when I want
to move DTSes to different project.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--g8V9BRgcVQRviciGk8SUqnO4p7gwJmtuL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlT4Y1oACgkQykllyylKDCF75wCfSn4D/YsUwyAznwC06/ENybsm
Ad0An3vhQViKGutcQbksEUBzb/3X98aj
=D22G
-----END PGP SIGNATURE-----

--g8V9BRgcVQRviciGk8SUqnO4p7gwJmtuL--

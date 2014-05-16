From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] ARM: zynq: dt: Add a fixed regulator for CPU voltage
Date: Fri, 16 May 2014 14:54:58 +0200
Message-ID: <53760AA2.4040703@monstr.eu>
References: <1399064852-19569-1-git-send-email-soren.brinkmann@xilinx.com> <e9675d40-2fd9-4fed-a020-5b465ea1842d@BN1BFFO11FD047.protection.gbl>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="n5SGEOGa5WHKFnmu2hBEofPxOD2nn5hSD"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e9675d40-2fd9-4fed-a020-5b465ea1842d@BN1BFFO11FD047.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--n5SGEOGa5WHKFnmu2hBEofPxOD2nn5hSD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/15/2014 04:57 PM, S=C3=B6ren Brinkmann wrote:
> ping? Any comments?
>=20
> 	Thanks,
> 	S=C3=B6ren
>=20
> On Fri, 2014-05-02 at 02:07PM -0700, Soren Brinkmann wrote:
>> To silence the warning
>> 	cpufreq_cpu0: failed to get cpu0 regulator: -19
>> from the cpufreq driver regarding a missing regulator,
>> add a fixed regulator to the DT.
>> Zynq does not support voltage scaling and the CPU rail should always b=
e
>> supplied with 1 V, hence it is added in the SOC-level dtsi.
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>>
>>  arch/arm/boot/dts/zynq-7000.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)

Probably no objection from others.
Applied to zynq/dt branch.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--n5SGEOGa5WHKFnmu2hBEofPxOD2nn5hSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlN2CqIACgkQykllyylKDCFK+gCfcVL6alupw81rOELTHHHUJ8Nk
YhoAnREGt2JVsPm2w/I4HuIlVqiosnCK
=KlEt
-----END PGP SIGNATURE-----

--n5SGEOGa5WHKFnmu2hBEofPxOD2nn5hSD--

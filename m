From: Michal Simek <monstr@monstr.eu>
Subject: Re: [LINUX PATCH] ARM: zynq: DT: Remove DMA from board DTs
Date: Tue, 29 Jul 2014 07:33:20 +0200
Message-ID: <53D73220.8040704@monstr.eu>
References: <1406564643-10417-1-git-send-email-soren.brinkmann@xilinx.com> <53D67B3C.3050401@suse.de>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="WcQJ1v8lQmWQwM5dhVx9FOalOMpL3Fgb2"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53D67B3C.3050401@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WcQJ1v8lQmWQwM5dhVx9FOalOMpL3Fgb2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 07/28/2014 06:33 PM, Andreas F=C3=A4rber wrote:
> Am 28.07.2014 18:24, schrieb Soren Brinkmann:
>> The DMA engine is enabled for all DTs that derive from zynq-7000.dtsi.=

>> There is no need to override the 'status' property in board DTs.
>>
>> Cc: Andreas F=C3=A4rber <afaerber@suse.de>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>> When the 'status' property was removed from the DMA node, this had bee=
n
>> overlooked.
>=20
> Indeed,
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Applied.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--WcQJ1v8lQmWQwM5dhVx9FOalOMpL3Fgb2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlPXMiQACgkQykllyylKDCE/1QCfRd6Cwp6cuVGqUmaTjoxD/RPj
PO0AniEik4vAR1ITapBTgVrpeKaqtUNM
=p78X
-----END PGP SIGNATURE-----

--WcQJ1v8lQmWQwM5dhVx9FOalOMpL3Fgb2--

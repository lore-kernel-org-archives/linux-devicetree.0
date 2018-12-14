From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH 0/6] microblaze: fix various problems in building boot
 images
Date: Fri, 14 Dec 2018 08:10:28 +0100
Message-ID: <35f7e803-05d0-2c6d-deac-b384b792a0cd@monstr.eu>
References: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="Vz0XmvhoUMSyYdlvCYBt0Nvp4MEVt6Zpn"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Vz0XmvhoUMSyYdlvCYBt0Nvp4MEVt6Zpn
Content-Type: multipart/mixed; boundary="JcLRu8QIj5rYPRcuIfnKQP4aJAYjD2v2k";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Message-ID: <35f7e803-05d0-2c6d-deac-b384b792a0cd@monstr.eu>
Subject: Re: [PATCH 0/6] microblaze: fix various problems in building boot
 images
References: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544182437-26660-1-git-send-email-yamada.masahiro@socionext.com>

--JcLRu8QIj5rYPRcuIfnKQP4aJAYjD2v2k
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07. 12. 18 12:33, Masahiro Yamada wrote:
> This patch set fixes various issues in microblaze Makefiles.
>=20
> V2 reflected Michal's comments, and cleaned up a little more.
>=20
> I did not add Michals' Acked-by.
> If this patch set goes to the MicroBlaze tree, he will add
> Signed-off-by anyway.
>=20
> This patch set is independent of Kbuild tree,
> so it should apply to MicroBlaze tree.
>=20
> Resolved the conflict with:
>=20
> commit 1e17ab5320a654eaf1e4ce121c61e7aa9732805a
> Author: Firoz Khan <firoz.khan@linaro.org>
> Date:   Tue Nov 13 11:34:34 2018 +0530
>=20
>     microblaze: generate uapi header and system call table files
>=20
>=20
>=20
>=20
> Masahiro Yamada (6):
>   microblaze: adjust the help to the real behavior
>   microblaze: move "... is ready" messages to arch/microblaze/Makefile
>   microblaze: fix multiple bugs in arch/microblaze/boot/Makefile
>   microblaze: add linux.bin* and simpleImage.* to PHONY
>   microblaze: fix race condition in building boot images
>   microblaze: remove the explicit removal of system.dtb
>=20
>  arch/microblaze/Makefile          | 22 ++++++++++++++--------
>  arch/microblaze/boot/Makefile     | 23 +++++++++--------------
>  arch/microblaze/boot/dts/Makefile |  5 +----
>  3 files changed, 24 insertions(+), 26 deletions(-)
>=20

Next time please also add v2 to subject.

Applied all.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs



--JcLRu8QIj5rYPRcuIfnKQP4aJAYjD2v2k--

--Vz0XmvhoUMSyYdlvCYBt0Nvp4MEVt6Zpn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlwTV2cACgkQykllyylKDCFXcQCbBq7Lg9jBy6mtSrDnGDyDMyph
lP0An3Us6AcLgNuE+oKpzuOAZcMmgXOl
=P+2O
-----END PGP SIGNATURE-----

--Vz0XmvhoUMSyYdlvCYBt0Nvp4MEVt6Zpn--

From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 0/3] mmc: Add APM X-Gene SoC SDHC controller support
 to Arasan SDHCI driver
Date: Wed, 04 Jun 2014 07:17:39 +0200
Message-ID: <538EABF3.7030809@monstr.eu>
References: <1401829985-5212-1-git-send-email-lho@apm.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="gdF7minM30r7KDeskjPNj6a1TcGtjBBFm"
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1401829985-5212-1-git-send-email-lho@apm.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Loc Ho <lho@apm.com>, chris@printf.net, ulf.hansson@linaro.org, michal.simek@xilinx.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gdF7minM30r7KDeskjPNj6a1TcGtjBBFm
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/03/2014 11:13 PM, Loc Ho wrote:
> This patch adds support for the APM X-Gene SoC SDHC controller to Arasa=
n
> SDHCI driver.
>=20
> v2:
> * Update binding documentation
> * Change compatible string from "xgene,arasan" to "apm,arasan"

Please write these changes directly to the patch version.
Hard to guess what you have changed in every patch.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--gdF7minM30r7KDeskjPNj6a1TcGtjBBFm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOOq/kACgkQykllyylKDCE8YACfdpeysntNAsEAKX80F3DgPpa9
CCwAn3qRcE8ge0gTVECDy84UCF0Cz0Kv
=Fw6l
-----END PGP SIGNATURE-----

--gdF7minM30r7KDeskjPNj6a1TcGtjBBFm--

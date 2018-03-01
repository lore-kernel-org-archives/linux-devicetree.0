From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v5 3/4] drivers: firmware: xilinx: Add sysfs interface
Date: Thu, 1 Mar 2018 14:32:24 +0100
Message-ID: <3e14f7b3-52e7-660a-a2f7-cc23b3262f0a@monstr.eu>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-4-git-send-email-jollys@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="T5SveNFf9S9pbl8ytpIx2dCLdT0veqDBk"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519154467-2896-4-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, rajanv@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T5SveNFf9S9pbl8ytpIx2dCLdT0veqDBk
Content-Type: multipart/mixed; boundary="XvUM08OxZLrZUW5ISXBJsNzdJnJoO3JTs";
 protected-headers="v1"
From: Michal Simek <monstr@monstr.eu>
Reply-To: monstr@monstr.eu
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org,
 mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk,
 sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org,
 dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, rajanv@xilinx.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jolly Shah <jollys@xilinx.com>
Message-ID: <3e14f7b3-52e7-660a-a2f7-cc23b3262f0a@monstr.eu>
Subject: Re: [PATCH v5 3/4] drivers: firmware: xilinx: Add sysfs interface
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-4-git-send-email-jollys@xilinx.com>
In-Reply-To: <1519154467-2896-4-git-send-email-jollys@xilinx.com>

--XvUM08OxZLrZUW5ISXBJsNzdJnJoO3JTs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.2.2018 20:21, Jolly Shah wrote:
> Add Firmware-ggs sysfs interface which provides read/write
> interface to global storage registers.
>=20
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> ---
>  .../ABI/stable/sysfs-driver-zynqmp-firmware        |  50 ++++

This file name has changed between v4 and v5. File from v4 was correct.
That's why I am waiting for v6 to be send before this is applied.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs



--XvUM08OxZLrZUW5ISXBJsNzdJnJoO3JTs--

--T5SveNFf9S9pbl8ytpIx2dCLdT0veqDBk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlqYAOsACgkQykllyylKDCF6ggCeIpeJunxbLo3V8NGfUDFPBu/y
L/oAoJU6oRhlFAjv39Mfw4wPs2HhB9Wi
=OP/I
-----END PGP SIGNATURE-----

--T5SveNFf9S9pbl8ytpIx2dCLdT0veqDBk--

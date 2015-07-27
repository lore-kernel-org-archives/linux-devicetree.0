From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFCv2 2/3] dts: zynq: Add devicetree entry for Xilinx Zynq reset
 controller.
Date: Mon, 27 Jul 2015 08:56:45 +0200
Message-ID: <55B5D62D.4010407@monstr.eu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-3-git-send-email-moritz.fischer@ettus.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="TfxtXMauaU6PxsA8Im7Dpgr4aDmhPiDOV"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437783682-13632-3-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, p.zabel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, soren.brinkmann@xilinx.com, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TfxtXMauaU6PxsA8Im7Dpgr4aDmhPiDOV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Moritz,

On 07/25/2015 02:21 AM, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi            | 43 ++++++++++++-

This patch is nice in general but every change in binding should be
discussed separately. There is also necessary to wire them up in the
driver to do action. That's why I think that will be the best just to
add the code to slcr and keep others untouched.

For example MACB/GEM is one example. Adding names to this node and
extending driver to work properly with reset means that all others MACB
users will be affected. Definitely this patch should be ACKed by Nicolas.=


Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--TfxtXMauaU6PxsA8Im7Dpgr4aDmhPiDOV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW11i0ACgkQykllyylKDCGcfgCdEMHME5zyRjXGrdtVST8BzWea
l80AoI1EABGrdKAXq9E/4FLAWVy2GaAf
=LASs
-----END PGP SIGNATURE-----

--TfxtXMauaU6PxsA8Im7Dpgr4aDmhPiDOV--

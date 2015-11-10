From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH] ARM: dt: zynq: Add labels to cpu nodes to allow
 overriding OPPs.
Date: Tue, 10 Nov 2015 09:19:33 +0100
Message-ID: <5641A895.6040200@monstr.eu>
References: <1447095111-22969-1-git-send-email-moritz.fischer@ettus.com>
 <20151109185555.GN6436@xsjsorenbubuntu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="A5xtu49TOa05SWe13xjaUu29d5vs5v3BD"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151109185555.GN6436@xsjsorenbubuntu>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Moritz Fischer <moritz.fischer@ettus.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A5xtu49TOa05SWe13xjaUu29d5vs5v3BD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/09/2015 07:55 PM, S=C3=B6ren Brinkmann wrote:
> On Mon, 2015-11-09 at 10:51AM -0800, Moritz Fischer wrote:
>> By adding labels to the cpu nodes in the dtsi, a dts that
>> includes it can change the OPPs by referencing the cpu0
>> through the label.
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> Reviewed-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

Applied to zynq/dt.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--A5xtu49TOa05SWe13xjaUu29d5vs5v3BD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlZBqJgACgkQykllyylKDCGY6gCeMDY9801obw/ClUwgr3sLBFRR
XdgAnA7Z7ovjas4DxAk6fchVoUuMPZ//
=ojG9
-----END PGP SIGNATURE-----

--A5xtu49TOa05SWe13xjaUu29d5vs5v3BD--

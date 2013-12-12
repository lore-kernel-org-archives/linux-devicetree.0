From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 1/9] arm: dt: zynq: Remove 'clock-ranges' from TTC
 nodes
Date: Thu, 12 Dec 2013 09:53:13 +0100
Message-ID: <52A97979.1030205@monstr.eu>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-2-git-send-email-soren.brinkmann@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="OjAdEDEBDNadJWo2w2aQl0EAdPDBqucPa"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385514296-26702-2-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OjAdEDEBDNadJWo2w2aQl0EAdPDBqucPa
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/27/2013 02:04 AM, Soren Brinkmann wrote:
> The bindings for the TTC changed in commit 'arm: zynq: Use standard
> timer binding' (e932900a3279b5dbb6d8f43c7b369003620e137c). That change
> removed possible subnodes from this driver rendering the 'clock-ranges'=

> property invalid for this node.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 2 --
>  1 file changed, 2 deletions(-)

I think this is completely unrelated to cpufreq and should just go
directly via arm-soc tree.
If yes, I will add 1/9 and 2/9 to zynq/dt branch.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--OjAdEDEBDNadJWo2w2aQl0EAdPDBqucPa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlKpeXkACgkQykllyylKDCHxYQCfSFe9fVvZqdzQ/938oJmripDg
gS8AnRZaMbXh1iwJuab7ocmgtZZ+RjDB
=rSGA
-----END PGP SIGNATURE-----

--OjAdEDEBDNadJWo2w2aQl0EAdPDBqucPa--

From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFCv2 1/3] docs: dts: Added documentation for Xilinx Zynq Reset
 Controller bindings.
Date: Mon, 27 Jul 2015 07:09:28 +0200
Message-ID: <55B5BD08.60802@monstr.eu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="5f472nWOnspB12ORGVaIKHmnf0NjLBxkt"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, p.zabel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5f472nWOnspB12ORGVaIKHmnf0NjLBxkt
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/25/2015 02:21 AM, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  Documentation/devicetree/bindings/reset/zynq-reset-pl.txt | 13 +++++++=
++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset-=
pl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt =
b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> new file mode 100644
> index 0000000..ac4499e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> @@ -0,0 +1,13 @@
> +Xilinx Zynq PL Reset Manager

here

> +
> +Required properties:
> +- compatible: "xlnx,zynq-reset-pl"

Currently it is not just PL reset controller.

> +- syscon <&slcr>;


missing : and please be more descriptive here.

> +- #reset-cells: 1
> +
> +Example:
> +	rstc: rstc@240 {
> +		#reset-cells =3D <1>;
> +		compatible =3D "xlnx,zynq-reset-pl";

Compatible property should go first.

I am missing that reg property

> +		syscon =3D <&slcr>;
> +	};
>=20

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--5f472nWOnspB12ORGVaIKHmnf0NjLBxkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW1vQ0ACgkQykllyylKDCEnbACeKC6q5FIlWJZBAh6py4EmeeR5
20gAn2ZP03LjhvL1iLC558Nmj8Xi+V1H
=u6Rw
-----END PGP SIGNATURE-----

--5f472nWOnspB12ORGVaIKHmnf0NjLBxkt--

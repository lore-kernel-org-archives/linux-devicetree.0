From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: DT: Fix GEM register area size
Date: Wed, 17 Sep 2014 07:25:38 +0200
Message-ID: <c52d905f-06e1-41a5-b79d-42c512f0ac27@BL2FFO11FD035.protection.gbl>
References: <1410880118-3494-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ESTdmtD3a2MFV6gPfPgvbaeuiGDLSTAQr"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410880118-3494-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--ESTdmtD3a2MFV6gPfPgvbaeuiGDLSTAQr
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/16/2014 05:08 PM, Soren Brinkmann wrote:
> The size of the GEM's register area is only 0x1000 bytes.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
> index 6cc83d4c6c76..3eb12f25e669 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -190,7 +190,7 @@
> =20
>  		gem0: ethernet@e000b000 {
>  			compatible =3D "cdns,gem";
> -			reg =3D <0xe000b000 0x4000>;
> +			reg =3D <0xe000b000 0x1000>;
>  			status =3D "disabled";
>  			interrupts =3D <0 22 4>;
>  			clocks =3D <&clkc 30>, <&clkc 30>, <&clkc 13>;
> @@ -199,7 +199,7 @@
> =20
>  		gem1: ethernet@e000c000 {
>  			compatible =3D "cdns,gem";
> -			reg =3D <0xe000c000 0x4000>;
> +			reg =3D <0xe000c000 0x1000>;
>  			status =3D "disabled";
>  			interrupts =3D <0 45 4>;
>  			clocks =3D <&clkc 31>, <&clkc 31>, <&clkc 14>;
>=20

Applied.

Thanks,
Michal


--ESTdmtD3a2MFV6gPfPgvbaeuiGDLSTAQr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQZG1IACgkQykllyylKDCFh7gCdHCCO/jlu8XvQpvbqXDx3wGVN
fT4Aniomht/A/AdDAHpZx4rJwXy2DOHk
=7eGI
-----END PGP SIGNATURE-----

--ESTdmtD3a2MFV6gPfPgvbaeuiGDLSTAQr--

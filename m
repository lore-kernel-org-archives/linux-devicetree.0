From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH -next] ARM: dts: sun8i: Add NFC node to Allwinner A23/A33
 SoC
Date: Wed, 6 Jul 2016 22:29:32 +0200
Message-ID: <20160706202932.GD4247@lukather>
References: <20160706003352.28194-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7082659391531342867=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160706003352.28194-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7082659391531342867==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 06, 2016 at 08:33:52AM +0800, Icenowy Zheng wrote:
> Add NAND Flash controller node definition to the A23/A33 SoC.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Has this ever been tested? On what board, with what NAND chip?

> ---
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun=
8i-a23-a33.dtsi
> index 7e05e09..270c38a 100644
> --- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
> @@ -209,6 +209,14 @@
>  					"apb2_uart3", "apb2_uart4";
>  		};
> =20
> +		nand_clk: clk@01c20080 {
> +			#clock-cells =3D <0>;
> +			compatible =3D "allwinner,sun4i-a10-mod0-clk";
> +			reg =3D <0x01c20080 0x4>;
> +			clocks =3D <&osc24M>, <&pll6 1>;
> +			clock-output-names =3D "nand";
> +		};
> +

This should be in a separate patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXfWosAAoJEBx+YmzsjxAgi2wQAKiRhb0ss9/iFXy6WX6K8ltY
juqxL8TjQges1boAMBZNNc03QTd9kfR00y5gnqhMUWp4DaR5uvPwpJTRZNTpLNcc
HfqWkKsBEP/zxbwkDepLDgdYF2+Q41yiHu+MQ3Uv7Nmk7xF5QjYdMkSEc0Uu87Xp
jB8h2j21ZP3IImcJeJVVViIaZ19JTQiDZ3xoRANy3MpDEUrtoci1Kt8ZVPCoGyEG
MBq3tb724l7QbJPv3jIghSHujyj722og48k7bQ0iOrN20Hqf6YA8hLzLGUOaIr/E
Fl4aY2QlJP1rIVyhnKTVxPZPq5RJZwAcGJq373lvhk6/mRC2iOMFf7YA8pBHIJ1J
o5cF7bfUfAqyoXqY/sgJCnRuid8C/GKIdtBLGbq1y+dl/68CqWAGJAZsAtGEKWuZ
HA0I6jhPoLf2aBD1kvH4HcGUQFZwSP9HBYSJboXMVHyeyRbXAOqVb70zAo5TK0mJ
vTarPG+rwmVmaIoIDJyIMB3Vwa/4WAcDDrwCuYrCOBGji9nsz1RfUMK2/QLenRJZ
afjA5S5MFzD2oWbECV48Xb7dSSvSfL3oNluvKvyyCDdhJSGRE/kmruh817ukbFBy
A0UjsLChvzO6pAMGFCz3tYe5hoGsKAsJELeYGuxRmskw5kVxl0hbfXGLS7/cAj9a
wdNGEPlSjqytYETu+Lxp
=XQ3v
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


--===============7082659391531342867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7082659391531342867==--

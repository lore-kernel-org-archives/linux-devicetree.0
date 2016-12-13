From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 6/6] ARM: dts: sun8i: raise the max voltage of DCDC2 in
 sun8i reference tablets
Date: Tue, 13 Dec 2016 20:14:59 +0100
Message-ID: <20161213191459.mmoejcmf26qqtyze@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-7-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4157733773419371474=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213152252.53749-7-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, Quentin Schulz <quentin.schulz@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org


--===============4157733773419371474==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ijclrd4p6cdc7ons"
Content-Disposition: inline


--ijclrd4p6cdc7ons
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:52PM +0800, Icenowy Zheng wrote:
> The "extremity_freq" frequency described in the original FEX files uses
> a voltage of 1.46v, which is beyond the current maximum voltage value of
> DCDC2 (Cortex-A7 supply) in the sun8i reference tablet DTSI file.
>=20
> Raise the maximum value to 1.46v.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi b/arch/=
arm/boot/dts/sun8i-reference-design-tablet.dtsi
> index 7ac8bb4bc95a..325ca5bd67a5 100644
> --- a/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
> +++ b/arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi
> @@ -180,7 +180,7 @@
>  &reg_dcdc2 {
>  	regulator-always-on;
>  	regulator-min-microvolt =3D <900000>;
> -	regulator-max-microvolt =3D <1400000>;
> +	regulator-max-microvolt =3D <1460000>;

This is outside of the voltage range tolerated by the CPU. NAK.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ijclrd4p6cdc7ons
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUEizAAoJEBx+YmzsjxAgMhIQAIirUYJInF3vD+4lzUqERJdk
niEDUJrZP/QZXcGOEDEiK0c+d0qvSHjrsnyfTwf+f8psnUWuhgPyfDVZBP2Za9du
azlcABzWGCD/GptkDOxHrmSKu6gNNuc9Q9RVACraSCMexUluHt7Bk+I4zhsTqkMS
mZiMgHLyAYZxUCm6fHUaKNQRJRFN24hKcGTtS+OobOlqmJtkGnAcUBF3P1lRxtho
4l0cw5oFUv2TJ9ImHWwAp7NPt8IC4g5hh+yl9QpzDQv0yTLKy3iTi62nRD7hOkdf
PniSEj7+MTHPqSLQdpLg7tfDP3V6L28opNATfDUTGwJB20VUvZnGy/hXXnQo6slz
Lc99/AWRFB1TSVEXYhu9ewKRp98me3NPYT9jHu7IGdKLNCDeHd+h02KYVRjmJ4jJ
s3HADUVnqe0ZG/8MQP96ZB5MWWL3beu01QvOl/kRJbveZKxvoMmhbDQSdJUNPJmY
mkc2nDQpskHjqtidr3MZY0ZYm2FOEOYlopBkqyyNM0MRdzjvJqhRyPq/4XepZjH5
KPVgFcHirj9udSZUQiLY5GPAsXzFwq0xoOHfbocxarzV11p0K0DxNKXMJMmksr1Y
z1sAyNNtf09cTy0sbEzWliIqPzHQmX0Jt7k4zSXWbvwaX+H77VLVZlfvjNoI6H1N
PU5tMVivDxS3K163NXRI
=PZLc
-----END PGP SIGNATURE-----

--ijclrd4p6cdc7ons--


--===============4157733773419371474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4157733773419371474==--

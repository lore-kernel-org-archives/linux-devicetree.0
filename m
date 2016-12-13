From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/6] ARM: dts: sun8i: add opp-v2 table for A33
Date: Tue, 13 Dec 2016 20:12:54 +0100
Message-ID: <20161213191254.pgcuvrpnebgw666g@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-5-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6901722562837239763=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161213152252.53749-5-icenowy@aosc.xyz>
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


--===============6901722562837239763==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nkhll3tmoidspbu2"
Content-Disposition: inline


--nkhll3tmoidspbu2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:50PM +0800, Icenowy Zheng wrote:
> An operating point table is needed for the cpu frequency adjusting to
> work.
>=20
> The operating point table is converted from the common value in
> extracted script.fex from many A33 board/tablets.
>=20
> 1.344GHz is set as a turbo-mode operating point, as it's described as
> "extremity_freq" in the FEX file. (the "max_freq" is 1.2GHz)
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm/boot/dts/sun8i-a33.dtsi | 38 ++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a=
33.dtsi
> index 504996cbee29..035c058324b8 100644
> --- a/arch/arm/boot/dts/sun8i-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
> @@ -46,7 +46,45 @@
>  #include <dt-bindings/dma/sun4i-a10.h>
> =20
>  / {
> +	cpu0_opp_table: opp_table0 {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		opp@648000000 {
> +			opp-hz =3D /bits/ 64 <648000000>;
> +			opp-microvolt =3D <1040000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};

Please add new lines between the nodes.

> +		opp@816000000 {
> +			opp-hz =3D /bits/ 64 <816000000>;
> +			opp-microvolt =3D <1100000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +		opp@1008000000 {
> +			opp-hz =3D /bits/ 64 <1008000000>;
> +			opp-microvolt =3D <1200000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +		opp@1200000000 {
> +			opp-hz =3D /bits/ 64 <1200000000>;
> +			opp-microvolt =3D <1320000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +		opp@1344000000 {
> +			opp-hz =3D /bits/ 64 <1344000000>;
> +			opp-microvolt =3D <1460000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +			turbo-mode;
> +		};

As far as I know, this OPP is not used by Allwinner, is not usable in
any A33 board so far (both the A33-olinuxino and the SinA33 do not
allow such a voltage on their CPU regulator), and overvolting and
overclocking is something that is very risky, and might lead to
stability issues.

Please remove this OPP.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nkhll3tmoidspbu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUEgyAAoJEBx+YmzsjxAgiF8P/0yVm5s6rvegpYfOz9HdGGZr
RZPI5n89Gwmirr9HzSm/mnYo4bXfO6LLmsAGJxIqz/wkIkF3xONfx8paprsmOHSd
V/J0Pqvn3oiyXFBqskCqCSsZw7voge8aM8lja0/ymPlzloNMV5GmPRH2Hdi/8Org
d3THl+8GMwpW23lzCWcoZuwLQpvqL4KJPZEe33/z7J1JQu1tFFN8Pa1OoQlXLl90
tQR7+YqhTZJsZM3af6GFZOzw+8XEt1UpHmtps5bpWV9cts+fDGfP8OXSbblLn/j1
Crs4TTpNw2v0VYNp4Q9imOnzgSDYZIbrOU4xtf2HAIMTbmVWurmnNK8DumgpmcC1
se5hG0TLr+oHdk7w1RVBviE/cK+X4bc5bSZ5jEMjwa7C6xpxWyTD7e73TKJE38IT
8XgZTGfoj0K5BlDWADHI9zS5e8m2SqK+0U2J8lR/8Cu+T1eU/4W7QQLMb84zSUkO
5sRts33y9Pehlf8Ueg7rP6uyxxy00AoEhqcpUpl9RIG73qsaY49V8LzUvvO8qpQT
fprY3MF+Snq3RmXR1a3xxP5U76ZdrFj3e6dHE+JhtWqL2R9QORPMBJ6sYo/XWJNy
1SPqIbP0CuTYci9A0kmuACRsT6XyozqXESpSUNFXwMOFUwwmFPmRms6tylCcN0n1
QJEmXU7jHrwJQLVRyQ8k
=S7WT
-----END PGP SIGNATURE-----

--nkhll3tmoidspbu2--


--===============6901722562837239763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6901722562837239763==--

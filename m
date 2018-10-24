From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 13/15] dt-bindings: sun6i-dsi: Add compatible for A64
 DPHY
Date: Wed, 24 Oct 2018 19:09:27 +0100
Message-ID: <20181024180927.ejt7odo23ebzjgfg@flea>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-14-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0604634869=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181023155035.9101-14-jagan@amarulasolutions.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0604634869==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ui6phgloguktf2lb"
Content-Disposition: inline


--ui6phgloguktf2lb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 23, 2018 at 09:20:33PM +0530, Jagan Teki wrote:
> The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
> on the one on A31.
>=20
> Add A64 compatible and append A31 compatible as fallback.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - new patch
>=20
>  Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> index 9fa6e7a758ad..704fb31962f2 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
> @@ -36,7 +36,7 @@ D-PHY
> =20
>  Required properties:
>    - compatible: value must be one of:
> -    * allwinner,sun6i-a31-mipi-dphy
> +    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"

No. you need both. The A64 MIPI DPHY one needs to be always set with
the A31 fallback, but the A31 is also usable on its own.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ui6phgloguktf2lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCW9C1VwAKCRDj7w1vZxhR
xXuTAQDzCZHL9SXKlA1ovDyGvoJ1vBXyWfqzogsxrCg1RyCHYwEAsrgUwe59jxcD
kH3hkhaPYhxxvs8q/HSGKCfBCvlZQQ8=
=aytP
-----END PGP SIGNATURE-----

--ui6phgloguktf2lb--

--===============0604634869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0604634869==--

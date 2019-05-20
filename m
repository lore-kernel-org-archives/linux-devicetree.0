From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Mon, 20 May 2019 09:35:29 +0200
Message-ID: <20190520073529.nxptfbibexrqyzfi@flea>
References: <20190518152355.11134-1-peron.clem@gmail.com>
 <20190518152355.11134-2-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vfqfe4etmgwkzfrf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190518152355.11134-2-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--vfqfe4etmgwkzfrf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2019 at 05:23:52PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a similar watchdog as the A64 which is already
> a compatible of the A31.
>
> This commit sort the lines and add the H6 compatible.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/sunxi-wdt.txt         | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/D=
ocumentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> index 46055254e8dd..f4810f8ad1c5 100644
> --- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
> @@ -3,10 +3,12 @@ Allwinner SoCs Watchdog timer
>  Required properties:
>
>  - compatible : should be one of
> -	"allwinner,sun4i-a10-wdt"
> -	"allwinner,sun6i-a31-wdt"
> -	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> -	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"

That sorting was kind of intentional

> +	- "allwinner,sun4i-a10-wdt"
> +	- "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
> +	- "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
> +	  "allwinner,sun6i-a31-wdt"

Is there a reason to keep the A64 compatible?

Thanks,
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vfqfe4etmgwkzfrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJYwQAKCRDj7w1vZxhR
xXf6AP44cA+X4inPt5m68fMkXQhL5OKxaZuNzsYSfVYbEOvP8QEA4EEwKgv3Sny9
0nDVY1voirnIU5xZoN2wii6g2sl5kgc=
=tx0L
-----END PGP SIGNATURE-----

--vfqfe4etmgwkzfrf--

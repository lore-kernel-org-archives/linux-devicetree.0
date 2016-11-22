From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: specify max width for display node
Date: Tue, 22 Nov 2016 12:27:33 +0200
Message-ID: <77c993f3-1b5f-94cf-c4bc-8a30148e0a4d@ti.com>
References: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1256482072=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============1256482072==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HDJd31sSdheLSB2bvS5ofVJeIWiMINVf0"

--HDJd31sSdheLSB2bvS5ofVJeIWiMINVf0
Content-Type: multipart/mixed; boundary="qUvnw3SU7kuXgTTQW9prWlu8KH0v2PI9u";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <77c993f3-1b5f-94cf-c4bc-8a30148e0a4d@ti.com>
Subject: Re: [PATCH] ARM: dts: da850: specify max width for display node
References: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com>
In-Reply-To: <1479807775-28283-1-git-send-email-bgolaszewski@baylibre.com>

--qUvnw3SU7kuXgTTQW9prWlu8KH0v2PI9u
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/11/16 11:42, Bartosz Golaszewski wrote:
> It has been determined that the highest resolution supported correctly
> by LCDC rev1 is 800x600 on da850 due to memory bandwidth constraints.
>=20
> Set the max_width property in da850.dtsi to 800.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dts=
i
> index 36066fa..0876238 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -441,6 +441,7 @@
>  			compatible =3D "ti,da850-tilcdc";
>  			reg =3D <0x213000 0x1000>;
>  			interrupts =3D <52>;
> +			max-width =3D <800>;
>  			status =3D "disabled";
>  		};
>  	};
>=20

Does 1024x768@10 work?

The max-width should be the hardware's maximum supported width, not used
for bandwidth. tilcdc has max-bandwidth property for that.

 Tomi


--qUvnw3SU7kuXgTTQW9prWlu8KH0v2PI9u--

--HDJd31sSdheLSB2bvS5ofVJeIWiMINVf0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYNB2VAAoJEPo9qoy8lh71OXAP/1kXj0v0Bmou9qukhF2Oo3yh
n9TE43dLpGTlT8PmwD6a71aQ0JjOu3WEwbUhWQ9HkXS2yHs04cTCWScREBmdummz
gebeBPn1ncAzVW2se42UiD/9qLPpQ0gkugFXe5OQscbUdD0nMYth25LTDC5UeNbY
nvy1u9jXWlKpiO3DNmwK6bFieg0TZJXmkBL+vEu091YpKxwUHGKHIa8bX35aH7u0
rmTy4EkYY+wIdnxTnOnVmoHgyKhByGbeDzCLaW/mf2M4Yb9zsy2giNLpGYJZrsH5
zOqapS8JaNE1Bax9dsRFqrwoKU0Lxssokg/UfcrV1GQ5WUdaJHqLJnjp0JI6YkTJ
sRbH4iuXRFqoFvSmyZJVGrLVFokz4m+CtgpSHZmZm6m7SM5TEakx8Y0zndjEg3hb
yv2Z7AgCw/xdeHK6jqtpk03e5/+80SlKhbgFdI+EDiOpdgzsQFdm3L539NscuVbT
v5yK5h8kvJ1AwADJ0ZGPpnU0dGHLo8GzZl+UTZLhBQnuAyTIsbfkmcuKr+KFBQPI
PiwfRzLRW0rDijYgQ2zq5mSQUgDos1+mElQGkI4UsQQa+hrXO14GeLvVhZmlu7pF
F4WzXN6UKXlFQcDg6SGujuLZPGorh/MROAQx6a5Q9XP7ca66l8v+gX5EWEW8To/q
9eCvHyAAjvFR2Dl+WvzN
=LUe7
-----END PGP SIGNATURE-----

--HDJd31sSdheLSB2bvS5ofVJeIWiMINVf0--

--===============1256482072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1256482072==--

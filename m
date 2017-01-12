From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 6/6] fbdev/ssd1307fb: add support to enable VBAT
Date: Thu, 12 Jan 2017 14:05:07 +0200
Message-ID: <d06c3a64-7627-2553-84e5-491a5acbe0de@ti.com>
References: <cover.1484219137.git.jsarha@ti.com>
 <c394e52447ed45fff9672eb3e3bb6729bea87ee7.1484219137.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature";
        boundary="iO5S5Jp95S4tltRx2hhnGQkHtpuIpiEC5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c394e52447ed45fff9672eb3e3bb6729bea87ee7.1484219137.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

--iO5S5Jp95S4tltRx2hhnGQkHtpuIpiEC5
Content-Type: multipart/mixed; boundary="OkBlnvfVts9UPWdRSKip4kfGbXsErpOm3";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Message-ID: <d06c3a64-7627-2553-84e5-491a5acbe0de-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 6/6] fbdev/ssd1307fb: add support to enable VBAT
References: <cover.1484219137.git.jsarha-l0cyMroinI0@public.gmane.org>
 <c394e52447ed45fff9672eb3e3bb6729bea87ee7.1484219137.git.jsarha-l0cyMroinI0@public.gmane.org>
In-Reply-To: <c394e52447ed45fff9672eb3e3bb6729bea87ee7.1484219137.git.jsarha-l0cyMroinI0@public.gmane.org>

--OkBlnvfVts9UPWdRSKip4kfGbXsErpOm3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/17 13:16, Jyri Sarha wrote:
> From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>=20
> SSD1306 needs VBAT when it is wired in charge pump configuration. This
> patch adds support to the driver to enable VBAT regulator at init time.=

>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/ssd1307fb.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/=
Documentation/devicetree/bindings/display/ssd1307fb.txt
> index 6617df6..209d931 100644
> --- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
> +++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
> @@ -16,6 +16,7 @@ Required properties:
>  Optional properties:
>    - reset-gpios: The GPIO used to reset the OLED display, if available=
=2E See
>                   Documentation/devicetree/bindings/gpio/gpio.txt for d=
etails.
> +  - vbat-supply: The supply for VBAT
>    - solomon,segment-no-remap: Display needs normal (non-inverted) data=
 column
>                                to segment mapping
>    - solomon,com-seq: Display uses sequential COM pin configuration
>=20

It's rather confusing to have two patches with identical subjects and
descs (this and 4). And there's even an unrelated patch in between this
and the driver change...

 Tomi


--OkBlnvfVts9UPWdRSKip4kfGbXsErpOm3--

--iO5S5Jp95S4tltRx2hhnGQkHtpuIpiEC5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYd3DzAAoJEPo9qoy8lh71v0sQAI8Ebu7N3QP3+qW+jJu49dob
L9HplBAVetJ+4nuImRx9kyoJ7dHJMUJd5xUpTsplKZ116wukWGfDMwaAXJeKkwpR
pqD5LLowOQlgZgBj9v/0UNvhtTp6XHjVSv02TOB01wiG4rOl4IbsBnnt1VY9AOBd
6EwWtUblS5TvEKulRJI4UeCoBA8Qz4lDjaX79tlZ5jrdf97PLmxoKfYxV06BTYzk
QGGbMzOdsGtZn4SpPScEZcRW3I2+sNZM4m97/xxTk9nhtwFWZdTiV1CU3XYyHFj4
hwUSqFtBxYlvxl6rCRDRf7cocUMwaO843du9IYfdGVpfg+TWwIZGwL7W6Vizmv6o
2tpUA2PpDXMJzt1ukgTxDMTfR7ks3IDjmIQOb6NzfenoylazetadDVmRDGYAgOeN
TEL4jrbNPra2uPsTkL7x2rM3WNWQO8ABN8DmtgzC/rGFYUtyBYAQMWCKo9rPMTwS
gQLm4+g942qZFWqBQDg/uZyJ3mH01Lpy5zn8e7BAANc4TRB36U0cmadtwZ4hTRyL
Kmn10/b91+pcAv866NeiWZDJO4lVNKrTuZXuA7poA4IWGGr17OfHYTzgsGfImfub
JXxEMEEUljjXDPCXLYjXUhhvnA3EGX2ftHbEK9Dui3RCJylsRpJliE0fJW23HmKl
RjL11JhWSwezZeWc3aWE
=A2vc
-----END PGP SIGNATURE-----

--iO5S5Jp95S4tltRx2hhnGQkHtpuIpiEC5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

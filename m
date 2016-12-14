From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v7 1/5] ARM: dts: da850: rename the display node label
Date: Wed, 14 Dec 2016 11:57:13 +0200
Message-ID: <750eaa32-ca29-b140-eec6-cec4350cf304@ti.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0226704285=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-2-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0226704285==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pP7UXits4B5tOKriFq5t6D34gVvTGPaVV"

--pP7UXits4B5tOKriFq5t6D34gVvTGPaVV
Content-Type: multipart/mixed; boundary="es6xhG8N4xBqMI6errxbUaliMKLNoLjjA";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King
 <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>
Message-ID: <750eaa32-ca29-b140-eec6-cec4350cf304@ti.com>
Subject: Re: [PATCH v7 1/5] ARM: dts: da850: rename the display node label
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-2-git-send-email-bgolaszewski@baylibre.com>
In-Reply-To: <1481623759-12786-2-git-send-email-bgolaszewski@baylibre.com>

--es6xhG8N4xBqMI6errxbUaliMKLNoLjjA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13/12/16 12:09, Bartosz Golaszewski wrote:
> The tilcdc node name is 'display' as per the ePAPR 1.1 recommendation.
> The label is also 'display', but change it to 'lcdc' to make it clear
> what the underlying hardware is.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dts=
i
> index 104155d..6b0ef3d 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -458,7 +458,7 @@
>  			dma-names =3D "tx", "rx";
>  		};
> =20
> -		display: display@213000 {
> +		lcdc: display@213000 {
>  			compatible =3D "ti,da850-tilcdc";
>  			reg =3D <0x213000 0x1000>;
>  			interrupts =3D <52>;
>=20

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--es6xhG8N4xBqMI6errxbUaliMKLNoLjjA--

--pP7UXits4B5tOKriFq5t6D34gVvTGPaVV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYURd5AAoJEPo9qoy8lh71CuQP/i3X5FORzbNMrPhkbXDpzdTZ
y+Oh9dH6IZsk0a9dozZlhmRjpKJ1Z+4TMghNcqC4RNq5cQNt4UQcTtunj9K1+1hz
RBIy1Fm9TAPUaD1Z1n+TmJpCoBvq701IsE4WMVIrb64n0SCNuriH3881YpVTBFBQ
izZtpLXwDIzkW1SASQae3g33bzL7FrXRr4WOU4RSw+6p3+3dNozuxqmBLo4mjSpu
hffh86WmIztMsEMuDPbc+7MTaUKUgj931Zk4findqsAlad6wmIVKHTmp8C8M8JXT
N99Fz0xa7OZRozARbjVdfHp5KKryGa++z7akldpYXTKWXxY/xGp8k67Yi2O3TSTL
RWRoyh0tf92ywPTnWiFq9ARJ9oBXzzt3i2a6WsthsHfOC8zWW+zFrFtV7ju3w+mM
cixt0gELZUqCZL7DfwvoU42Yjh9X/WzjPg0Liq6kX/kOrc5/x0lp/bPbB8gslDSL
bilpU1IvDdDoP1oIdquNdyAz7YCI+dKAXorW10xok6WPj2Z+Ua/6ia6rHGLtU6Xm
hJ/mkRyWiBPJBS/v1CwNuLGGbe35baMemy2eJcX9xNDZF/mrj11L9ACELLt4YG/H
zaKVb5Lzalv2Coh5SZch7Wv2yOgzMB4QxNsESIwMOSuC3ev2AHMTJ4CLLRp5P7Ug
2oNVQ2GlcFEuH0g31FJq
=QDyA
-----END PGP SIGNATURE-----

--pP7UXits4B5tOKriFq5t6D34gVvTGPaVV--

--===============0226704285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0226704285==--

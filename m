From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 0/8] drm/tilcdc: Address LCDC rev 2 color errata +
 other fixes
Date: Thu, 1 Sep 2016 10:24:48 +0300
Message-ID: <43d0d368-f19a-a098-0641-8d4314815d80@ti.com>
References: <cover.1472634657.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1638233650=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1472634657.git.jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com, linux-arm-kernel@lists.infradead.org
Cc: peter.ujfalusi@ti.com, kbeldan@baylibre.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

--===============1638233650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Rkufp2DpDNcsujj8M8lhSgWTXQklGHenk"

--Rkufp2DpDNcsujj8M8lhSgWTXQklGHenk
Content-Type: multipart/mixed; boundary="17X4JDIBCun06qWwNCsRXQEjFtGi7EkhK";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com,
 linux-arm-kernel@lists.infradead.org
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 peter.ujfalusi@ti.com, robh@kernel.org, kbeldan@baylibre.com
Message-ID: <43d0d368-f19a-a098-0641-8d4314815d80@ti.com>
Subject: Re: [PATCH v3 0/8] drm/tilcdc: Address LCDC rev 2 color errata +
 other fixes
References: <cover.1472634657.git.jsarha@ti.com>
In-Reply-To: <cover.1472634657.git.jsarha@ti.com>

--17X4JDIBCun06qWwNCsRXQEjFtGi7EkhK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31/08/16 16:14, Jyri Sarha wrote:
> Changes since v2:
> - Fiddle with color wiring propety once more, now it follows this Tomi'=
s
>   comment:
>   - No property set: driver advertises RG16 and RG24. This is
>     wrong, but that's what the current status is, right?
>   - Property set to "default" or "straight" or whatever: driver
>     says RG16 and BG24
>   - Property set to "crossed": driver says BG16 and RG24
> - Add v2 version of "drm/tilcdc: Write DMA base and ceiling address wit=
h..."
>   - The first version was sent individually, this second version has
>     __iowmb(); and __cpu_to_le64(); added to tilcdc_write64()
>=20
> Changes since v1:
> - Change the blue-and-red-wiring property to boolean blue-and-red-cross=
ed
>   - This breaks to little backward compatibility the earlier series had=
, but
>     makes the binding more straight forward
>   - This changes requires changes to am335x-evm and am335x-evmsk dts-fi=
les
>   - The old beaglebone-black dts files remain compatible, but the patch=

>     suggests in commenst on how to support 24-bit RGB mode with BBB
>=20
> The first patch ("drm/tilcdc: Remove drm_helper_disable_unused_function=
s()
> call") is completely independent fix.
>=20
> The red and blue components are reversed between 24 and 16 bit modes
> on am335x LCDC output pins. To get 24 RGB format the wires red and
> blue wires has to be crossed and this in turn causes 16 colors output
> to be in BGR format. With straight wiring the 16 color is RGB and 24
> bit is BGR. These patches try to deal with the issue in reasonable
> manner.
>=20
> For more details see section 3.1.1 in AM335x Silicon Errata:
> http://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumb=
er=3Dsprz360

Aside the few minor comments I had, for the series:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--17X4JDIBCun06qWwNCsRXQEjFtGi7EkhK--

--Rkufp2DpDNcsujj8M8lhSgWTXQklGHenk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXx9fAAAoJEPo9qoy8lh71DP8P/R3OHyQqQbiSaFJx7b+TF/Vp
BwVfV6frctlzErCrspXeWtgtAQCjjJBScW7fY2xzfwo3hwwVqNtt+hG3jOh6vzU+
dVief3RMIYKw4fH3xQgIC9kYQYoOb8cIb4kbZoNbN/gKL+L3vhICXBnCwBer3qsp
+vYqb7ox4iKzLy1YBXlalLK2xYrpWk25q7JN9sydLJ35g8tR4rV4nEVZOEnc/11D
jJ+E/ExKiHrrcbqV1rYDQhTILmCd44kl+ZMbhl/bw2hPPuMOdRWx5RIv5o9FvDkJ
HyL+/0MYTNCoTCUYaD+ivaXeIvE99+tTsX8kBB3xyz6wOkbTBd03CC8ZV1Nttvus
H48lKSL1slNCbOmZPADAJmVcU6TSR3RMHfhj8YOjHoHd1cyCI1ySTK8hu3UXlFjX
C2+DHi8BJf1OOTgZ5NXf7qCdS+28fJQi9T5IvZOrPfkNKtheprO6fjGnPdo4J4xG
4/0pLnJHN4xEn1Oq+W8vlgcfyw6A8wSjnnU2/vTh8nh2wqpji9vtLrHMwwoWHGii
sCVgvXuqO0rOTBVf49Z0fitg8W0yPWcrkE594VDhO53WcdrEZZ1Z96jni+oHUQNg
O7LYc73WUlZAjZEj1YDzRXJKjZpvG3Xnr0l9KZJRpLPoIXuPJBXdBjmjbdrPdjmP
KZ27oZ+xiu38bBtIicU4
=XXMf
-----END PGP SIGNATURE-----

--Rkufp2DpDNcsujj8M8lhSgWTXQklGHenk--

--===============1638233650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1638233650==--

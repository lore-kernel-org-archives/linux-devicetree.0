From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 3/8] drm/tilcdc: Add blue-and-red-crossed devicetree
 property
Date: Thu, 1 Sep 2016 10:19:19 +0300
Message-ID: <64641724-24d8-47ff-92ad-7f05f86669da@ti.com>
References: <cover.1472634657.git.jsarha@ti.com>
 <1fc6a6bb5b56b9bac845502b0724d7a07f0675fb.1472634657.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0744496396=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1fc6a6bb5b56b9bac845502b0724d7a07f0675fb.1472634657.git.jsarha@ti.com>
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

--===============0744496396==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3IWlJ9alxL2PAraXx9pVcVjC2ekcv1t1w"

--3IWlJ9alxL2PAraXx9pVcVjC2ekcv1t1w
Content-Type: multipart/mixed; boundary="h3tj3Iibu9n8LAoTe6UbIbrB3ObdJMGTA";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com,
 linux-arm-kernel@lists.infradead.org
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 peter.ujfalusi@ti.com, robh@kernel.org, kbeldan@baylibre.com
Message-ID: <64641724-24d8-47ff-92ad-7f05f86669da@ti.com>
Subject: Re: [PATCH v3 3/8] drm/tilcdc: Add blue-and-red-crossed devicetree
 property
References: <cover.1472634657.git.jsarha@ti.com>
 <1fc6a6bb5b56b9bac845502b0724d7a07f0675fb.1472634657.git.jsarha@ti.com>
In-Reply-To: <1fc6a6bb5b56b9bac845502b0724d7a07f0675fb.1472634657.git.jsarha@ti.com>

--h3tj3Iibu9n8LAoTe6UbIbrB3ObdJMGTA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 31/08/16 16:14, Jyri Sarha wrote:
> Add "blue-and-red-wiring"-device tree property and update devicetree
> binding document. The red and blue components are reversed between 24
> and 16 bit modes on am335x LCDC output pins. To get 24 RGB format the
> red and blue wires has to be crossed and this in turn causes 16 colors
> output to be in BGR format. With straight wiring the 16 color is RGB
> and 24 bit is BGR. The new property describes whether the red and blue
> wires are crossed or not. If the property is not present or its value
> is not recognized the legacy mode is assumed. The legacy configuration
> supports RGB565, RGB888 and XRGB8888 formats. However, depending on
> wiring, the red and blue colors are swapped in either 16 or 24-bit
> color modes.
>=20
> For more details see section 3.1.1 in AM335x Silicon Errata:
> http://www.ti.com/general/docs/lit/getliterature.tsp?baseLiteratureNumb=
er=3Dsprz360
>=20
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt  | 22 ++++++++++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 42 ++++++++++++++=
++++++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  4 +++
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c              |  9 ++---
>  4 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.tx=
t b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> index 6efa4c5..5b7b5f8 100644
> --- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> +++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
> @@ -17,6 +17,18 @@ Optional properties:
>     the lcd controller.
>   - max-pixelclock: The maximum pixel clock that can be supported
>     by the lcd controller in KHz.
> + - blue-and-red-wiring: Recognized values "default", "straight" or
> +   "crossed". This property deals with the LCDC revision 2 (found on
> +   AM335x) color errata [1].
> +     - "default" and "straight" indicates normal wiring that supports

I didn't mean to add two values for this =3D). Just use one, there's no
benefit in supporting multiple values meaning the same thing.

 Tomi


--h3tj3Iibu9n8LAoTe6UbIbrB3ObdJMGTA--

--3IWlJ9alxL2PAraXx9pVcVjC2ekcv1t1w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXx9Z4AAoJEPo9qoy8lh71UM8P/RvUwAQCRuIjbZCQSr1tM+QJ
v5QYMz5E4p1RKh2xEipTQ7G/+nyQVtXr4sZucmqhFIE49MG8x+hWK0D/9rWcGqvt
Dqzvo6MEZqzz0LevjFJh3pwUxusutcPGHWvyCq/ghu7ndX4JJOYyDw7NHlW41bam
HTM/z4f2iEk1FCfj+xMXPX0Y2fQElmN+LvDW2jG/91/PrU/UyEwn4x/HGxP11P/k
hP001OpW0CdqbRZfgZ/FHY4qVyhxw/sEzs6ZawKkIV2AZacU/ETGtuXns6wq5qmh
izvLZ7Hd1ewmjOy3mEkyXwTt803CAqpGPpR5x1RK6dMRiW+7nM1ohMHbhMMUcjtH
LKEDn52N9i3jBcPU1+fvQo11bUmp9U8K93TVLYwZrJE3DLoZdXu6GH18V9sPDrq9
MVCFUI0E08vofpcdLl5lMOkymHSOzoMqyEaiTJ7qinZKXJK9AaeblxMRrdgzxgVE
EiYiV7E4YwhXF6jQJH3sxXZLNzjcpECi7y18Q+YfooJey3QaPfodR8+yO5YpXCRN
YQbx/z4/3t7kaCIoqg7wEmJTdxO9UaG5rNxVEu74nQD23soiWakuwvEUFHGzFEP3
cy70uTJ7/ir/DZmyboQBBgczfdn4GasoC1iGXdw6Bru4mx62L/XqxkWmjPQ7+Gv4
6pi7UkZ+yavrqqtwEt4B
=fwCD
-----END PGP SIGNATURE-----

--3IWlJ9alxL2PAraXx9pVcVjC2ekcv1t1w--

--===============0744496396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0744496396==--

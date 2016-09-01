From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 2/8] drm/tilcdc: Write DMA base and ceiling address
 with single instruction
Date: Thu, 1 Sep 2016 10:13:08 +0300
Message-ID: <0f92d770-3a76-1495-cef2-a5f2230b4a07@ti.com>
References: <cover.1472634657.git.jsarha@ti.com>
 <82b100a090a929ac30d1d47687cb5726b93a929e.1472634657.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1365500991=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <82b100a090a929ac30d1d47687cb5726b93a929e.1472634657.git.jsarha@ti.com>
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

--===============1365500991==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lo6Ff3ud9X0TBGbI09Xrn8VJS9Nwra4Wj"

--lo6Ff3ud9X0TBGbI09Xrn8VJS9Nwra4Wj
Content-Type: multipart/mixed; boundary="R7RfdtewsmM5h7Fpm8psdoGENdjNTE1xV";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com,
 linux-arm-kernel@lists.infradead.org
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 peter.ujfalusi@ti.com, robh@kernel.org, kbeldan@baylibre.com
Message-ID: <0f92d770-3a76-1495-cef2-a5f2230b4a07@ti.com>
Subject: Re: [PATCH v3 2/8] drm/tilcdc: Write DMA base and ceiling address
 with single instruction
References: <cover.1472634657.git.jsarha@ti.com>
 <82b100a090a929ac30d1d47687cb5726b93a929e.1472634657.git.jsarha@ti.com>
In-Reply-To: <82b100a090a929ac30d1d47687cb5726b93a929e.1472634657.git.jsarha@ti.com>

--R7RfdtewsmM5h7Fpm8psdoGENdjNTE1xV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31/08/16 16:14, Jyri Sarha wrote:
> Write DMA base and ceiling address with a single instruction, if
> available. This should make it more unlikely that LCDC would fetch the
> DMA addresses in the middle of an update. Having bad combination of
> addresses in dma base and ceiling (e.g base > ceiling) can cause
> unpredictaple behavior in LCDC.
>=20
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c |  9 +++++++--
>  drivers/gpu/drm/tilcdc/tilcdc_regs.h | 14 ++++++++++++++
>  2 files changed, 21 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/til=
cdc/tilcdc_crtc.c
> index 6350f2a..41ec5b3 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -70,6 +70,7 @@ static void set_scanout(struct drm_crtc *crtc, struct=
 drm_framebuffer *fb)
>  	struct drm_gem_cma_object *gem;
>  	unsigned int depth, bpp;
>  	dma_addr_t start, end;
> +	u64 dma_base_and_ceiling;
> =20
>  	drm_fb_get_bpp_depth(fb->pixel_format, &depth, &bpp);
>  	gem =3D drm_fb_cma_get_gem_obj(fb, 0);
> @@ -80,8 +81,12 @@ static void set_scanout(struct drm_crtc *crtc, struc=
t drm_framebuffer *fb)
> =20
>  	end =3D start + (crtc->mode.vdisplay * fb->pitches[0]);
> =20
> -	tilcdc_write(dev, LCDC_DMA_FB_BASE_ADDR_0_REG, start);
> -	tilcdc_write(dev, LCDC_DMA_FB_CEILING_ADDR_0_REG, end - 1);
> +	/* Write DMA base and ceiling address with a single insruction,
> +	 * if available. This should make it more unlikely that LCDC would
> +	 * fetch the DMA addresses in the middle of an update.
> +	 */

I think it would be good to have the register names mentioned in the
above comment. Otherwise I can imagine grepping for CEILING_ADDR, and
not finding it set anywhere in the driver...

 Tomi


--R7RfdtewsmM5h7Fpm8psdoGENdjNTE1xV--

--lo6Ff3ud9X0TBGbI09Xrn8VJS9Nwra4Wj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXx9UEAAoJEPo9qoy8lh710H0P/0FYu12JdB0NAYVApFGg8r1u
kuyOfPsp7+JqogfejZQ1WrznMyMh8ONmAfXpA1l92TxJnWZkUjg+R7KiUeIQ73Ue
3BDEbzdZMkxYU13MxywifPZTQ9KTpN4BNT5NTz14bLzzMiu/arpw7Th+WwuyqpzF
ygZqPozC5sJcDG62cEtHgzdDu5299JXiR5K4yUviN3n708dHT+PSbimIh7vzrB8F
66ijmvkhpPye4UEW71D9Aue8pW8xuvkk/TB0GCt6tXzjKRMcNI0UCOzwuj2GyME5
aB42Fses7GUBZaDfXahvqGzGrTRdYqASSpscI7bjF2wJZmi+vCsxVFXrBLywcf24
HFc7+s493R5e4hWJRdWbWkGirm3revfB5DH9msULa/FaaPXiw7yRAzSbKNssdp8W
zzvWJdQQUc5uN2tXtFPKwW+Ywdzai5coHNqAEawFmUrrlVqCYIEtDYVgx5k80Yyo
4qCnY9OgVzKOTGjnda35g2+6kQS2oceKHOGFmXpHnwMNDEahBEF9k/+iJY2EHTJ2
+q9F/i2r6pnB8QLraAIBY1RgY8fRyMHxxBBsmRehArB501lOmKr8FxrXtyMmTDgk
nbw19ZyZ3yzrkGBDcCPBQxST0O+z5SrDKu5KHBmt/PXEwNrCLmYF7TgZ7/2MxbWh
5yz57Qu2Mh+kS6ZAS8ZU
=Chrn
-----END PGP SIGNATURE-----

--lo6Ff3ud9X0TBGbI09Xrn8VJS9Nwra4Wj--

--===============1365500991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1365500991==--

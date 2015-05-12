From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC v9.5 09/20] drm/dsi: Add a helper to get bits per
 pixel of MIPI DSI pixel format
Date: Tue, 12 May 2015 15:36:21 +0200
Message-ID: <20150512133620.GA24939@ulmo.nvidia.com>
References: <1423805119-32008-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1888517824=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423805119-32008-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Liu Ying <Ying.Liu@freescale.com>
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, daniel.vetter@ffwll.ch, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org


--===============1888517824==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 01:25:19PM +0800, Liu Ying wrote:
> Signed-off-by: Liu Ying <Ying.Liu@freescale.com>

This could use a commit message. Describe for example why this is useful
or when to use it.

> ---
> v9->v9.5:
>  * Add kernel-doc for the new helper function to address Daniel Vetter's
>    comment.
>=20
> v8->v9:
>  * Rebase onto the imx-drm/next branch of Philipp Zabel's open git reposi=
tory.
>=20
> v7->v8:
>  * None.
>=20
> v6->v7:
>  * None.
>=20
> v5->v6:
>  * Address the over 80 characters in one line warning reported by the
>    checkpatch.pl script.
>=20
> v4->v5:
>  * None.
>=20
> v3->v4:
>  * None.
>=20
> v2->v3:
>  * None.
>=20
> v1->v2:
>  * Thierry Reding suggested that the mipi_dsi_pixel_format_to_bpp() funct=
ion
>    could be placed at the common DRM MIPI DSI driver.
>    This patch is newly added.
>=20
>  include/drm/drm_mipi_dsi.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index f1d8d0d..cabc910 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -163,6 +163,28 @@ static inline struct mipi_dsi_device *to_mipi_dsi_de=
vice(struct device *dev)
>  	return container_of(dev, struct mipi_dsi_device, dev);
>  }
> =20
> +/**
> + * mipi_dsi_pixel_format_to_bpp() - get bits per pixel for a mipi dsi
> + *    pixel format
> + * @fmt: mipi dsi pixel format
> + *
> + * Return: The bits per pixel value for the mipi dsi pixel format on suc=
cess or
> + *    a negative error code on failure.
> + */

s/mipi dsi/MIPI DSI/, please.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVUgHUAAoJEN0jrNd/PrOhDRAQAIYcyb+1SFY/5tuUui+FkTd1
/HrH/pocCkI52KKUDyF/eVktuu+ZLDDAt8YCrcxS4TvXW2vNdaUIajDpFt4tSAgw
75jxCm3oCy1xXQM3CJGo33FDEze2jHIn4zaiLnHio4YlSY2NUa6WgyO+9Hn1pGEI
jX/wW6GNAOy/LzySQdbs1wtmUfZw+1j2PEoZarMMhi3xZXCx7O7cCImss+Vn2/wP
bvHVTkPcnfSc/3NhJC/zQNbwc674NavHxN/ksztrfRnYIYYdHygznsWSOlsvvnVk
14i+3zebiXEiRhGwEDQIWMXK10EA0qREbVR0+K5FX797U/y/sBAAFwQj8x/xhiWP
vDr8e1tXGOLQE0QE7H1IW64Cd0wYuzyabanKatxDGg73HoKlJg2vKtZ1/t6cFbfm
oaIu8TkKHqnu/z+8UuX+jz7vWHErAjso26HrBRbwz2U8M8yEZ9KO8h5znZkHAcUX
U7fIm3GlDzKwJxmdDzQkPZ/dxN+nAlxs/5ZyzZUBLqtFWUVpv+VIibyPPcqzF4E0
BehN0JWdK3wRA8aTvjKJlfwhAB3F/V+f+RWdA45qYAA7ns5A47XPvovYv8pH2nNW
vuwVOTt8RIO/iiJ1qvm37/JFw2cLHZT/ELTGE9/JBQSELDFiAH5vEbw5SN+lTJ/k
3dB4QOClQTAq4L2/Y7Ob
=HjY8
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============1888517824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1888517824==--

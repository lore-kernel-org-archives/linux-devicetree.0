From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/7] drm: Add DRM support for tiny LCD displays
Date: Mon, 6 Feb 2017 10:17:43 +0100
Message-ID: <20170206091743.GE27607@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
 <20170131160319.9695-2-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0089377055=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131160319.9695-2-noralf@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0089377055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 05:03:13PM +0100, Noralf Tr=C3=B8nnes wrote:
> tinydrm provides helpers for very simple displays that can use
> CMA backed framebuffers and need flushing on changes.
>=20
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>=20
> Changes since version 2:
> - Remove fbdev after drm unregister, not before.
>=20
> Changes since version 1:
> - Add tinydrm.rst
> - Set tdev->fbdev_cma=3DNULL on unregister (lastclose is called after tha=
t).
> - Remove some DRM_DEBUG*()
>=20
>  Documentation/gpu/index.rst                 |   1 +
>  Documentation/gpu/tinydrm.rst               |  21 ++
>  drivers/gpu/drm/Kconfig                     |   2 +
>  drivers/gpu/drm/Makefile                    |   1 +
>  drivers/gpu/drm/tinydrm/Kconfig             |   8 +
>  drivers/gpu/drm/tinydrm/Makefile            |   1 +
>  drivers/gpu/drm/tinydrm/core/Makefile       |   3 +
>  drivers/gpu/drm/tinydrm/core/tinydrm-core.c | 377 ++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c | 234 +++++++++++++++++
>  include/drm/tinydrm/tinydrm.h               | 115 +++++++++
>  10 files changed, 763 insertions(+)
>  create mode 100644 Documentation/gpu/tinydrm.rst
>  create mode 100644 drivers/gpu/drm/tinydrm/Kconfig
>  create mode 100644 drivers/gpu/drm/tinydrm/Makefile
>  create mode 100644 drivers/gpu/drm/tinydrm/core/Makefile
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-core.c
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
>  create mode 100644 include/drm/tinydrm/tinydrm.h

I realize this is totally subjective, but this feels somewhat too much
of a separation. Given the helper nature of TinyDRM, I think it would be
more appropriate to move the helpers themselves into drm_tiny.[ch] and
then maybe add a subdirectory drivers/gpu/drm/tiny that contains all the
drivers that use the helpers.

The separation above further shows in subsequent patches where helpers
are added to tinydrm that aren't specific to TinyDRM. So this make the
new helpers appear as more of a subsystem in DRM rather than a helper
library. It also makes things somewhat inconsistent with existing
infrastructure.

[...]
> +static int tinydrm_register(struct tinydrm_device *tdev)
> +{
> +	struct drm_device *drm =3D tdev->drm;
> +	int bpp =3D drm->mode_config.preferred_depth;
> +	struct drm_fbdev_cma *fbdev;
> +	int ret;
> +
> +	ret =3D drm_dev_register(tdev->drm, 0);
> +	if (ret)
> +		return ret;
> +
> +	fbdev =3D drm_fbdev_cma_init_with_funcs(drm, bpp ? bpp : 32,

Does this make sense? The helpers and the driver later in this series
suggest that these panels will usually be 16-bit. Wouldn't that be a
more sensible default?

> +static enum drm_connector_status
> +tinydrm_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	if (drm_device_is_unplugged(connector->dev))
> +		return connector_status_disconnected;

Is this really what you wanted? drm_device_is_unplugged() returns true
if the device is in the process of being removed. It only really makes
sense if you also call drm_device_is_unplugged() somewhere in the
driver, usually via drm_unplug_dev(), but I don't see that in the code
which means this will always return false anyway.

Thierry

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYPzQACgkQ3SOs138+
s6EqjhAAjwjNONS6aO1oKqST0SlfSixwF7IRvGL2dRh5Vxk6Wp1aqu8QDdTUV3vC
xYrYqMtaKcgbX0AFivdwwgyns35uJoM0sgkmT3b65Yy8ATGtY71sne9LQH4D0Fgk
iS89ly+Ex0XSVxarBArK17DmvmlMhzbPqx8ix6I2go3ZJbEkOVk+XdYagfwmDQ4L
xKcWJRqLqUNoBz2+HnqGRrLyOpTdyHbjBkS2Gcbd9PMoJG9QjdfIBV8yTuzlAE7r
QzQgYoHUIx0deE8Ej4QPu07jG98PgsU93981NuOZOjCdLG2P1G56mEzv//DILdTi
XfqngcsosTnIldQIqQwvI4ObKjmD3ouoDleRZN+nerVRJqAnW07+AwNTaktVIdTN
KjQqvrunv5Ss5mky5E2paWdtp6plPrdytBp2l3/ar0VwjGa+F0K7ykVfiLwIoq+7
R5OYnCR1kOc8+Yq+g/Lzou7sOnszGXg1IU5Z3aKCdSelhmj0iWBz+cWDi+kjnvzl
WaRz+ndd4Xz2SrTw2y+nMBSgQ5ugqS3pFy5JvjVqPY5d/1LoGlHZiq0XDArLZtrL
OWbuXCZYCWdIhZT9TuVmRU/f/sSaz5RRcSEGoYQmeN0UKBLC1udv9DogZfUKaXdl
LKLMFZn3svLRizR9ZkQdR9RwHEEs9NZflofTi7ZHztRTGZ0ei6k=
=tnsc
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--

--===============0089377055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0089377055==--

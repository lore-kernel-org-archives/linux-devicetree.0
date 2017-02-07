From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/7] drm: Add support for tiny LCD displays
Date: Tue, 7 Feb 2017 13:00:12 +0100
Message-ID: <20170207120012.GA30160@ulmo.ba.sec>
References: <20170131160319.9695-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2066781040=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170131160319.9695-1-noralf@tronnes.org>
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


--===============2066781040==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 05:03:12PM +0100, Noralf Tr=C3=B8nnes wrote:
> drm: Add support for tiny LCD displays
>=20
> This is an attempt at providing a DRM version of drivers/staging/fbtft.
>=20
> The tinydrm library provides a very simplified view of DRM in particular
> for tiny displays that has onboard video memory and is connected through
> a slow bus like SPI/I2C.
>=20
> The main change this time is adding 'rotation' as a common display
> Device Tree property.
>=20
>=20
> Noralf.
>=20
> Changes since version 2:
> - Remove fbdev after drm unregister, not before.
> - Added Documentation/devicetree/bindings/display/display.txt
>=20
> Changes since version 1:
> - Add tinydrm.rst
> - Set tdev->fbdev_cma=3DNULL on unregister (lastclose is called after tha=
t).
> - Remove some DRM_DEBUG*()
> - Write-combined memory has uncached reads, so speed up by copying/buffer=
ing
>   one pixel line before conversion.
>=20
> Changes since RFC v2:
> - Rebased on new core helpers
> - Don't use drm_panel
> - Flush when the framebuffer is changed on the plane
> - Add devm_tinydrm_init()
> - Fix PRIME support, set vaddr
> - Use atomic helpers in suspend/resume
> - Add a tinydrm_connector with one display mode
> - Set mode_config.preferred_depth and use it for fbdev
> - Subclass tinydrm_device in drivers instead of bloating the structure
> - The PiTFT display uses a MI0283QT panel, write driver for that instead.
> - Drop homegrown lcdreg module, it ended up as a collection of special
>   cases.
> - Add more documentation
>=20
> Changes since RFC v1:
> - Add fb_deferred_io support to drm_fb_helper and drm_fb_cma_helper,
>   and use drm_fb_cma_helper instead.
> - Move display pipeline code to drm_simple_kms_helper.
> - Don't use (struct drm_driver *)->load().
> - Make tinydrm more like a library, exporting the internals.
> - Move the struct drm_driver definition from the tinydrm module to the
>   driver using a helper macro: TINYDRM_DRM_DRIVER.
> - Remove dirtyfb() async code.
> - Added support for partial display updates.
>=20
>=20
> Noralf Tr=C3=B8nnes (7):
>   drm: Add DRM support for tiny LCD displays
>   drm/tinydrm: Add helper functions
>   drm/tinydrm: Add MIPI DBI support
>   of: Add vendor prefix for Multi-Inno
>   dt-bindings: display: Add common rotation property
>   dt-bindings: Add Multi-Inno MI0283QT binding
>   drm/tinydrm: Add support for Multi-Inno MI0283QT display
>=20
>  .../devicetree/bindings/display/display.txt        |    4 +
>  .../bindings/display/multi-inno,mi0283qt.txt       |   27 +
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  Documentation/gpu/index.rst                        |    1 +
>  Documentation/gpu/tinydrm.rst                      |   42 +
>  MAINTAINERS                                        |    6 +
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/tinydrm/Kconfig                    |   19 +
>  drivers/gpu/drm/tinydrm/Makefile                   |    7 +
>  drivers/gpu/drm/tinydrm/core/Makefile              |    3 +
>  drivers/gpu/drm/tinydrm/core/tinydrm-core.c        |  377 ++++++++
>  drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c     |  462 +++++++++
>  drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c        |  234 +++++
>  drivers/gpu/drm/tinydrm/mi0283qt.c                 |  279 ++++++
>  drivers/gpu/drm/tinydrm/mipi-dbi.c                 | 1005 ++++++++++++++=
++++++
>  include/drm/tinydrm/ili9341.h                      |   54 ++
>  include/drm/tinydrm/mipi-dbi.h                     |  107 +++
>  include/drm/tinydrm/tinydrm-helpers.h              |  100 ++
>  include/drm/tinydrm/tinydrm.h                      |  115 +++
>  20 files changed, 2846 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/display.txt
>  create mode 100644 Documentation/devicetree/bindings/display/multi-inno,=
mi0283qt.txt
>  create mode 100644 Documentation/gpu/tinydrm.rst
>  create mode 100644 drivers/gpu/drm/tinydrm/Kconfig
>  create mode 100644 drivers/gpu/drm/tinydrm/Makefile
>  create mode 100644 drivers/gpu/drm/tinydrm/core/Makefile
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-core.c
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-helpers.c
>  create mode 100644 drivers/gpu/drm/tinydrm/core/tinydrm-pipe.c
>  create mode 100644 drivers/gpu/drm/tinydrm/mi0283qt.c
>  create mode 100644 drivers/gpu/drm/tinydrm/mipi-dbi.c
>  create mode 100644 include/drm/tinydrm/ili9341.h
>  create mode 100644 include/drm/tinydrm/mipi-dbi.h
>  create mode 100644 include/drm/tinydrm/tinydrm-helpers.h
>  create mode 100644 include/drm/tinydrm/tinydrm.h

The series:

Acked-by: Thierry Reding <treding@nvidia.com>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZtskACgkQ3SOs138+
s6GTfA/9HhE6VgOk+hd29dlfkgHLc2SSma+ed4J9kUnvhEfQW0HAfsA0rvY15fkN
YUd+X9P+GYCYrYRbaD+XuD7z5JUHb2uZkzkNFVXvDAh8HvHHaRBTCMBzkyqDs0ul
KS7HOcnxwGA8rl9sa2fPtEB38pIlM/pq8oSs0RLhtyS9pzMfPhXYFP2h6wOzFUOD
b8+Cv+WQjcxeFl/ggVHIPgcq2DQwzFtFcRb5KcL9DeWN3RcW4traMxnnjz4DrSvc
NbI8kbNr9gPsOBOexN9ky8tpqnSGhgEdRfD2NGRzTcwc7DdlMOLYLbyDXX0hU+Wm
9vyF8oN019Btm9u9lFPjucloXDmudjBPTK5tt+fgi5vNAfND71qSr0wBbybKbWGd
KAcTpWk5xMYbp10bYZaBK8n97NHewa89aq3CSzdcC1vGpvFZJWWt/8W6+Qm5nJbh
zDXDXeD5AaK+c1mdftbFd3HdpV54//vRH1zV1REQnDE9RauTNUCkAZxtfqJHGQ1m
3TJMH3Jak+jhGx8C3PyHIp+stoEU8rUiwrHPkzREkGNjWYBjLeKj61XMlSq/Mk8+
LKiuKwO/y60mww0CRBBCNHIkvVm+z/xGFApkyD54g4Xub1zQ/cyz+tAaJqgI9aeF
BwU1pDMrEuEYV52cZzNJiKGssboPVtbq+rHbKAzfwBzzi+ZPSTY=
=sKAc
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============2066781040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2066781040==--

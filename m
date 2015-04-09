From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RFC v9 09/20] drm/dsi: Add a helper to get bits per pixel
 of MIPI DSI pixel format
Date: Thu, 9 Apr 2015 09:10:58 +0200
Message-ID: <20150409071057.GA12103@ulmo>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
 <1423720903-24806-10-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1371832210=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423720903-24806-10-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kernel@pengutronix.de, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1371832210==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 02:01:32PM +0800, Liu Ying wrote:
> Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
> ---
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
>  include/drm/drm_mipi_dsi.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVJiX/AAoJEN0jrNd/PrOh0NUQAKkgFAQC2UksNInWLwWfL1Ve
Gx94bnm6OBEgGVMxooPqcDKjdGoZoXnPinEYCnk/0bhGjbfof76JOXN/Us2R3xiZ
Jeyqhu6u9WrmlO37Bua0+XA0ocHswCikHpRQTHPvaCgkMyQRehIT991J1WUqEQ/1
r6fWmQMdpUsqBJMwt0I3PNDMqQEkklAm1AJUlGHiYM6apTSs8Mk1jUqGMSDcSC6+
flR7pQ1EISdzyveUegPPAMpy6kKB/S2abgvl49zqPT4KSrWdNEgF33dcryUcnyL1
OLfvCag0cacVZQMxzF9h2/uVXdhJADFkQxL5hX6OCH/I54tBbnp01xHw7lQEd0s/
8PcXZa/PPcClMZK+e2BOmqh4ahSWi/L7Tyh7wo9xbYfm+QeXRGABEWl46+H0XnPu
PjxIyJk5j6abNDoCkVhUQEzCOQAuFQaLtllB6BH6cpJRZmrjapE4RNB8ezwoCNk1
mymcikVURNNdmJti5PyizQT9iHxpdbGGLUd3zqxOylzWS7dvfRaf6MQFSQRMCAjC
hqywyVbrKPhKkUh0tKr2SIedI9X4q+d/UVNy2oKYEAH/lMrYtkLuXqFu1KJrMBXJ
LCockarg61+Cy4Vg8YUsRorueVqwS47gJeD4eudQnIKvp0wdY78mChZpWgoomDNb
/A7sGQpMoKq0QGAnbpz4
=sJLG
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

--===============1371832210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1371832210==--

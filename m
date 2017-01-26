From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: simple: Add support BOE nv101wxmn51
Date: Thu, 26 Jan 2017 10:38:22 +0100
Message-ID: <20170126093822.GB3613@ulmo.ba.sec>
References: <1481685596-15608-1-git-send-email-wxt@rock-chips.com>
 <1481685596-15608-2-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1546229314=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481685596-15608-2-git-send-email-wxt@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Caesar Wang <wxt@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============1546229314==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 11:19:56AM +0800, Caesar Wang wrote:
> 10.1WXGA is a color active matrix TFT LCD module using amorphous silicon
> TFT's as an active switching devices. It can be supported by the
> simple-panel driver.
>=20
> Read the panel default edid information:
>=20
> EDID MODE DETAILS
>                 name =3D <NULL>
>                 pixel_clock =3D 71900
>                 lvds_dual_channel =3D 0
>                 refresh =3D 0
>                 ha =3D 1280
>                 hbl =3D 160
>                 hso =3D 48
>                 hspw =3D 32
>                 hborder =3D 0
>                 va =3D 800
>                 vbl =3D 32
>                 vso =3D 3
>                 vspw =3D 5
>                 vborder =3D 0
>                 phsync =3D +
>                 pvsync =3D -
>                 x_mm =3D 0
>                 y_mm =3D 0
> drm_display_mode
>                 .hdisplay =3D 1280
>                 .hsync_start =3D 1328
>                 .hsync_end =3D 1360
>                 .htotal =3D 1440
>                 .vdisplay =3D 800
>                 .vsync_start =3D 803
>                 .vsync_end =3D 808
>                 .vtotal =3D 832
>=20
> There are two modes in the edid:
> Detailed mode1: Clock 71.900 MHz, 216 mm x 135 mm
>                1280 1328 1360 1440 hborder 0
>                 800  803  808  832 vborder 0
>                +hsync -vsync
> Detailed mode2: Clock 57.500 MHz, 216 mm x 135 mm
>                1280 1328 1360 1440 hborder 0
>                 800  803  808  832 vborder 0
>                +hsync -vsync
>=20
> Add the both edid to support more modes for BOE nv101wxmn51.
>=20
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>
> ---
>=20
> Changes in v3:
> - As St=C3=A9phane commented on https://patchwork.kernel.org/patch/946591=
1,
>   add downclock mode for edid.
>=20
> Changes in v2:
> - fix the vsync_start and vsync_end from the edid.
> - change the commit.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 45 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)

Applied with a slightly modified commit message.

Thanks,
Thierry

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliJw44ACgkQ3SOs138+
s6GdrA/8CeIT7WruoOT1j1E2XjrU4v/uMz9cJDHwBzRf3ttYnL0pd7WkHwjw857o
yZsatZFb2GyzHXv5a0oSU+AwkTIN3wIESIdNv9fW8o/OreSy+2Yo93lUcSJC8id5
ga8IqpclI1zpK49HdHfyF1jvfqfHMN5UJhIOaknty/7ngiXx/AvTGFm4ROC6eQEZ
hWJx+RsKBhmzQviizYjktm5ZdpNpg9tDwht/f4d7T7bMelxB94aDDP7A4rmJ4NdV
7InbnIVbVrMkhWvZbZKSlSioWOfqG7j/FcSIf3WUbL0x18OolHa2VZGhJbiSYIyk
taWx/u/pFbqQ/h9fKG1HwL7q5qiqXijbUn7JeqGTvvLhCnWbgdVhXr/28JlMV8Th
EkddJc/49c+qHgjasAU0QgID1085D0q0v7cX67gBQXr+LGyVuWAlZPtxFtqj9BIi
uGNpawpX3HWwM6U/qfoUizeR+z2Gkc+GF2W/JNQ/UzNRbw2wfE7OZbMj115bcDcM
M+HFreqZsIjhmAwfMRGnKnhd3Bq9ruWSqcU6wf2Js88raUdYjLX/O0XkibNtbGeS
jQzRVtQQbzxa4Zwi/Nz+4Bzv4efST+XKZbwjoiNWLgXwZaGN+Qg2QROGv2AnHIRp
7jGrOL8uk+p6lK5y8SuhDiEQ8BP39Jj2gTC26NbYvuqQrqU3SEs=
=IpEw
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

--===============1546229314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1546229314==--

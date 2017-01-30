From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/4] drm/msm: drop quirks binding
Date: Mon, 30 Jan 2017 10:12:21 -0800
Message-ID: <871svkifi2.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-4-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0649609282=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170130164921.20744-4-robdclark@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

--===============0649609282==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark@gmail.com> writes:

> This was never documented or used in upstream dtb.  It is used by
> downstream bindings from android device kernels.  But the quirks are
> a property of the gpu revision, and as such are redundant to be listed
> separately in dt.  Instead, move the quirks to the device table.
>
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++--------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  4 +---
>  4 files changed, 7 insertions(+), 20 deletions(-)

Nice cleanup!

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPggUACgkQtdYpNtH8
nuhZmQ//ZdB0NJBm8Tkgc2OIZW76WxSQrV+78Rp8fzwNGz/vO/Y1mzJtNje3Qclo
unVs+0Q1uYt5gmQGX+MlawNtvZVO/lDXho3druz/R2zO22Bkyi9tZxxkoFMeI29q
Pi5jKS70oZkEV9vX6liHSnOcr1Zz3yarcq1ZHMkCnx3IyQeYEWy/CHmskvbbQ1gF
+t5fFHf/9Up+bG0V0xTpOXNcEQX2oXlHjKytSVIjqmnLAkld/pWSs+Zi3d0e/dnK
P7og8SguI4W88eh7pFUz1TEvmFRtwwCDVopk3TNzM9SAlUXLhau/4N9WhY5wLj0B
PBE0g0tn7MLS/BZK+OeIBshitWsHA0q6c/RlVrI6RalagFs8GsvGX7myEwqIncjo
QxgoC3OaaxVzMyczcwABRzLIxzQOHeQeZZ+uEbo0b7jGyJzseeO6IGJs/ZcFVO2X
3BeOYGXSqRALctZq5oPeKM++qeLYBevX3nxvJb2VcdTGTlerzbNZ2OwCKJjrsbOQ
u1f1IxbclSqEHNIOS73tHPPTy5gLaK6BhFLscOmSN5rUzHtRmqZPMyNbMbPxI9Sy
ay39ONH5xApgSUBXwF2zSiDOa9Y73Dgqfa1d2/JnJXODqomPfveXqvkHeQaK8nQK
95xQul1p979SjEcm5ikon4oh9ALp7eiRVpXqQCG3uRBQhmebS8M=
=DcRz
-----END PGP SIGNATURE-----
--=-=-=--

--===============0649609282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0649609282==--

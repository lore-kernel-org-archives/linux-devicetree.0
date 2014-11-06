From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] of: Add vendor prefix for HannStar Display
 Corporation
Date: Thu, 6 Nov 2014 09:58:41 +0100
Message-ID: <20141106085840.GD26297@ulmo>
References: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650055219=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1650055219==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2014 at 04:31:05PM +0200, Philipp Zabel wrote:
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1:
>  - Rebased onto v3.18-rc1
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Rob,

Will you take this patch via the DT tree or can you ack it so that I can
take it through the drm/panel tree along with patch 2/2?

Thierry

>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 723999d..9863039 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -64,6 +64,7 @@ gmt	Global Mixed-mode Technology, Inc.
>  google	Google, Inc.
>  gumstix	Gumstix, Inc.
>  gw	Gateworks Corporation
> +hannstar	HannStar Display Corporation
>  haoyu	Haoyu Microelectronic Co. Ltd.
>  hisilicon	Hisilicon Limited.
>  honeywell	Honeywell
> --=20
> 2.1.1
>=20

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUWzhAAAoJEN0jrNd/PrOhjggQALdlvwofPwyA7CNvHHFuSidj
mHs/LfeP1wsAg14OZBauLKHJy0p39kraB156AWdGL43pgmfbevT5EFFLHPwo/9DX
SgOwklm9tHV7ipkBFn1OpS2GcAW56HW7lSNbkcoMobsZjeQiwSP2igubKS9HdcnT
ohT1av0EQ/q2RkWMFYQnvPIY7k/aZv9tnWkaLt7ArRN7HE6dN5IyN9Q8DkMHlJqK
yTfSUZothwHeDoXPSIzBHWmKOR4WXk9mSB647vig6CFueOG/2oxFGLRWiQqdWUxN
539/i0+JT4MtMOzPyYOnfY+GEG1I2BLtv0Ae7vBS5w4Wx1JKbWTkKRqHMvHHmN4I
ep5V0T25uT/n3u6iBO93DnGuu9bcKi9xxcaZliRP2N++sWVfU08RFsb8gl/XwFSK
cKixSC56UcDgs0PQ0sczB2f4Z21CpjsEft97Jx2pVoWQ35iD2iAJEp+ulderXcpT
r6ChIxYZ41aD8Hw52SeLFif7UV49c0f1+DSzfeBNgNk37m0Hz1Or/bmC4WMfFXKl
fnFKmtX98T2a9Wi9POdhJrVG0ULvBE6RQcOQkgupH8wKV1sx7DlMb6TyE2OHmzi6
mfyVAa6bZE7qvaEHTKqtytxFmuFFDTGifsegIN9jl1tiVokzq02oIyaCSBBOaejw
AHgrUabTLAaDH91uTop8
=OGuM
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--

--===============1650055219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1650055219==--

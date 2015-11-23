From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: Add Sharp LS043T1LE01 panel binding
 documentation
Date: Mon, 23 Nov 2015 12:42:09 +0100
Message-ID: <20151123114209.GD8911@ulmo.nvidia.com>
References: <1446244470-8517-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0638812599=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1446244470-8517-1-git-send-email-bjorn.andersson@sonymobile.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0638812599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline


--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 03:34:29PM -0700, Bjorn Andersson wrote:
> From: Werner Johansson <werner.johansson@sonymobile.com>
>=20
> Signed-off-by: Werner Johansson <werner.johansson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>=20
> Change since v1:
> - Dropped -vid suffix from compatible
>=20
>  .../bindings/display/panel/sharp,ls043t1le01.txt   | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp=
,ls043t1le01.txt

Applied, thanks.

Thierry

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUvuRAAoJEN0jrNd/PrOhBO4P/jNgZ2a1Bitojk1fujt4XQRt
Ruc512p4fSN3C4VoRsshMY0JHNeD+eB3lKPyA/VCQLuUUwHZGVP+/me1SzMbFf5u
+KmnZS6UJmgdo8a35o1w3Fcz3+JRC0qRQBgUEBBqTMOJMD6v+iSAdvjDkfbRiAiP
XfIM4rkc38eZ9VCAvQbleB06Px1MZs6yrbrFUTiNkuU8ZW0kBFYGLi9/HahqBTsa
Y9YS048Q2dRJUFLdYNvUlTujKhe+SQSVXhIp9biH2liCVHVV8fLq4PVhcuqBvAZN
LV9Dhd0997GLbAQRq6RkL6Rl9F/+vgJwn8/XYm18PP68a/cNqdet+dhjx2Kzt+49
o6XH9rmBgeup5DpUyrPMBXhbo/RIyyKXdueZdLBtRHNx/qJUxYqsSiTRacW0mabq
g74FCtjPxGAZLWwljoE5OsW668ZWTph7coTgfC8UACb8gc/GgenfWq/afH5HB/Y3
rvrZBoiTVEm1OfkmhbDxzUElqu0tgh65MlxByTfHAsBl1/RFDRowLXgbHGqQZJbS
vTfKsvZwLm3Er/ZmtXO0yoCnnB1+NqVSmsY38YutylzsnatMbEVGUUPiWpafm9AR
246Q/U8RxwOv2XNYlmjm6hM4QOR2MJTQcJEJN9ZKGEqdvHr3g0bv63xKOw+J4Xo8
BHfpwTy//nbrGqzCn/Uu
=kT2c
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--

--===============0638812599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0638812599==--

From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4] drm/panel: simple: Add support for AUO t215hvn01
Date: Wed, 19 Oct 2016 14:34:20 +0200
Message-ID: <20161019123420.GC16158@ulmo.ba.sec>
References: <1476141557-4613-1-git-send-email-hshi@chromium.org>
 <1476223156-6163-1-git-send-email-hshi@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0145235225=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1476223156-6163-1-git-send-email-hshi@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Haixia Shi <hshi@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0145235225==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 02:59:16PM -0700, Haixia Shi wrote:
> The AUO t215hvn01 is a 21.5" FHD (1920x1080) color TFT LCD panel.
>=20
> This panel is used on the Acer Chromebase 21.5-inch All-in-One (DC221HQ).
>=20
> Link to spec: http://www.udmgroup.com/ftp/T215HVN01.0.pdf
>=20
> v2: fix alphabetical order
> v3: remove minor revision suffix ".0" and add link to spec
> v4: add dt-binding documentation
>=20
> Signed-off-by: Haixia Shi <hshi@chromium.org>
> Tested-by: Haixia Shi <hshi@chromium.org>
> Reviewed-by: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/display/panel/auo,t215hvn01.txt       |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 30 ++++++++++++++++=
++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,t=
215hvn01.txt

Applied, thanks.

Thierry

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYB2hMAAoJEN0jrNd/PrOhQ6oQAMIiEzbmsbcGx1nUBrpRYzdi
t/IBF5G0DtuvdMJgv7b+N+QX2gfkeQTXtfTv+etlkQpKKxbJZNdn5soHBDF/6ljj
CYyJBK4wOjHZMykUY9L0xI9kGxfyNas0wI2Tl4FgD8EVf019Kjxqaawb0FvUHRjL
vLW86dYvjxTh1qBnd3yndhMOU/SQmis7fujCOIfMlNhBf4q39kowXrYXRTv2GHW0
ysukUURbMIiyx+ynuBZ0afmYP65eIzFQfIVW8GDAyyOwhwJq5EVPPF7FbqKkHJQI
zw+VX9Ub3EFmZTCBUQ4q3ZWUWQbCD+bjgRRXtaB6v3fuBUhn3D1r3HAzyThRHJfx
L5O5hJc+vGPqUtvaCGhKatE/QfvU2PdTGIz0R/wlJuHYo1+8CaDOTjJiXlsa1DeX
XLYgpBTwjcX7FraaDXfmUdj5JYzpZ5BGcjzs9a/3TukCgo2DxL68ucyE2UwVwF24
AeNqXq+XogAJjDe3yVU/HZ2tJ5ygTfrwZN7T1pM35/QxGf36Nb4ktDPgPfAE9Ge9
0Rch8c1luwS/UQYyvxWkjdnJ76t07OGzOEHSo+p+7y3Cz3+HXMKqlNjpUXjtYwpD
kBcOpb96aPUQyU9/wJ5QwGoxAI2/ATDPHp/BaC1+1JY4KYt0SkPtRskZQqgRijOV
Rxa8ceWe3Ub21fNHPNhQ
=+BPb
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--

--===============0145235225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0145235225==--

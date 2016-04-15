From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/5] panel-simple: Add the 7" DPI panel from Adafruit.
Date: Fri, 15 Apr 2016 16:51:36 +0200
Message-ID: <20160415145136.GI3472@ulmo.ba.sec>
References: <1458865431-30048-1-git-send-email-eric@anholt.net>
 <1458865431-30048-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0602925831=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1458865431-30048-3-git-send-email-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Eric Anholt <eric@anholt.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0602925831==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
Content-Disposition: inline


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2016 at 05:23:48PM -0700, Eric Anholt wrote:
> This is a basic TFT panel with a 40-pin FPC connector on it.  The
> specification doesn't define timings, but the Adafruit instructions
> were setting up 800x480 CVT.
>=20
> v2: Add .bus_format and vsync/hsync flags.
>=20
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/display/panel/ontat,yx700wv03.txt     |  7 +++++
>  drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++=
++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ontat=
,yx700wv03.txt

Applied, thanks.

Thierry

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEP/4AAoJEN0jrNd/PrOhQaoQAIGkqqfqDF2X3ynfij+oy+NE
SrTNivbpM9yMqtrcUYemXtrifaNI6dIK1TqKpVpzjYDVF53jaux1qjD+A0DPHbw6
SsId8ER6Z49j1cI/RtACaX9LWT6rIfytmcTjmcRw4jyIbrHmAggkyaOdvk3CasA5
sFtdxKO9iIqWfBaCtzvPLPKbpMMm9AT4whbJOYUs+ambPCLKHKeuN8X3l6vYkEvC
3xqzvEO02KBz2AhgVKXmU1eGgY5Qjymy6M2lgtelkwUZAJ4C8xajzhKr6Ej+tEHe
aR+QwI+qvclxYu1/X1XvlYv3TuVq2AiyclpAer3p86HsETelpVJmv7WYdm9Cb3jH
5dk2jfdJRKee28HGXFLNQVvPMH9aNXRzxbI+iNR4TUcNQl/nlhgisJgkzgPI+VqZ
CmRlAHWsPpTd25U2t1TWDuyOJWihBdVrefR2qrpAt+09KBFteousInhFkhBbwErA
BMk92+QdzjuhHFkLsM5QDUfXCrwKyk7G7Ott6ocBzmoiVTt0WC5ZPh7ne7T6fPaB
AP0ibEyrARRCVNuZfIarvtgQWmcSxYLTjc2m+2SshBswVbP3EO9PWTzbkuVgphuQ
Jz9CfYwpi36YI8i/+SdX8Io1F9sGHe6J66UyfLfc2lLGZ52Y51v3+emqK5KI22Mr
6XKBYv2gEBybDlSK4cgg
=jy7V
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--

--===============0602925831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0602925831==--

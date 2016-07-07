From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: add LG LP097QX1-SPA1 panel binding
Date: Thu, 7 Jul 2016 23:55:24 +0200
Message-ID: <20160707215523.GC744@mithrandir.ba.sec>
References: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232059441=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1465700010-13483-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1232059441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2016 at 10:53:30AM +0800, Yakir Yang wrote:
> The LG LP097QX1-SPA1 is an 9.7", 2048x1536 (QXGA) TFT-LCD panel
> connected using eDP interfaces.
>=20
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v3: None
> Changes in v2:
> - Add Rob's acked for dt-bindings of LG LP097QX1-SPA1 panel
>=20
>  .../devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt         | 7 +=
++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp=
097qx1-spa1.txt

Applied all six patches, though I modified 3/6 as Doug suggested.

Thierry

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXfs/KAAoJEN0jrNd/PrOhP0cP/3KOYA3TQmtq2BrFsLYl5iP1
qD+UaHJlCjBHjRK+lqcPt2g0pflfNAANUXw+k4VgUGOK1ETnIwAGAMK0d8Sugbnd
zd45GWU0MwHyv3oBc+1B+V4xL17DVBGxPn6/o255dF58YaMCeirN0CwLaH6sxkkn
KCJpkzvh1eF4d2kXVVjrRAVtB8VnLxcwARB85Ui5UjAiaDcWHlbpOGuftKQMIxqs
RAkOY7mOQR16aoZI5sRQ8WP219lTfRi6viDE/a34Ky3slndDSQDDDeJiVMqs/8F9
zmI99cYJAiJKeLrd+7JinRoQpE51ETpYmgnYh/2pT6SKwKMYS+CKfZEZD6uQghfP
nkdrMH9WjazAtMpXIKoKDZmV+Gc1RTxODLKAFbs/NWqAhcoPyb8x50W7IhMbY7UK
JDEIBB336qyaHIKyXTVmQlmbhA7ME2fYeP3FDVxmoYx8+u0q52v6MwgoHyNOJ68b
RMJPUo7Q6ew+baS8+sRfO75WJboC1bFADbJ7rjKGwXFFXqhh4RTPtGYINvoEpR/C
e0bASjsoHc5bPcw/Zvy4hgjl34VEzsiuNjmgJLV1fYDcliTTqXuKy9VkjbGALpXs
sm3bwL83bVH6kZKoaRi367LZE0WbjsxrQdFOXeQVFWOu/dPRxuFyVvWZzrTQ7Hle
t6k+fj74b5SviUyHlDek
=jB5r
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--

--===============1232059441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1232059441==--

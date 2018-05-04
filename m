From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/6] drm/panel: Let of_drm_find_panel() return -ENODEV
 when the panel is disabled
Date: Fri, 4 May 2018 12:20:08 +0200
Message-ID: <20180504102008.GH13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-4-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1716759659=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-4-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1716759659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6cMF9JLEeZkfJjkP"
Content-Disposition: inline


--6cMF9JLEeZkfJjkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:06PM +0200, Boris Brezillon wrote:
> DT nodes might be present in the DT but with a status property set to
> "disabled" or "fail". In this case, we should not return -EPROBE_DEFER
> when the caller ask for a drm_panel instance. Return -ENODEV instead.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--6cMF9JLEeZkfJjkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsM9gACgkQ3SOs138+
s6E3/BAApDzJV8x97tFfcHlpx9QG1toOi05kxonOtZf9kgkMuKN5a/lpZuWK5hvS
VyeuiZRPLEf3mqI+0t4DSZrA6SmIjBl4thLoRWTGZlH4qBRUbkxHV2NAlDja9Of3
w1TNmPYn5ZaAxoQJ/y033hp+MPtAeis2FTqg8WEFY//ej+D4NFCc8Hwky2rA5Yzh
1kUFERgyfs01/noPbhFimPUKmpPLnRLR8MvyuvGMKw82t1+AIC83C5BUbU7I5FAg
GziVLLK5QJ5T/Cb/CWWT+xfC49vvT3eYnLfADAmTDxba8cxyuvQQmghELSjOqxBq
KI1XOGq1lpZHzFVoPAA5AdOfgaXvKwHQGTcnsZhQdrapDAEmL6tWwo1S/S0wkWwJ
Tr2IJ8qaueuSSi4bsQV/TLkYEO6bKK9I9qplSkf6usPI+Ej6V+i7iqsP3+imxgYk
hVjZvM3WAANQnDWtWYy8ojRIA7XgMUQYl8uuTnNx92OCC4IDCN36SqDdqphQFUTJ
0jM30jnoF+qN2pzjP96qOOsV7dWQ57r41f0PXWGNywVOVEugwvCwrxhop9brP5Y4
J0Kv9Qyb+9u0wx5q4BvIsA5H+7z7Xfxwu9gYS2l2MZwGiKFu1a2lJt+RnGcUJ8Gv
1AdyHC2oTWczY5Iufh5x273Wm6INOXxXPgO+l2763EHF3YFanEU=
=ofOy
-----END PGP SIGNATURE-----

--6cMF9JLEeZkfJjkP--

--===============1716759659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1716759659==--

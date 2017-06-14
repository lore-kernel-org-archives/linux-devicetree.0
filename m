From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/panel: simple: add support for NEC
 NL12880B20-05
Date: Wed, 14 Jun 2017 19:38:48 +0200
Message-ID: <20170614173848.GB14971@ulmo>
References: <20170608180758.31020-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0083700959=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170608180758.31020-1-l.stach@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org


--===============0083700959==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2017 at 08:07:55PM +0200, Lucas Stach wrote:
> This adds support for the NEC LCD Technologies, Ltd. 12.1"
> WXGA (1280x800) LVDS TFT LCD panel, which can be supported
> by the simple panel driver.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> v2: new patch in V2
> ---
>  .../bindings/display/panel/nec,nl12880b20-05.txt   |  8 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 30 ++++++++++++++++=
++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/nec,n=
l12880b20-05.txt

All four patches applied to drm-misc-next, thanks.

Thierry

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllBdKgACgkQ3SOs138+
s6F9zQ/+P6/yufaw5LbAuNfcvIOHaKOMiWSB20wKDVBAcn30JNer5Sm56/xC2zS/
jzWLsDW8h8UVWlq5fnUE6Z9+0ItLhLEWO5gnjqZn7cRhw+A22D7akljdYO9SVXLJ
qjA9uIYuAxUC0sdOvz2y3QS09Px7ehR1+B1CqP7N2taKtKiSvrASow4kRkIUKuKp
+Tf4uIhUla47oApls67YOHc8tUWVroKl1EPBCcEGpYUEtp4zVaQQ9o0kKaUeXd/0
5Nn+NDYAbV8Gwm7D+4foBf1RK80CinX3EqZgObQ2/ooXdOnOKRsb7yLMbiekz4aB
lfDyn+RjqCp7ZiYkDvGDR9pudG06S5rfuIAxmrMrzLWvK+PzhqEeg6ao10viuhjA
B+SQSgbpH17Byym0TTrEEl/SMcgqOaGOS1z4vu4RUOM6IQXHI4DmAzZidwifst9i
YOSKdOsFG23vTOnWm8n0XQx/52V/hSOBXUBBquBfD8WmlyKF0KVpoZTb6mmb4SN9
NgaS0GcqreDYmNxKkRY4ilnqKR/ZIsRap5gqIQp582Z5+ECYVHz20rLEuFsbiMVq
ElfEpzYziWjz7t2PII31mvTAn4B7lsMUuEmUwkAIAkMkzKz9IHjKshVPr4StbzLt
LWsRK5NXV2Pe9bXnQOsUxBL7zyP35xOQeqaA0ypHag30if2AIaw=
=ZTdc
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--

--===============0083700959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0083700959==--

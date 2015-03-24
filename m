From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5] drm/panel: Add support for AUO b101ean01 panel
Date: Tue, 24 Mar 2015 12:02:02 +0100
Message-ID: <20150324110201.GK18115@ulmo.nvidia.com>
References: <1425089938-27397-1-git-send-email-hl@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1257825905=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1425089938-27397-1-git-send-email-hl@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: huang lin <hl@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dbasehore@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1257825905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dxRQSzdsN/lOP445"
Content-Disposition: inline


--dxRQSzdsN/lOP445
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2015 at 10:18:58AM +0800, huang lin wrote:
> The AUO b101ean01 panel is a 10.1" 1280x800 panel,
> which can be supported by the simple panel driver.
>=20
> Signed-off-by: huang lin <hl@rock-chips.com>
>=20
> ---
>=20
> Changes in v5:
> - increase the vsync time
>=20
>  .../devicetree/bindings/panel/auo,b101ean01.txt    |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b101ean01=
=2Etxt

Applied, thanks.
Thierry

--dxRQSzdsN/lOP445
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEUQpAAoJEN0jrNd/PrOhFEAP/2E2tDKZB+z+oRwG7wG9PlPw
AvihD8EwrZMbxvMbWM6x7GqA3OdHz5d6zBu7/GYAoz81Q55ftsx0mU4arx9BMUF7
hZa4HBu64Bwe2VQ6y8geRFp7emfRmmqYQkvdEu+etvunI953FNsVY89pQrNyzox9
X5kCgu5YiWIvhMATLZY6xLF06TYU1K5zu6XbQ+s31vXKgypsFrG7L1cEJD9TWOm3
RP64c3MA3oRIjbi1zjBScqdXPN0uv0VvJ0EhSjQUn6vTQKzlJCGMBbFgzAPTzvm+
NFVsxeKBLRuyOGGyiKR3rr9yOUYAb9F7vcSxLd6fgzoD8cnImE6LZEfbKmqMgiJn
b+Ez+5zzQYI7E4ySqhTPrP7rPAmx8lOsTvoExeyfNU+Tz8pQmQIAkrs7DEbWeL9H
gToaTwghQOq3Okf61pZgRpxqiAFvcarsxNa83F6ga7V72KXrdJqaAcgxisGjm/lg
j4JoON/jA14abQkF6BnXgg2O07lY7wy5vWGvVYEPsgYhFZTHh5G7t9Zoudl01Fr5
TlCmSFwLN2VXMXx7toZIXWN94JlbCGq+dwAJGckXoN1BSkWKPaJo2z6SH08kx2wx
rYJgu57J0O6cg6Xc6i+xcOxpHXi+5Ne1imtDm2so45gY1Yi7PCax820iwUUIhrSr
U/uyl1jPocWgPGGMI5wF
=IPj+
-----END PGP SIGNATURE-----

--dxRQSzdsN/lOP445--

--===============1257825905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1257825905==--

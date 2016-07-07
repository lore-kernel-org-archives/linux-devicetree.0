From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/5] drm/panel: simple: Add support for LG
 LP079QX1-SP0V 1536x2048 panel
Date: Thu, 7 Jul 2016 23:52:16 +0200
Message-ID: <20160707215215.GB744@mithrandir.ba.sec>
References: <1467089288-18355-1-git-send-email-ykk@rock-chips.com>
 <1467089475-18627-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0337375319=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1467089475-18627-1-git-send-email-ykk@rock-chips.com>
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
Cc: devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0337375319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 12:51:15PM +0800, Yakir Yang wrote:
> The LG LP079QX1-SP0V is an 7.9" QXGA TFT with LED Backlight unit and
> 32 pins eDP interface. This module supports 1536x2048 mode.
>=20
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied, thanks.

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXfs8PAAoJEN0jrNd/PrOhD1UP/0ATXVvkgRq/xomElgcbRX/n
+WPwVloXZwtN5W1APWqZMLoX8JFywwRABz9pg57xUMyyXyLUkV/FPq2xhoSAhxN8
iLIgHsfSsavAi/dhPKEjPL9rb872LM/eba//qofMXEy9jRTBlULYLjHNKgaGTV6v
1FQ0xfSlprBZrSNvgcUu49yFZIgh3oUYfnqWOqShpk511s9EFzrPdJI8+CGoMQDS
L+4KVEM5mDp1wbFNJonobwT514frEj3XXFR9ebeq2ojRyOAL5EHHW9qTjV6rxm7E
jmYAT80G8ApW1EWwQooQOBtYzw6/qOiy2GD7GHPxVKCI0IBkqtXg5xN9xvwi9OxX
SDBpdSsGUJP+IrfEdvexNGkTg6b98pg3APBdaKVNPNwT0vFpjuYNKAGcHyhC/PIC
00Go62r6e16ik1fPkdMIas5jPljq2MaQ7jyjAlEtXnJiG1Dkj7/7UZ/pZ674xXCm
CKFQCQpAQ0/gsUi+bg8JDalJ5DWqyz9hL7hBHD/IQ2f3jh0HDok5DuQyfB+wZrtf
GR5sVGnLI4qlWfWJ3EiKyS9wYneLewhQI5AAqRNJ6bC8ML6s1guT2FXZkxXr5jSC
w7XibribAb9Z+hk+UNQGwF+hbWfxqnjC3Qut9jeZAMoffErPQF5v5TsidVYCNte6
+Z1bEkUyoOCp85bR8KT6
=zBbM
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

--===============0337375319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0337375319==--

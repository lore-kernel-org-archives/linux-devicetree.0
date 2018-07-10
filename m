From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/4] drm/panel: p079zca: add variable unprepare_delay
 properties
Date: Tue, 10 Jul 2018 12:57:59 +0200
Message-ID: <20180710105759.GL1504@ulmo>
References: <20180702102721.3546-1-heiko@sntech.de>
 <20180702102721.3546-3-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2126738253=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180702102721.3546-3-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============2126738253==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXIF1lRUlMsbZ3S1"
Content-Disposition: inline


--DXIF1lRUlMsbZ3S1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 12:27:19PM +0200, Heiko Stuebner wrote:
> From: Lin Huang <hl@rock-chips.com>
>=20
> When panel power down, p079zca need delay between reset and disable
> power supply, but p097pfg does not need it. Similarly p097zca needs
> a delay after entering panel sleep mode. So add two delay properties,
> so we can meet these two panel power down sequence.
>=20
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> [add sleep-mode delay]
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--DXIF1lRUlMsbZ3S1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEkTcACgkQ3SOs138+
s6Eg/xAAj/r7Tcwuc3e/igSbvFj7YIgf7PSj1De7zroUTis3G1Gehl42mDM3dIMe
XzCqtj8JDznaq7+ydeX2Lp5b/aQ+K1RjphVK3RVS0KtUky+KrYdT0V+P6r+jCu3k
k0fI0Oronq2VkIn9xW5Up94/NQKKDpo+s15Dw/OzrVYxA4butVzIrv5wtGGQv8A+
ozqPbot3ji0oXhPm/YR7pick1eP4MYh3fmSnkZjgaWz5C1yr+ijZgZPp0bIPorkh
Kq0x8m89UJ6TmC6VqZ7FH/1nuxuUK2vnl9n/Zex2jZvzYDGjslomf7NGBn4bE0sR
e1lrffACsXPe9RFwzcxDY0eRFaHrCD1fSaQk1q3IBL6gAvnAbs3Vsr3fuSliYhIQ
p+A1qL4ABJbOzou3M3pYw4nU4rYK1jIlFIsalHgRtVPAgIRJt+KDehmjcQq1fztY
vRQDI+9QZ5oNWQgZYWaPsqsPVCdbLQYJs/fATtgcZPgBwWJx2UcH+dUGr5Jk+uj+
XHxasA5LFVavbRIf1GPo2rk7MZ4Mdrh5514ZGPGon0/tKw9M4ldTigFThdaK5Xxq
nmrEAv1d+zwzgvRmw9MGFgModHch/0tK8WNy9lH8hJG38AMvyPBTrkV8J/bnItiw
eYX6H/px+HpMgVSMoHKl5Lp8tgtdoXI+qPMihPOIJaJ7k3RMTc4=
=TuJv
-----END PGP SIGNATURE-----

--DXIF1lRUlMsbZ3S1--

--===============2126738253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2126738253==--

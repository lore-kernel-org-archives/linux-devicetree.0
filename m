From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/2] drm/panel: Add support for Raydium RM68200 panel
Date: Mon, 12 Mar 2018 09:04:04 +0100
Message-ID: <20180312080404.GE23060@ulmo>
References: <20180302153222.4377-1-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0414327520=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180302153222.4377-1-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philippe Cornu <philippe.cornu@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>, Rob Herring <robh+dt@kernel.org>, Vincent Abriou <vincent.abriou@st.com>
List-Id: devicetree@vger.kernel.org


--===============0414327520==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 02, 2018 at 04:32:20PM +0100, Philippe Cornu wrote:
> The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280
> TFT LCD panel connected using a MIPI-DSI video interface.
>=20
> Version 2:
> - Add Rob Herring Reviewed-by on dt-bindings.
> - Update Kconfig & driver thanks to Thierry Reding comments: no more
>   DRV_NAME, DRM_WARN_ONCE instead of DRV_NAME where applicable, use
>   backlight_enable/disable() & devm_of_find_backlight(), no extra
>   gpio reset to 0, no more msg if successful, use RM68200 instead of
>   rm68200 where necessary.
>=20
> Version 1:
> - Initial commit
>=20
> Philippe Cornu (2):
>   dt-bindings/display/panel: Add support for Raydium rm68200 dsi panel
>   drm/panel: Add support for Raydium RM68200 panel driver
>=20
>  .../bindings/display/panel/raydium,rm68200.txt     |  25 ++
>  drivers/gpu/drm/panel/Kconfig                      |   8 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-raydium-rm68200.c      | 437 +++++++++++++++=
++++++
>  4 files changed, 471 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydi=
um,rm68200.txt
>  create mode 100755 drivers/gpu/drm/panel/panel-raydium-rm68200.c

Applied, thanks. There were a few tiny things I wasn't entirely happy
about, but I fixed those up myself.

Most notable was the use of DRM_WARN_ONCE(), which is bad in this case
because it won't show any subsequent errors, ever again. I think in this
case the proper solution is DRM_ERROR_RATELIMITED(), or erroring out on
the first error, assuming that subsequent operations won't succeed
either. I went with the rate limitation.

Thierry

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqmNHAACgkQ3SOs138+
s6FJPxAAkcVyNFgq6clEHSv/FUN5JRrV8NAYLAomWppOAD46e/9EekeQEPiPJ1zS
UWcUDu/xySAH+FlkIgecDeO6v+V2F56qBEkrRyxqXTGtBffv2Q/p/jDioDGUniMA
63eSn4OUeHv4FEAyx1k92gdCxKdNwGMFINMkMvAOha3MryXGp4UpRfkiv3jFDJdG
6XQyUSV4UCtw33GA32kkCMSINNFZZHtxGuav6MUe4ZV32wYNca3dNnuBDTb7Ucu6
oJyZvyiX56ZrHd1mWW3ehR5ilt+5fobZjzNwnUiipdVLO3j+aWjHzm5xxNrw0C3a
HPiQuN2oCF5Y7umnMpLVX/0jJPMKzCNV51nZJsWU3s1AoZ9jA5eqrrisVWGnlZC8
f5Wkms/1zjX8pIgsejD/QEZinKHr0SaX899MOPG4nbfBdtx52gNFVRiYereicmRe
YBvzDVxpQPlsKHR0N8vVCm+jjXcdi2UeFMgTlCmm7WIyExvU/MDzXB6hPquWW6zN
A9VF6lOUKIBw0q5dsg4VMa533p2LDvmeW0akXtL+nO6IZqJfAHKj2+wb6KZkayUV
J6iiDwvYPw2Q6ovmCtvcytH+S88CEiYMzt50g8B32H7SGSkeBIUlfIpBifiNwQT4
sn7l1ieNAEThrOkv4mLL20g2PYdDBARFp+VaGoCMpT7as96zcD4=
=w22k
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--

--===============0414327520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0414327520==--

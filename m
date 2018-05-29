From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 RESEND] display: panel: Add AUO g070vvn01 display
 support (800x480)
Date: Tue, 29 May 2018 16:26:06 +0200
Message-ID: <20180529142606.GA22634@ulmo>
References: <20180410102927.17787-1-lukma@denx.de>
 <20180514190849.18723-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694544581=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180514190849.18723-1-lukma@denx.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1694544581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2018 at 09:08:49PM +0200, Lukasz Majewski wrote:
> This commit adds support for AUO's 7.0" display.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> ---
> Changes for v3:
> - Remove not used 'bus-format-override =3D "rgb565";' property
>=20
> Changes for v2:
> - Add *.txt suffix to the auo,g070wn01 file
> ---
>  .../bindings/display/panel/auo,g070vvn01.txt       | 29 ++++++++++++++++=
++++
>  drivers/gpu/drm/panel/panel-simple.c               | 31 ++++++++++++++++=
++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g=
070vvn01.txt

Next time, please use the standard "drm/panel: " prefix, which increases
the chances of me seeing the patch.

Also, it's usually a good idea to split patches up into one that has the
device tree bindings and another one that has the driver changes.

Applied, thanks.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlsNYvsACgkQ3SOs138+
s6EJ3A/7B3hYtcRF8nz6PhemNmpyvVMmtIkKN1VuUTw1ywWKe3sdv8mN3w3Hs25t
wOyRJKKvV5uOPMfWtyA8FIp/IaR+HCJABlYp/KQkAGsV5C0qRVSYBrLtPvCtM9c3
RsAsSN3Lg7hsA/W1IiNMt2JWBpeY7xGmk7HHXJWMKJjCmHelBKi3y/RMxAXejBs+
+RkDbTi7+g90b8pxQY/IjOsvSA3kIRQTrzqwXE8MmUQLLvGXwdkkd4bXBsmYA88I
kHpEAqo0eJC+bwtSjt/HZAtt1atiXMclzGwGdYzH/HjEk9/LZZ2AIHFS2YPtNKmr
AHza597m8P9UPp5lIzcG7s7AoPyNNTx8neblLCVMuJvSvGIFFJNLJ9vhHELRG1yb
2O21sdsAK0k/9ALOiOxgcDiZhijzgTl6H1RUCuIBDF8QLmObpgSxKhrqvyorjNHS
INCW0qOKL2OWkZR643OpWgV9gDujS3yah0Zaoj5G2h97J88SuCqKIlzJL8he8iWC
kV8tWSxUZ9p0x74kVNmvwFAGhJAYoySilxQ3j2VgDAxZh0kbCsL/EeP94MRp1f2v
+jam7fOGciLQ+XSWnC5J4VttBO64/oIsDx29CRZHBYqFwQ1vMxP26xcycNwsk/2R
+9kBLhcYeFguVGqjvJcX0jDpW2hxU0BSIKQfKrBP6IAvV2Ec6SU=
=vYjZ
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============1694544581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1694544581==--

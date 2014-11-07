From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] drm/panel: add support for Innolux G121I1-L01 12.1"
 TFT LCD panel
Date: Fri, 7 Nov 2014 10:06:23 +0100
Message-ID: <20141107090622.GB17131@ulmo.nvidia.com>
References: <1415292275-29726-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0214190345=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1415292275-29726-1-git-send-email-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0214190345==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pvezYHf7grwyp3Bc"
Content-Disposition: inline


--pvezYHf7grwyp3Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2014 at 05:44:33PM +0100, Lucas Stach wrote:
> This patch adds support for the Innolux G121I1-L01 12.1" TFT LCD panel
> to the simple-panel driver.
>=20
> This panel is connected via LVDS and uses the data enable signal for
> timing. Since HSYNC/VSYNC are ignored, the split between sync length and
> porches is arbitrary, as long as the complete horizontal blanking interval
> is 160 clocks, and the vertical blanking interval is 24 lines.
>=20
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/panel/innolux,g121i1-l01.txt          |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/innolux,g121i=
1-l01.txt

Applied all three patches to the drm/panel/for-next branch.

Thierry

--pvezYHf7grwyp3Bc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUXIuOAAoJEN0jrNd/PrOhb5UP+gM9KqUGaIdY0TVIUihhTL2N
GILiqBtjcXyPzCmwRmJ+SPF8tA2vhCFFMvMvuANuAH4wSkTTouahj7ybKSFJIjYq
S5MtseRUhspyk73vWe+7zcOV/+7Iz4komEcOWvFqFvXToFE8Eqw0ysg6A2giKGpC
jq7xxuKLPLxwlBtofv+eSJtCiJ++GigvtONmlJ/XXQWn+Yboyfzhc3pReT+OCGKc
deCg0nLusJ8aOn021LElR+3HTCBvBdV6B1OZfVqbIcINZojdrRYGa8YaOxjbhGdK
CkX3EdxIiri+vUSYSF5R807FV4YT87uYZlOdfwiTrI+m5xFehed6CeFmMWnr+m1b
C/Uow9SvHJ7oTIVF07GLGELwsKytx7Mb86HkWXVs/Ap3ByJvOGVx8chKZ5tWZ5pY
CktDVYFjWUebYawyINIOmDneHU3fx9gRVpVzgyu5lc/1NcU80hDFHTu4aNYmBXJf
7vShlXdi9nJcHeIzx32llqQO1wva7BLCOk6an66hVACXhxGf+NMtIYU5QdUNgNSK
RzQoAwu5iyROdp8FpybhRtMaOqjQ/Z2uGDqGnrJdpjdfwYRXCjwwPTPRK8cc2XjJ
TtInnRLVNG+H7e0jrB1ifwPLlqRGW14yah5BCYc5DPnAuVAiKrliBPswsSWaMCbK
7ruqsxJ4O+5nCYTkgEgD
=b9RZ
-----END PGP SIGNATURE-----

--pvezYHf7grwyp3Bc--

--===============0214190345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0214190345==--

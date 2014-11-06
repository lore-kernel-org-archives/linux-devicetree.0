From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add HannStar HSD070PWW1 7.0" WXGA TFT
 LCD panel
Date: Thu, 6 Nov 2014 09:59:28 +0100
Message-ID: <20141106085927.GE26297@ulmo>
References: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de>
 <1414074666-3783-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1488667129=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1414074666-3783-2-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1488667129==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline


--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2014 at 04:31:06PM +0200, Philipp Zabel wrote:
> This patch adds support for the HannStar Display Corp. HSD070PWW1 7.0"
> WXGA TFT LCD panel to the simple-panel driver. The binding documentation
> is included.
> This panel is connected via LVDS and uses the data enable signal for
> timing. Since HSYNC/VSYNC are ignored, the split between sync length and
> porches is arbitrary, as long as the complete horizontal blanking interval
> is 160 clocks, and the vertical blanking interval is 23 lines.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v1:
>  - Added bpc in panel_desc
>  - Use non-zero front and back-porches
> ---
>  .../bindings/panel/hannstar,hsd070pww1.txt         |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/hannstar,hsd0=
70pww1.txt

Applied, thanks.

Thierry

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUWzhvAAoJEN0jrNd/PrOh4W0P/1FUfZ/BxwvXiYVVBreJtLsI
g7BsLD97SjKuy4BgqrpIp9MhanbPwlC2XTFt1aYrBXj9h1jFdLtfnz/TN9TCmvtx
cq4TfpZ9uMBlXgLhqHPS/oPN2aRxc71RyLuV30USDsfz8LMIKTdyuO9rb712xuBR
Sx3Pn6d8n7Xe+KwfGlBvPKAm9ibjoUtSr9FTBOgjzYiK0w6YeogI5dylOMzoGfmh
WXYFZw9z8zimaAs918/Tys45TC+6aV8iLFTpiIfSkEu3lfa6pM3e6k9YIHt7uWIi
SdwgEC9Sq99w3leu9wdvq2E8t17YMPxfzFd7NFLf0/3TDwums4kr6F7F9isCftVL
tH6mB8OgsXGKA/m99J1P31WvuxQRl9mQuac+MrnSB9ggveIMhc+XK1HEq+xr5OQn
aaPLJGtBlEl4wR0LmBJszOxVHQX48hyt/C6NGMjCOecBtZ0HxdoeSe3ni1DpIvO9
fb8q/i9QfuPkxG2sJoobZ4j3kAIuUTtz03P0A1loSzKQNXgl2FJkRO3h4IAyiLSR
DBM2K3+G1ccXbQA3yRumkcSG0zMdlQHXEAx3lMsNoXMl/zKp6CvVzKc2/RTDlttW
ae+Ys3fTdqNFIBxdmzuqDhE5X5Qpd+1+33OFOKhTjffhEgTQ3rKg7QxqPqgBWKdC
BGETEdNF6YdF9c+FHvF2
=iu/u
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--

--===============1488667129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1488667129==--

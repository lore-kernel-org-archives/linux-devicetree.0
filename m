From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 12/13] drm/panel: simple: Add boe,tv080wum-nl0 simple
 panel device tree binding
Date: Mon, 23 Nov 2015 09:10:24 +0100
Message-ID: <20151123081022.GE14176@ulmo.nvidia.com>
References: <1448007339-10966-1-git-send-email-zyw@rock-chips.com>
 <1448007339-10966-13-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0070985453=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1448007339-10966-13-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chris Zhong <zyw@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, rmk+kernel@arm.linux.org.uk, ajaykumar.rs@samsung.com
List-Id: devicetree@vger.kernel.org

--===============0070985453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline

--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 04:15:38PM +0800, Chris Zhong wrote:
> This binding specifies a set of common properties for display panels. It
> can be used as a basis by bindings for specific panels.
> Bindings for three specific panels are provided to show how the
> simple panel binding can be used.
>=20
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> ---
>=20
> Changes in v4: None
> Changes in v3:
> move boe,tv080wum-nl0.txt to bindings/display/panel/
>=20
> Changes in v2:
> As Thierry.Reding comment, add a documentation for this panel.
>=20
>  .../devicetree/bindings/display/panel/boe,tv080wum-nl0.txt         | 7 +=
++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,t=
v080wum-nl0.txt

Applied, with a rewritten commit message. The one above seems to be
copied from the original commit that added the simple-panel binding.

Thanks,
Thierry

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWUsnuAAoJEN0jrNd/PrOhJhwP/2+v2FjZR+fgkArEsdukfz86
GKh+EAFWmCsd5rL7Fcdyi8zVBXXpviOfJ5T2IFGZfswoG39bbNIOaexDMJN7o2K/
gmrxETegKsyIobXeu9LE4kLWYoSHP536akEnK4zaR4u6A+FL/n1CFnwR2mIW4x36
GKJdHEMW2Qw6OV/fXYCDmup5J4gQuEgwx1KwcUMkNKavDbSD7qv+/jNtLthx1KjP
T4Q3ApQoMEB9AWFEc3+ilRomURG/ku60KyLRSK4BsoPEZ9NlTZSVdgY4CCOx0oPX
evsFLk11x9deRzngvQKBDhooDkrra1otghya1ykVsVSg5oOlrbfEH70sFvvHQZCf
KNk+ft6MXSu/0Nn9ihqmj83gYCvBECk/6ZatryWVFJTLk/uk9P2iQWEvOrvuqm5/
4oZGkqwZaJ5pxojJrIyFjL2vIF2ZZIAOGgMQergKb2WumnpIT/MV7WK2efgouc7m
/J4/2Inoj5OjRgpgOh02cm4+raI7iyhE4qfcf9wyLErk756bCQq+AJdbUNHz2eh6
Aw45VJTnCnICSre54y+MUHE2VU0dlxpUHaxKEpJ4TmWTIHg/TgviFy9R/+mvEE7T
AiaLt0yDuJ4WvYeOsLZaM8upk6FQOijndnrZA6VqdLTvR2gDCuez1a1ZROuywfJJ
b0YAIo0jpe8ooP25i2qH
=mtQX
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--

--===============0070985453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0070985453==--

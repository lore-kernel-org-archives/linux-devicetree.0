From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 11/19] drm/panel: simple: Add timings for the Olimex
 LCD-OLinuXino-4.3TS
Date: Fri, 15 Apr 2016 17:01:35 +0200
Message-ID: <20160415150135.GA1088@ulmo.ba.sec>
References: <1458751122-23976-1-git-send-email-maxime.ripard@free-electrons.com>
 <1458751122-23976-12-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010379155=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1458751122-23976-12-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>, linux-sunxi@googlegroups.com, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Kaplan <alex@nextthing.co>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0010379155==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 05:38:34PM +0100, Maxime Ripard wrote:
> Add support for the Olimex LCD-OLinuXino-4.3TS panel to the DRM simple
> panel driver.
>=20
> It is a 480x272 panel connected through a 24-bits RGB interface.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/olimex,lcd-olinuxino-43-ts.txt   |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/olime=
x,lcd-olinuxino-43-ts.txt

Applied, thanks.

Thierry

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEQJOAAoJEN0jrNd/PrOhWLQQAJxGXTx8OqnCau8X+jwvtNP8
2hRshipsrhvWtGtAtTkAGTNg7edm+2NO41t7l4kitjMj84BxE0GATUE1rnVidwfC
j99FCxLitK9zDne/rB9sGm1SGpe3TVH6+MNZVklzETJdWGlj+7J2oxW/HPt6XFq5
JEfP4/m1vR4XtKJUaWj2nXPjN+BBQQDF9nkWc74a5mX3KVolMhFVOVHLRH1C8jx7
TKn5AfKDq16LRWKA+HYu6VhbqCPuy9jCUdlgPiOUePwJdYtX2sYy9eoSeUAjiv0K
7ahBV5KM/6PjbfIHuBM2s0UU1TZrZJKX5n+/VS+2iMdhhGKQg5kmCuxQ5QjadP1K
nOFVJ7HLr2kIh1KQPBW9xZ/FTtpiSYIvuunXhICqaIohtiIFbY9kO5wnxUFOUct6
We0b9YQ96QU+qFm2tSzkKRfL5aVBq5mK5WQ5JZoVEM6iM8ZJTaJlfZZVYjf9CDGH
i8voQU2tywfTvn88VI1dMG8lSDUI+y6leaDKedbnyCGEm+uW12zyCmGCZlHWnIP2
2zYKben/P00vene5xXrsAHJoHhHGZd73fWNnB3UgJk7nqGQP/JQzaurxuJgGfxFC
27XytmIsegFtV33zDCSj1sQWKEO/KV1QemaieYRUg301scGUxcf6VPdQftb4ir1i
xTgimkgbknhRdAqjse+s
=y81Q
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

--===============0010379155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0010379155==--

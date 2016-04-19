From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 09/19] ARM: sun5i: Add TV encoder gate to the DTSI
Date: Tue, 19 Apr 2016 11:58:53 +0200
Message-ID: <20160419095853.GC26050@lukather>
References: <1458751122-23976-1-git-send-email-maxime.ripard@free-electrons.com>
 <1458751122-23976-10-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1425576704=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1458751122-23976-10-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, linux-sunxi@googlegroups.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Kaplan <alex@nextthing.co>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1425576704==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 05:38:32PM +0100, Maxime Ripard wrote:
> It turns out that the A13 / R8 also have a tve encoder block, and a gate
> for it.
>=20
> Add it to the DT.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied,

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXFgFdAAoJEBx+YmzsjxAgc54P+wavT5xCGpseStzDlqjbYp06
7rxMyZ2zeRZzAb7Eyo1bKPRjQ54/Kng1vIvsc0TlkVAXrAVFK/L+ta0CRIbzbkt4
nsw4GEVPn2KTe7d+wkpjqwMmRnjcMm8jufcg3YFzwCieybeiuRxVE9o7/imenh1w
6Q9tAWYvJlOUAjdQsr5AWYXDYriWsj/9eZAGBQIYi7XCTbjo1W15p3X/D6mUO8Iw
6FHGdjh5jbmBZn25hINUgdcjqiWIqUSop+sJG8NoA3IatkOq1GdQL1defzEB/OoT
eX5mRJqvuEEvkl9HVuqBV4Le+4+VcFDA03do4nHduKdiCKu3qJvC76Ygoun+tOVd
DB3mbL00Rq2pJZ/x0dZQFhajsSx63dmfmAfK7OHIunuuXKjubMQSSaD5Z6ZVeklb
66TLgiTDmbaBlAfwcq9C4EoEwGNm/eD/rUNwf9lvHBRNYKoqaH5gqSBpUkXrPHG4
kUY9yf35gi3XRX6bmGZkAeWZRXLTG56czELRWwqVX4K0uUc2mdQlLjl++ZG6GRDe
PISpBKGCZYPBJPeDd1Svpcude6mSBhbY3tCEh47MR5mb0L+dyuZEi3PyrwQ0gVxL
CJwTX4dkZxwHYHWFf7XGLnfifMcScaFWfK0AThvVQViGU7O4j7/a+DwHIJpDFfZg
Njt27o4cskxoUI9CokHx
=hIwr
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--

--===============1425576704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1425576704==--

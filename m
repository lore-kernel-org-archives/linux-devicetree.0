From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 06/13] drm/sun4i: hdmi: Allow using second PLL as TMDS
 clk parent
Date: Tue, 26 Sep 2017 11:58:38 +0200
Message-ID: <20170926095838.vvgdnm7bdodwtjzv@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-7-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0100707178=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170926065919.24446-7-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0100707178==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qttlu3ybmjip77q3"
Content-Disposition: inline


--qttlu3ybmjip77q3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:12AM +0000, Chen-Yu Tsai wrote:
> Allwinner SoCs typically have two PLLs reserved for video related usage.
> At the moment we only support using the first one to feed the HDMI
> transmitter block's TMDS clock.
>=20
> Let the HDMI encoder's TMDS clock go through all of its parents when
> calculating possible clock rates. This allows usage of the second video
> PLL as its parent.
>=20
> Note that this does not handle conflicting pixel clocks. It is entirely
> possible to have an LCD panel use one pixel clock rate, only to be
> overridden by the HDMI transmitter's clock rate request when the second
> display pipeline is enabled.
>=20
> This should be handled by having all the clock drivers honor clock rate
> ranges, and have the consumers use clk_set_rate_min/clk_set_rate_max.

That, or relying on clk_set_rate_protect

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qttlu3ybmjip77q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiTOAAoJEBx+YmzsjxAglWQP/izPBYzBNaNXOEgBjF1Cy4M1
/q16lgMmGlN3ybVuwvCsGqmtLm4WPB4GWtq5d7+yeEBuc/XwAHzUZHALzKlXJfeg
vRDU3br/GYHwmjB028IRb9Gu9tn5jLAB4HjtLzoxDqobW/HhjScRDy7YO67EmJeY
7LIPw6ndzQRfD3C683AHUYV1bCSD4JsNENH9U19/gaLQy+Glbp7G6PmMo5tw0oJb
CNwnsn4x8GPBD4N1uQpUFc9Yo8YwLNUJOIpsLUCeAgHHS7+uHA+WiSIlQDnait66
0tSCabXfKkVF50POS0I4TwwwwetF18uf4ywIBIXHYrXkisu+AOrgJG5W8ZpsPlDy
w02cd/ns4FTe3JaLY4G6kTSmWgevKf2N/1hn3Yr9HxkytnfLQQ1EAGWIxkzaAClb
C7MXXczmKehRnSC3z+q5+hjVCUOAi/nkuqgqV42QXhYuQV6z7Clv649TB9E2SvMx
X8awPInOLu4tSlE+hQvm5NjJ+PIMXw3nsA6oEwrBthBEEKn+pibmNoqgrb/rBZrI
3LV8ib0FdFIU8QfiRbDc+k7NE/dPCf9Em1241iL6QgIAh4xOWzL9Waj08FCYssUN
NZD2IAYsiDnhGw6hgtIHIcOoox8mibMCQcOKKO5xEvbdiMDGosGrcrBeoOLw95Gx
8SimeMY+GH8mcgBsxk7d
=cSMz
-----END PGP SIGNATURE-----

--qttlu3ybmjip77q3--

--===============0100707178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0100707178==--

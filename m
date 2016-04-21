From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 04/19] clk: sunxi: Add TCON channel1 clock
Date: Thu, 21 Apr 2016 18:56:14 +0200
Message-ID: <20160421165614.GR13045@lukather>
References: <1458751122-23976-1-git-send-email-maxime.ripard@free-electrons.com>
 <1458751122-23976-5-git-send-email-maxime.ripard@free-electrons.com>
 <20160415223936.GU14441@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Sa0i77dkqaUxqYg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160415223936.GU14441@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>
List-Id: devicetree@vger.kernel.org


--1Sa0i77dkqaUxqYg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2016 at 03:39:36PM -0700, Stephen Boyd wrote:
> On 03/23, Maxime Ripard wrote:
> > The TCON is a controller generating the timings to output videos signal=
s,
> > acting like both a CRTC and an encoder.
> >=20
> > It has two channels depending on the output, each channel being driven =
by
> > its own clock (and own clock controller).
> >=20
> > Add a driver for the channel 1 clock.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
>=20
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1Sa0i77dkqaUxqYg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXGQYuAAoJEBx+YmzsjxAgU4AP+wdIGhuiGxzD8IkTlTBZ9KYp
Y7N5If0LdSei8XNy/GkAkQ/FCD8iaYj86OormkWXWCjFTiOwe+WzCJUg/sW/X/5Z
BeJsKi/anc7olsBu7MdxmkwTo5YDfpCeCHm9fad0SIPNqGkEIHkvTdSqIwvDN/Bj
ntjR3aVZGLIYi1/F+jeQy0G9AS7wL8N+N8OovryZ9JyIgIGzcQUaB0/0D6DdvgDN
vajl+vlY8FpTNxNjiCGPc2E2a+4H2AjZEkpGHggVucV512guiCwmd4Hsx28Z94Hn
iRvveMiwBqgKQEChu647NP07mkvrt72VEKEo0tIfA7pGKweE85tCE+x58ndJyIZW
sE1DpGTB9oHC8aOtdvgT988YoEQmCgQh6lNK/4sfguSj1/V/1zSMuQN2/cHrxDvE
1Y6ujecmFmHG1gnSC72XBuXM5NxhtSuDKBjEY+cEK84lJDT6vFecaPR6PdTsZ/+X
8920BW8HEAeJVYOoC9xYw9i8Xoe7IFTfEr92YYt0aQ/UkR0RAcfwbLHLFS5MpLFb
Xur9zJVIeMPZvEEAfbSge64qvtclWM7DoOEtJ0PSCZbrZNaEelfSKFerv/bWf5Kg
ky4+osPOOiiYXlXs1czwoxuypaWJpt//E4O1xejyoS0o1wtuBmaLhK9vYmA7l7gs
1/zF6qwA1Zm+psUvH/lK
=uhOr
-----END PGP SIGNATURE-----

--1Sa0i77dkqaUxqYg--

From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 5/15] clk: sunxi-ng: sun5i: Export video PLLs
Date: Wed, 8 Mar 2017 09:58:13 +0100
Message-ID: <20170308085813.ijwsdiip5wdrwnb4@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <4bb77a9793d4ba25bf633eff6abe41910bb7fc3c.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGRGNgUvNgQonORN0iTV-e2NJzUJpzQUnn13w+C7MwzvR8uZUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2132963379=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGRGNgUvNgQonORN0iTV-e2NJzUJpzQUnn13w+C7MwzvR8uZUQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "Mailing List,
 Arm" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============2132963379==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koor6xchwoiplnj2"
Content-Disposition: inline


--koor6xchwoiplnj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julian,

On Tue, Mar 07, 2017 at 09:21:19PM +1100, Julian Calaby wrote:
> Hi Maxime,
>=20
> On Tue, Mar 7, 2017 at 7:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The video PLLs are used directly by the HDMI controller. Export them so
> > that we can use them in our DT node.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun5i.h      | 6 ++++--
> >  include/dt-bindings/clock/sun5i-ccu.h | 3 +++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.h b/drivers/clk/sunxi-ng/cc=
u-sun5i.h
> > index 8144487eb7ca..16f7aa92957e 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun5i.h
> > +++ b/drivers/clk/sunxi-ng/ccu-sun5i.h
> > @@ -28,15 +28,17 @@
> >  #define CLK_PLL_AUDIO_4X       6
> >  #define CLK_PLL_AUDIO_8X       7
> >  #define CLK_PLL_VIDEO0         8
> > -#define CLK_PLL_VIDEO0_2X      9
> > +
> > +/* The PLL_VIDEO0_2X is exported for HDMI */
> > +
> >  #define CLK_PLL_VE             10
> >  #define CLK_PLL_DDR_BASE       11
> >  #define CLK_PLL_DDR            12
> >  #define CLK_PLL_DDR_OTHER      13
> >  #define CLK_PLL_PERIPH         14
> >  #define CLK_PLL_VIDEO1         15
> > -#define CLK_PLL_VIDEO1_2X      16
> >
> > +/* The PLL_VIDEO0_2X is exported for HDMI */
>=20
> PLL_VIDEO*1*_2X, right?

Good catch, I'll fix it. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--koor6xchwoiplnj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYv8elAAoJEBx+YmzsjxAgHb8QAIkagbWudUksxLDQjOC3Q/VG
oWkTzSIPbyt5Hg7hrimpvPr1Sgsn22xdk/lZYv2rYnlN6kIVKm/7GlBDRSx18jcV
SEaA4ImOMF0GZ6EKxrr7Ehoi+spHJiwIgtTxNQK2N3PCE5MOjmoSIIWk3Yd9ajLq
QBfgAhsTc+A7hv8Evop5oayUSlhRdcoYK440dh0hcHNSULhHmXXmPMvUkdjq/uwJ
osaB29OtD+f1dItlo+10Gxypc1fGKnejADrscyFst6h+MaIARxCB11AT4BGROxMR
WefiZvI3x9ixgafVlRZ+0PFRLwS6obglYqo76B/AHTx6isxtiY7VOmTj/1p6qiOX
Q53F73ricbgt5+ayfPd8T9UzSJk7XxFwSEUO2Q5ZlQPn/cs0y7lbGPS+aeuklG66
k5I8qg8V2Pnw7pBFE5MfyWn3qQC4KKcqgdYCZoqcWVAus1Dn5f3RkJKZp0L9wsT9
KJhZW/fMnijvw9mqCjSkA4Qg6eeanWZTa2OvTG7qu7amS6FcO/h4Gzi47qgU83Yi
9vB1MH5Ct7nlEq7waLSBL5s6mFWRbyhbnLOuLOiUnBVDXYiix1kEqw0DDfGo7B9k
coRZIVkPl1b1ATyCA4WVUNP8x9zXWmUqCi4xjlRKlXG3HJ0r0UpY4qPA05unrEh9
hZndP7p4AehRQY+2OeWo
=M/2G
-----END PGP SIGNATURE-----

--koor6xchwoiplnj2--

--===============2132963379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2132963379==--

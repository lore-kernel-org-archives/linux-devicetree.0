From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH v2 20/20] ARM: sun5i: a10s-olinuxino:
 Enable HDMI
Date: Wed, 10 May 2017 21:23:58 +0200
Message-ID: <20170510192358.taufs5tsyifueued@flea.home>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <c7ac6faa0568e6418291255af537c4b070bdea63.1493812478.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65S2pw3z8NZ+tkPkF=A=5z2toRkC+26pAs6La6CNyeXoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1878546893=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v65S2pw3z8NZ+tkPkF=A=5z2toRkC+26pAs6La6CNyeXoQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1878546893==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nnojppk2eig6un6o"
Content-Disposition: inline


--nnojppk2eig6un6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 04, 2017 at 04:05:18PM +0800, Chen-Yu Tsai wrote:
> On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The A10s Olinuxino has an HDMI connector. Make sure we can use it.
> >
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts | 29 ++++++++++++++++=
+-
> >  1 file changed, 29 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts b/arch/ar=
m/boot/dts/sun5i-a10s-olinuxino-micro.dts
> > index 894f874a5beb..1d13b6407222 100644
> > --- a/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
> > +++ b/arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts
> > @@ -63,6 +63,17 @@
> >                 stdout-path =3D "serial0:115200n8";
> >         };
> >
> > +       connector {
> > +               compatible =3D "hdmi-connector";
> > +               type =3D "a";
>=20
> Just curious, should we take this into consideration when creating
> drm_connector?

I'm not sure, no other driver does so. And I haven't seen any of our
boards with a HDMI-B, C or mini-HDMI connector.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nnojppk2eig6un6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZE2jOAAoJEBx+YmzsjxAgCioP/2rIPNKWgGmGCDyprDbgnHIK
09g/WDmj5wAkxrbo2Y7e8+Uz0vuT78uzDLPQUzgwZK6Jvs8nZUkYWcdTFKKF+D96
5t50lP78C/x31+jvGM8F+kmj2SbH5Yc0OjIcQyro06TBUigmR1nP+Aa5FwJqY6FF
ZwHYbLMt+rRnNwqQ0s+D1QUu2fPiQwPzdNcL1mbzagb4Q7ZlXQWAotGfJT16Mw5I
iO+MThbP+PJLUygYiJA2CJWvzzH3ghjUr98dSJK+6Y2KFGCerYo+gsqR7hyvWMwv
kkfVJXwpPjQw6J+xWNI6LlvHvClhLT2QDAgLaGfC7nmtpxWHWhiWGy35XbZghQIm
QK0gNM6v7lcyhrTFcFbW2WEvbnN8WH1+c0JO570BBCcmgIOUEO8i+rjxoji2lER6
dsv1MdDgSFi9CHUG1+lBACgNDdCP2uojBK+4NfBr3QPP9O4+g6MypGNxE70X3Tlh
7qywL76RiQ2kXSMcFJTbpUdwNxRIyhOchFeIDvUTcPG22MvRxLn6i3MsdX/9M50x
7CUFjSLW4q2Mk/HFB7o8LZtBIfzLFGprj+J1RvzL1Bkq6bugZUohfEts7pYXrie9
IPjSnsB/rYRji1p8bDbxdghzRTYtUqy2dheSvf4HWgB6k67VVmiOAHte3M4ykjs7
zTm2R87KYoYS3SrgpwEo
=2Zca
-----END PGP SIGNATURE-----

--nnojppk2eig6un6o--

--===============1878546893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1878546893==--

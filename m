From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for the
 Sitronix ST7789V panel
Date: Tue, 7 Feb 2017 16:44:42 +0100
Message-ID: <20170207154442.dntmddoft3zacxis@lukather>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <097eb2ad92f68f0f1a7c035c9b6b094afaf34dc1.1486115846.git-series.maxime.ripard@free-electrons.com>
 <20170206130549.GA28955@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1265385489=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170206130549.GA28955@ulmo.ba.sec>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1265385489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hob72f63c5vwcrqp"
Content-Disposition: inline


--hob72f63c5vwcrqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Mon, Feb 06, 2017 at 02:05:49PM +0100, Thierry Reding wrote:
> On Fri, Feb 03, 2017 at 10:59:05AM +0100, Maxime Ripard wrote:
> > The Sitronix ST7789V is an LCD panel controller, controlled over SPI, t=
hat
> > can drive 18-bits 240x320 LCD displays.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt |=
 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/sit=
ronix,st7789v.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,s=
t7789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st778=
9v.txt
> > new file mode 100644
> > index 000000000000..f70e6e9c54ed
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.=
txt
> > @@ -0,0 +1,36 @@
> > +Sitronix ST7789V RGB panel with SPI control bus
> > +
> > +Required properties:
> > +  - compatible: "sitronix,st7789v"
> > +  - reg: Chip select of the panel on the SPI bus
> > +  - reset-gpios: a GPIO phandle for the reset pin
>=20
> Shouldn't this have some sort of power supply?

On the board I currently have, it's just tied to an always on
regulator, but you're right, I'll add it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hob72f63c5vwcrqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmetlAAoJEBx+YmzsjxAgMnwQAI6aMgUSnCYK4OHYHGrZhskj
cMygNgZL7m+cbTuVHFATcuA02Ps/82nn9o6NN/E7Z5VAwRuWPe6V7944ZWRvSLtD
5zTBFw9WOkzOQlXF7EoRO2ZC53sMb0e9Z4a2MouJeWpk2YdvDmf8iJ2exG3kCBfz
COGw46YV1i5+xoM3k07kiWuZuyvcm/zuyRWOY3CX/5KvCY8YRnhvu0389moD/hAn
STGfT7ucBz+OeRuwHAvXLd2TGVRX/8Yz7l57C5JkyIcJirJEI8RgkRXGDt2Wm5V6
hc2xXfDfhOMjuE4FN3NPHsa9MYJGRAAbk32Pmr7nNgj7w+p10s4wwnqFCUTgcnbo
CmH4XnhoRma8x0/FEJPuXb33UZmt2aJsjn0R7CE1OszYyqBt0/KroGila5YbLafL
Kwk5Pw9Uxll39b3Xv214cJq+egXbeIs8LhTeWJp+BL3Fo6QdKg4mLbOe+TG6pX+r
Hfb8JU0ZmyeXZX4A9LBfJV0yd8FQWIkl/rYdV+hji/coPH4sFpcAdigvDyfIKncf
2Q60xmpAL5qXCwqI0rzhCp9zd9ubSk6HLDH9Q/M1XJKsJKaGYxn/rUjHPOHlixPQ
EHukZmvW1XzoDmST/kCVc9AuFPgeI+FvIYzTk20aGHt6L76ak9h1XPRm2AvNkeE1
WaQjxAkVIFngOkabu4Me
=+soU
-----END PGP SIGNATURE-----

--hob72f63c5vwcrqp--

--===============1265385489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1265385489==--

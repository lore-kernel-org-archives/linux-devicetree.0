From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 08/10] drm/panel: Add Huarui LHR050H41 panel driver
Date: Fri, 2 Mar 2018 10:52:04 +0100
Message-ID: <20180302095204.jskwptipqa6x42gn@flea.lan>
References: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
 <33efcb267bc513bb19551f1ffdcf578ebfb90369.1519204731.git-series.maxime.ripard@bootlin.com>
 <CAGb2v66c-KntNqkb0=qyP2JCafUOcPuh1o_VqeGencMXEuEfMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1116858971=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v66c-KntNqkb0=qyP2JCafUOcPuh1o_VqeGencMXEuEfMA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1116858971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ds3enghugvzc5jav"
Content-Disposition: inline


--ds3enghugvzc5jav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 21, 2018 at 11:36:10PM +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 21, 2018 at 5:20 PM, Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> > From: Maxime Ripard <maxime.ripard@free-electrons.com>
> >
> > The LHR050H41 panel is the panel shipped with the BananaPi M2-Magic. Ad=
d a
> > driver for it.
>=20
> So I distinctly remember questioning the vendor name the first time.
> I would just use Bananapi as the vendor name instead.

Ack.

> > +config DRM_PANEL_HUARUI_LHR050H41
> > +       tristate "Huarui LHR050H41 panel"
> > +       depends on OF
> > +       depends on DRM_MIPI_DSI
> > +       depends on BACKLIGHT_CLASS_DEVICE
> > +       help
> > +         Say Y if you want to enable support for the Huarui Lighting
> > +         LHR05041 DSI panel. The panel has a 1280x720 resolution.
> > +
>=20
> And it seems this panel is driven by an ILI9881C from Ilitek. So
> maybe you could make the panel driver more like the IL9322, as in
> having common code for the driver IC, then a data structure tied
> to actual panel compatible strings to handle any quirks.
>=20
> The datasheet can be found simply by googling the part ID, or here:
>=20
>    http://en.startek-lcd.com/res/starteklcden/pdres/201706/20170617115241=
070.pdf
>=20
> This should help with the init command sequence.
>=20
> I also found this:
>=20
> http://www.ampdisplay.com/documents/pdf/AM-7201280ETZQW-00H.pdf
>=20
> which might or might not be the same panel.
>=20
> Now the IL9332 driver simply uses the device model (Dlink DIR-685)
> as part of the compatible string.

I guess we can create an ili9881c driver then, with the lhr050h41
compatible. I'm not sure there's much more we can do at this point,
since in order to know the set of quirks to associate to each
compatible, we'd need to have a second panel.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ds3enghugvzc5jav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqZHsMACgkQ0rTAlCFN
r3SH3Q/5AfVYCIONgIeWRUHZrG68dT8xGO2WVYGk/XjlE7ftsdrI5moyJAKb1oYv
5aAbavptdLw8S+/+M9mu8ell/uFAguvY4OkHrvwvkKf8Rzzlir6UQEDEMMIdHy1a
fMoFuu2f/lvLw8tFvTJeF/AAVrcFVaxY23rv1L+vw0FyKuACiKkemEQDrGHoYFJu
TSZfYcbEwcyMSIH0wZrw2cIf+Gpm4k4ccKf7BVFquD4+de+ORLHr3tCfLtPI57Cj
D2VTBwPJ05HFAH28yVEoFXjw2UChPC48cIyoTIVgfLfJhY3gi+pCct1kHtoxhlZt
W+dW1vRpA1ItYI6XsJLYTx9WZRnXrJHLgXzrajZ5wSZB9Us2LVyBjgqzW7cK8MhS
tBRBzDRsTuN4qi9vroP9XAalji2SbIRkWl1FmwOnTdklGK7F38jjvsRAcC4OPoFf
k805LOORVL98YSdnxD9rC7EUL7BArqG7eHBKPc0PZI9b+b4kWVVsQ562R+uffPW0
Dpo4hLchKB83Y2TwIvdkVkkDC88bKPXCEB3xuqDXRJ3TCzhRICaMYMXAcUwDnY/k
XPa9vkdWlctF4BdEvuTMzAM9bFmL0kNkEJYo5a6Pr968IT5DmvE7ymxE935WmDV3
pLwtH2etAhOGddbaov4cfEsHbf9RQQrxQ0quBJGBWWQ3JLQru5w=
=WxHl
-----END PGP SIGNATURE-----

--ds3enghugvzc5jav--

--===============1116858971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1116858971==--

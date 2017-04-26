From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 13/15] drm/sun4i: Add HDMI support
Date: Wed, 26 Apr 2017 08:50:05 +0200
Message-ID: <20170426065005.zoewz53q7l7r5e7p@lukather>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <c63d01aedeccc58bf8d6f5bfd66d8595156e9491.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66n6AXbOAh05V_Gv2UgRp=xEMG9qhJU8JSuy4-F-UOQQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1812245687=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGb2v66n6AXbOAh05V_Gv2UgRp=xEMG9qhJU8JSuy4-F-UOQQQ@mail.gmail.com>
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


--===============1812245687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="is3dkn7zscvo5sqd"
Content-Disposition: inline


--is3dkn7zscvo5sqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Fri, Apr 21, 2017 at 11:17:17PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The earlier Allwinner SoCs (A10, A10s, A20, A31) have an embedded HDMI
> > controller.
> >
> > That HDMI controller is able to do audio and CEC, but those have been l=
eft
> > out for now.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  drivers/gpu/drm/sun4i/Makefile              |   5 +-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi.h          | 124 ++++++-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  | 128 ++++++-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c      | 449 ++++++++++++++++++++=
+-
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 236 +++++++++++-
> >  5 files changed, 942 insertions(+), 0 deletions(-)
> >  create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi.h
> >  create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> >  create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> >  create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
>=20
> Applying patch #9608371 using 'git am'
> Description: [13/15] drm/sun4i: Add HDMI support
> Applying: drm/sun4i: Add HDMI support
> .git/rebase-apply/patch:116: trailing whitespace.
>=20
> .git/rebase-apply/patch:531: trailing whitespace.
>=20
> .git/rebase-apply/patch:701: trailing whitespace.
>=20
> warning: 3 lines add whitespace errors.

Fixed.

> > +int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent)
> > +{
> > +       struct clk_init_data init;
> > +       struct sun4i_ddc *ddc;
> > +       const char *parent_name;
> > +
> > +       parent_name =3D __clk_get_name(parent);
> > +       if (!parent_name)
> > +               return -ENODEV;
> > +
> > +       ddc =3D devm_kzalloc(hdmi->dev, sizeof(*ddc), GFP_KERNEL);
> > +       if (!ddc)
> > +               return -ENOMEM;
> > +
> > +       init.name =3D "hdmi-ddc";
> > +       init.ops =3D &sun4i_ddc_ops;
> > +       init.parent_names =3D &parent_name;
> > +       init.num_parents =3D 1;
> > +       init.flags =3D CLK_SET_RATE_PARENT;
>=20
> I don't think this is really needed. It probably doesn't hurt though,
> since DDC is used when HDMI is not used for displaying, but it might
> affect any upstream PLLs, which theoretically may affect other users
> of said PLLs. The DDC clock is slow enough that we should be able to
> generate a usable clock rate anyway.

Good point, I removed it.

> > +       writel(SUN4I_HDMI_VID_TIMING_X(mode->hdisplay) |
> > +              SUN4I_HDMI_VID_TIMING_Y(mode->vdisplay),
> > +              hdmi->base + SUN4I_HDMI_VID_TIMING_ACT_REG);
> > +
> > +       x =3D mode->htotal - mode->hsync_start;
> > +       y =3D mode->vtotal - mode->vsync_start;
>=20
> I'm a bit skeptical about this one. All the other parameters are not
> inclusive of other, why would this one be different? Shouldn't it
> be "Xtotal - Xsync_end" instead?

By the usual meaning of backporch, you're right. However, Allwinner's
seems to have it's own, which is actually the backporch + sync length.

We also have that on all the other connectors (and TCON), and this was
confirmed at the time using a scope on an RGB signal.

>=20
> > +       writel(SUN4I_HDMI_VID_TIMING_X(x) | SUN4I_HDMI_VID_TIMING_Y(y),
> > +              hdmi->base + SUN4I_HDMI_VID_TIMING_BP_REG);
> > +
> > +       x =3D mode->hsync_start - mode->hdisplay;
> > +       y =3D mode->vsync_start - mode->vdisplay;
> > +       writel(SUN4I_HDMI_VID_TIMING_X(x) | SUN4I_HDMI_VID_TIMING_Y(y),
> > +              hdmi->base + SUN4I_HDMI_VID_TIMING_FP_REG);
> > +
> > +       x =3D mode->hsync_end - mode->hsync_start;
> > +       y =3D mode->vsync_end - mode->vsync_start;
> > +       writel(SUN4I_HDMI_VID_TIMING_X(x) | SUN4I_HDMI_VID_TIMING_Y(y),
> > +              hdmi->base + SUN4I_HDMI_VID_TIMING_SPW_REG);
> > +
> > +       val =3D SUN4I_HDMI_VID_TIMING_POL_TX_CLK;
> > +       if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +               val |=3D SUN4I_HDMI_VID_TIMING_POL_HSYNC;
> > +
> > +       if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +               val |=3D SUN4I_HDMI_VID_TIMING_POL_VSYNC;
> > +
> > +       writel(val, hdmi->base + SUN4I_HDMI_VID_TIMING_POL_REG);
>=20
> You don't handle the interlaced video here, even though you set
>=20
>     hdmi->connector.interlace_allowed =3D true
>=20
> later.

I'll fix that.

> The double clock and double scan flags aren't handled either, though
> I don't understand which one is supposed to represent the need for the
> HDMI pixel repeater. AFAIK this is required for resolutions with pixel
> clocks lower than 25 MHz, the lower limit of HDMI's TMDS link.

I'm not sure about this one though. I'd like to keep things quite
simple for now and build up on that once the basis is working. Is it
common in the wild?

> > +              hdmi->base + SUN4I_HDMI_DDC_FIFO_CTRL_REG);
> > +       writel(SUN4I_HDMI_DDC_ADDR_SEGMENT(offset >> 8) |
> > +              SUN4I_HDMI_DDC_ADDR_EDDC(0x60) |
> > +              SUN4I_HDMI_DDC_ADDR_OFFSET(offset) |
> > +              SUN4I_HDMI_DDC_ADDR_SLAVE(0x50),
>=20
> You can use DDC_ADDR from drm_edid.h.

Done.

> > +static enum drm_connector_status
> > +sun4i_hdmi_connector_detect(struct drm_connector *connector, bool forc=
e)
> > +{
> > +       struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(connect=
or);
> > +       unsigned long reg;
> > +
> > +       if (readl_poll_timeout(hdmi->base + SUN4I_HDMI_HPD_REG, reg,
> > +                              reg & SUN4I_HDMI_HPD_HIGH,
> > +                              0, 500000))
>=20
> We shouldn't need to do polling here. It should just return the status
> at the instance it's called. Instead we should have a worker that does
> polling to check if something is plugged or unplugged. I don't see any
> interrupt bits for this though. :(

As far as I know, polling in detect is okay. Why would you want to
remove it?

> > +       ret =3D drm_encoder_init(drm,
> > +                              &hdmi->encoder,
> > +                              &sun4i_hdmi_funcs,
> > +                              DRM_MODE_ENCODER_TMDS,
> > +                              NULL);
> > +       if (ret) {
> > +               dev_err(dev, "Couldn't initialise the HDMI encoder\n");
> > +               return ret;
> > +       }
> > +
> > +       hdmi->encoder.possible_crtcs =3D BIT(0);
>=20
> You can use drm_of_find_possible_crtcs() now. See the TV encoder driver.

Ack.

> > +
> > +       drm_connector_helper_add(&hdmi->connector,
> > +                                &sun4i_hdmi_connector_helper_funcs);
> > +       ret =3D drm_connector_init(drm, &hdmi->connector,
> > +                                &sun4i_hdmi_connector_funcs,
> > +                                DRM_MODE_CONNECTOR_HDMIA);
> > +       if (ret) {
> > +               dev_err(dev,
> > +                       "Couldn't initialise the Composite connector\n"=
);
>=20
> Wrong connector.

Fixed.

> > +       ret =3D sun4i_ddc_create(hdmi, hdmi->tmds_clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Couldn't create the DDC clock\n");
> > +               return ret;
> > +       }
>=20
> We do all this in the bind function for all the other components.
> Any particular reason to do it differently here?

Not really, I'll change it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--is3dkn7zscvo5sqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZAEMZAAoJEBx+YmzsjxAglOkP/1mcGKViorRDjQaplvn7yRYp
oJhYOuXp5RRrSTv72V0VdGjHBoNyAW6QXiaocNUaV1Wr1NxIBlyrSlfquS/qPxFy
ywMldLLGPs1yandPQtdrf801Emp3XpqcZKhq5iuKxrDY7MbB3M9j++Z/3GUzIYoS
zAX+vLf5dnaXFyeN71SczbGr7J6JQFKKf+/q+RtLoBINjfCGGKddBSdCVtNfw3nx
X1LttRcJSoA7mll8EG6E/2zsgpTPWFhg5BROTp6GlNlpY5bq3PuqrWAZXNHVWwuI
vMF6UAt5Q4rV4NiA/evuTlKjoxhTfj7v95MJS9CeyQvCMBEfCLKeAQua1hXjl0Rf
XJhmcIbvtXo2oS8aeG47H8liCCY5ioRDIqXF+cPLD+OQCVmnJ4Fxb5AGkXvMHVAF
qKLC+zVQynhDMUs4CYVNIY4mfK19qVzDnFgX+raX6wk17v9k0Dc5wC55lWI15A7e
RwYvVh3xWFYKnFgCnBQKot1iN3lPesrN9NiQop75sAmmyEthowVx/y9zgLfh05Rz
+2+l+UmlMee1S36Yc5Zhwg0P48T+K1vCbdBTKC8USSnC7lprR8arejWBA7waBdPo
tKrA4t8vSNzpNWjFgGkrP5cnjIAEj8kjqr6+4BTDgYZvwDjKSPWl/CmpykiVWT2v
nn7LPC/gXWeTh2a8M9dV
=jpXQ
-----END PGP SIGNATURE-----

--is3dkn7zscvo5sqd--

--===============1812245687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1812245687==--

From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add VCC-DSI regulator
 support
Date: Thu, 3 Oct 2019 13:46:37 +0200
Message-ID: <20191003114637.qd723p4jviwbns26@gilmour>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-6-jagan@amarulasolutions.com>
 <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
 <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sioambykdk554e5i"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Michael Trimarchi <michael@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--sioambykdk554e5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 12:31:31PM +0530, Jagan Teki wrote:
> On Thu, Oct 3, 2019 at 12:26 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Thu, Oct 3, 2019 at 2:46 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Allwinner MIPI DSI controllers are supplied with SoC
> > > DSI power rails via VCC-DSI pin.
> > >
> > > Add support for this supply pin by adding voltage
> > > regulator handling code to MIPI DSI driver.
> > >
> > > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 ++
> > >  2 files changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > index 446dc56cc44b..fe9a3667f3a1 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -1110,6 +1110,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
> > >                 return PTR_ERR(base);
> > >         }
> > >
> > > +       dsi->regulator = devm_regulator_get(dev, "vcc-dsi");
> > > +       if (IS_ERR(dsi->regulator)) {
> > > +               dev_err(dev, "Couldn't get VCC-DSI supply\n");
> > > +               return PTR_ERR(dsi->regulator);
> > > +       }
> > > +
> > >         dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
> > >                                               &sun6i_dsi_regmap_config);
> > >         if (IS_ERR(dsi->regs)) {
> > > @@ -1183,6 +1189,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
> > >  static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
> > >  {
> > >         struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > > +       int err;
> > > +
> > > +       err = regulator_enable(dsi->regulator);
> > > +       if (err) {
> > > +               dev_err(dsi->dev, "failed to enable VCC-DSI supply: %d\n", err);
> > > +               return err;
> > > +       }
> > >
> > >         reset_control_deassert(dsi->reset);
> > >         clk_prepare_enable(dsi->mod_clk);
> > > @@ -1215,6 +1228,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
> > >
> > >         clk_disable_unprepare(dsi->mod_clk);
> > >         reset_control_assert(dsi->reset);
> > > +       regulator_disable(dsi->regulator);
> > >
> > >         return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > index 5c3ad5be0690..a01d44e9e461 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > > @@ -12,6 +12,7 @@
> > >  #include <drm/drm_connector.h>
> > >  #include <drm/drm_encoder.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > > +#include <linux/regulator/consumer.h>
> >
> > You don't need to include the header file since you are only
> > including a pointer to the struct, and nothing else.
>
> Yes, make sense. I will drop it.
>
> >
> > Otherwise,
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> thanks.

I've moved the include to the driver that was lacking it while
applying, thanks!

Maxime

--sioambykdk554e5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXfnQAKCRDj7w1vZxhR
xdo1AP9qbRxlDAMsATrfD1TcpRGv8AL/+bvjh0JOK0bF9TnEsAD/cPQeOM7j0eND
SGuUJnDS/wwejedPPPjCzS3+gawyeQo=
=fbpL
-----END PGP SIGNATURE-----

--sioambykdk554e5i--

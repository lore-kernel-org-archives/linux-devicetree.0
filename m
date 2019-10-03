From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v11 5/7] drm/sun4i: sun6i_mipi_dsi: Add
 VCC-DSI regulator support
Date: Thu, 3 Oct 2019 12:31:31 +0530
Message-ID: <CAMty3ZBmY+wZ4MZD1ipjnfhVy3gBRCqsAXGqF79mo+eaX=L2fA@mail.gmail.com>
References: <20191003064527.15128-1-jagan@amarulasolutions.com>
 <20191003064527.15128-6-jagan@amarulasolutions.com> <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBV5Z23WAKGQEIGZ5NMI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64RJeHXSDknPvH3RrDLqPzSvR-p2k2vA73Zt1xsOd5TSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 12:26 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Thu, Oct 3, 2019 at 2:46 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> >
> > Allwinner MIPI DSI controllers are supplied with SoC
> > DSI power rails via VCC-DSI pin.
> >
> > Add support for this supply pin by adding voltage
> > regulator handling code to MIPI DSI driver.
> >
> > Tested-by: Merlijn Wajer <merlijn-tF0PIh4TN3odnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 ++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 446dc56cc44b..fe9a3667f3a1 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -1110,6 +1110,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
> >                 return PTR_ERR(base);
> >         }
> >
> > +       dsi->regulator = devm_regulator_get(dev, "vcc-dsi");
> > +       if (IS_ERR(dsi->regulator)) {
> > +               dev_err(dev, "Couldn't get VCC-DSI supply\n");
> > +               return PTR_ERR(dsi->regulator);
> > +       }
> > +
> >         dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
> >                                               &sun6i_dsi_regmap_config);
> >         if (IS_ERR(dsi->regs)) {
> > @@ -1183,6 +1189,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
> >  static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
> >  {
> >         struct sun6i_dsi *dsi = dev_get_drvdata(dev);
> > +       int err;
> > +
> > +       err = regulator_enable(dsi->regulator);
> > +       if (err) {
> > +               dev_err(dsi->dev, "failed to enable VCC-DSI supply: %d\n", err);
> > +               return err;
> > +       }
> >
> >         reset_control_deassert(dsi->reset);
> >         clk_prepare_enable(dsi->mod_clk);
> > @@ -1215,6 +1228,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
> >
> >         clk_disable_unprepare(dsi->mod_clk);
> >         reset_control_assert(dsi->reset);
> > +       regulator_disable(dsi->regulator);
> >
> >         return 0;
> >  }
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > index 5c3ad5be0690..a01d44e9e461 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> > @@ -12,6 +12,7 @@
> >  #include <drm/drm_connector.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_mipi_dsi.h>
> > +#include <linux/regulator/consumer.h>
>
> You don't need to include the header file since you are only
> including a pointer to the struct, and nothing else.

Yes, make sense. I will drop it.

>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

thanks.

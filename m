From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 16/25] drm/sun4i: sun6i_mipi_dsi: Add support for
 VCC-DSI voltage regulator
Date: Mon, 29 Oct 2018 20:18:05 +0530
Message-ID: <CAMty3ZBky1kP-1Q+ja2BpcbTxdHgQOFn=T4bcnZwMz6zP+AcOQ@mail.gmail.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-17-jagan@amarulasolutions.com> <20181029093142.hgn4q6o7q32voutf@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029093142.hgn4q6o7q32voutf@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2018 at 3:01 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Oct 26, 2018 at 08:13:35PM +0530, Jagan Teki wrote:
> > Some boards have VCC-DSI pin connected to voltage regulator which may
> > not be turned on by default.
> >
> > Add support for such boards by adding voltage regulator handling code to
> > MIPI DSI driver.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Tested-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - new patch
> > Changes for v2:
> > - none
> >
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  3 +++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 42bd7506abaf..bc57343592e0 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -949,6 +949,12 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> >
> >       dsi->drv = drv;
> >
> > +     ret = regulator_enable(dsi->regulator);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to enable regulator\n");
> > +             return ret;
> > +     }
> > +
>
> The regulator should be enabled only when the device is in use.

True, but there is no device specific quirk needed because who ever
not needed simply use dummy regulator
[    0.245821] sun6i-mipi-dsi 1ca0000.dsi: 1ca0000.dsi supply vcc-dsi
not found, using dummy regulato
r

even like HVCC in hdmi driver [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c?id=633ba1e086e1abbeef1ffd899911de8cf3987d9f

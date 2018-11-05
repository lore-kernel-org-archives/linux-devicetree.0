From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 16/25] drm/sun4i: sun6i_mipi_dsi: Add
 support for VCC-DSI voltage regulator
Date: Mon, 5 Nov 2018 09:34:05 +0100
Message-ID: <20181105083405.zhhnulfsyyvlzusf@flea>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-17-jagan@amarulasolutions.com>
 <20181029093142.hgn4q6o7q32voutf@flea>
 <CAMty3ZBky1kP-1Q+ja2BpcbTxdHgQOFn=T4bcnZwMz6zP+AcOQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qv36qiifiyzutuf"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBG4BQDPQKGQEBSEQUSQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZBky1kP-1Q+ja2BpcbTxdHgQOFn=T4bcnZwMz6zP+AcOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2qv36qiifiyzutuf
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Oct 29, 2018 at 08:18:05PM +0530, Jagan Teki wrote:
> On Mon, Oct 29, 2018 at 3:01 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Fri, Oct 26, 2018 at 08:13:35PM +0530, Jagan Teki wrote:
> > > Some boards have VCC-DSI pin connected to voltage regulator which may
> > > not be turned on by default.
> > >
> > > Add support for such boards by adding voltage regulator handling code to
> > > MIPI DSI driver.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > > Changes for v3:
> > > - new patch
> > > Changes for v2:
> > > - none
> > >
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 14 ++++++++++++++
> > >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  3 +++
> > >  2 files changed, 17 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > index 42bd7506abaf..bc57343592e0 100644
> > > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > @@ -949,6 +949,12 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
> > >
> > >       dsi->drv = drv;
> > >
> > > +     ret = regulator_enable(dsi->regulator);
> > > +     if (ret) {
> > > +             dev_err(dev, "Failed to enable regulator\n");
> > > +             return ret;
> > > +     }
> > > +
> >
> > The regulator should be enabled only when the device is in use.
> 
> True, but there is no device specific quirk needed because who ever
> not needed simply use dummy regulator
> [    0.245821] sun6i-mipi-dsi 1ca0000.dsi: 1ca0000.dsi supply vcc-dsi
> not found, using dummy regulato
> r
> 
> even like HVCC in hdmi driver [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c?id=633ba1e086e1abbeef1ffd899911de8cf3987d9f

That's not my point. You should enable the regulator only when the DSI
bridge is being enabled, not when the driver has probed.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--2qv36qiifiyzutuf--

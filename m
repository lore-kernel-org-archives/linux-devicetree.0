From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 3/6] media: sun6i: Update default
 CSI_SCLK for A64
Date: Wed, 19 Dec 2018 11:07:38 +0100
Message-ID: <20181219100738.iakvqigi7z3k2coa@flea>
References: <20181218113320.4856-1-jagan@amarulasolutions.com>
 <20181218113320.4856-4-jagan@amarulasolutions.com>
 <20181218152318.duynff7f5m2gxtv4@flea>
 <CAMty3ZCS+QT_YqbJueR-qeityaDxNbQ7p_d3D6bNATSJLQpRnQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="msm72pnkaxdbd2lg"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5VQ5DQAKGQEX3IUOWI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZCS+QT_YqbJueR-qeityaDxNbQ7p_d3D6bNATSJLQpRnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--msm72pnkaxdbd2lg
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Dec 18, 2018 at 09:08:17PM +0530, Jagan Teki wrote:
> On Tue, Dec 18, 2018 at 8:53 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Tue, Dec 18, 2018 at 05:03:17PM +0530, Jagan Teki wrote:
> > > Unfortunately A64 CSI cannot work with default CSI_SCLK rate.
> > >
> > > A64 BSP is using 300MHz clock rate as default csi clock,
> > > so sun6i_csi require explicit change to update CSI_SCLK
> > > rate to 300MHZ for A64 SoC's.
> > >
> > > So, set the clk_mod to 300MHz only for A64.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > index 9ff61896e4bb..91470edf7581 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > @@ -822,6 +822,11 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> > >               return PTR_ERR(sdev->clk_mod);
> > >       }
> > >
> > > +     /* A64 require 300MHz mod clock to operate properly */
> > > +     if (of_device_is_compatible(pdev->dev.of_node,
> > > +                                 "allwinner,sun50i-a64-csi"))
> > > +             clk_set_rate_exclusive(sdev->clk_mod, 300000000);
> > > +
> >
> > If you're using clk_set_rate_exclusive, you need to put back the
> > "exclusive" reference once you're not using the clock.
> >
> > Doing it here is not really optimal either, since you'll put a
> > constraint on the system (maintaining that clock at 300MHz), while
> > it's not in use.
> 
> I think we can handle via clk_rate_exclusive_put for those errors
> cases? If I'm not wrong

Yes, but it's not only for the error case, it's also for the inactive
case.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--msm72pnkaxdbd2lg--

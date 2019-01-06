From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v5 2/6] media: sun6i: Add mod_rate quirk
Date: Sun, 6 Jan 2019 22:00:56 +0530
Message-ID: <CAMty3ZBeopJTm7kUzqarSfqYAJup7B5eqVWPg4aRpgFJOWP7XA@mail.gmail.com>
References: <20181220125438.11700-1-jagan@amarulasolutions.com>
 <20181220125438.11700-3-jagan@amarulasolutions.com> <20181221130025.lbvw7yvy74brf3jn@flea>
 <CAMty3ZCG5cF3tP2mid5xyS=yhtxkY+TOcGkwRkv+vrZt1=0iQg@mail.gmail.com>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBBTG2ZDQQKGQEIGMK2AQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZCG5cF3tP2mid5xyS=yhtxkY+TOcGkwRkv+vrZt1=0iQg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 24, 2018 at 8:57 PM Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>
> On Fri, Dec 21, 2018 at 6:30 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Thu, Dec 20, 2018 at 06:24:34PM +0530, Jagan Teki wrote:
> > > Unfortunately default CSI_SCLK rate cannot work properly to
> > > drive the connected sensor interface, particularly on few
> > > Allwinner SoC's like A64.
> > >
> > > So, add mod_rate quirk via driver data so-that the respective
> > > SoC's which require to alter the default mod clock rate can assign
> > > the operating clock rate.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 34 +++++++++++++++----
> > >  1 file changed, 28 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > index ee882b66a5ea..fe002beae09c 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/ioctl.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > > @@ -28,8 +29,13 @@
> > >
> > >  #define MODULE_NAME  "sun6i-csi"
> > >
> > > +struct sun6i_csi_variant {
> > > +     unsigned long                   mod_rate;
> > > +};
> > > +
> > >  struct sun6i_csi_dev {
> > >       struct sun6i_csi                csi;
> > > +     const struct sun6i_csi_variant  *variant;
> > >       struct device                   *dev;
> > >
> > >       struct regmap                   *regmap;
> > > @@ -822,33 +828,43 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> > >               return PTR_ERR(sdev->clk_mod);
> > >       }
> > >
> > > +     if (sdev->variant->mod_rate)
> > > +             clk_set_rate_exclusive(sdev->clk_mod, sdev->variant->mod_rate);
> > > +
> >
> > It still doesn't make any sense to do it in the probe function...
>
> I'm not sure we discussed about the context wrt probe, we discussed
> about exclusive put clock. Since clocks were enabling in set_power and
> clock rate can be set during probe in single time instead of setting
> it in set_power for every power enablement. anything wrong with that.
>
> >
> > We discussed this in the previous iteration already.
> >
> > What we didn't discuss is the variant function that you introduce,
> > while the previous approach was enough.
>
> We discussed about clk_rate_exclusive_put, and that even handle it in
> .remove right? so I have variant to handle it in sun6i_csi_remove.

Any comments?

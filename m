From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v5 2/6] media: sun6i: Add mod_rate quirk
Date: Fri, 11 Jan 2019 11:54:12 +0530
Message-ID: <CAMty3ZAx9MthB0M-eFmsZv9CxF3Z1BkFTU6Hw=ZT5wu6aJwjGQ@mail.gmail.com>
References: <20181220125438.11700-1-jagan@amarulasolutions.com>
 <20181220125438.11700-3-jagan@amarulasolutions.com> <20181221130025.lbvw7yvy74brf3jn@flea>
 <CAMty3ZCG5cF3tP2mid5xyS=yhtxkY+TOcGkwRkv+vrZt1=0iQg@mail.gmail.com> <20190107132929.ksyajmzn2gzr6oep@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107132929.ksyajmzn2gzr6oep@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 7, 2019 at 6:59 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, Dec 24, 2018 at 08:57:48PM +0530, Jagan Teki wrote:
> > On Fri, Dec 21, 2018 at 6:30 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Thu, Dec 20, 2018 at 06:24:34PM +0530, Jagan Teki wrote:
> > > > Unfortunately default CSI_SCLK rate cannot work properly to
> > > > drive the connected sensor interface, particularly on few
> > > > Allwinner SoC's like A64.
> > > >
> > > > So, add mod_rate quirk via driver data so-that the respective
> > > > SoC's which require to alter the default mod clock rate can assign
> > > > the operating clock rate.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > ---
> > > >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 34 +++++++++++++++----
> > > >  1 file changed, 28 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > index ee882b66a5ea..fe002beae09c 100644
> > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > > @@ -15,6 +15,7 @@
> > > >  #include <linux/ioctl.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/of.h>
> > > > +#include <linux/of_device.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > >  #include <linux/regmap.h>
> > > > @@ -28,8 +29,13 @@
> > > >
> > > >  #define MODULE_NAME  "sun6i-csi"
> > > >
> > > > +struct sun6i_csi_variant {
> > > > +     unsigned long                   mod_rate;
> > > > +};
> > > > +
> > > >  struct sun6i_csi_dev {
> > > >       struct sun6i_csi                csi;
> > > > +     const struct sun6i_csi_variant  *variant;
> > > >       struct device                   *dev;
> > > >
> > > >       struct regmap                   *regmap;
> > > > @@ -822,33 +828,43 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> > > >               return PTR_ERR(sdev->clk_mod);
> > > >       }
> > > >
> > > > +     if (sdev->variant->mod_rate)
> > > > +             clk_set_rate_exclusive(sdev->clk_mod, sdev->variant->mod_rate);
> > > > +
> > >
> > > It still doesn't make any sense to do it in the probe function...
> >
> > I'm not sure we discussed about the context wrt probe, we discussed
> > about exclusive put clock.
>
> https://lkml.org/lkml/2018/12/18/584
>
> "Doing it here is not really optimal either, since you'll put a
> constraint on the system (maintaining that clock at 300MHz), while
> it's not in use."

But this constraint is only set, for SoC's who need mod_rate change
not for whole SoCs.

>
> > Since clocks were enabling in set_power and clock rate can be set
> > during probe in single time instead of setting it in set_power for
> > every power enablement. anything wrong with that.
>
> See above.
>
> Plus, a clock running draws power. It doesn't really make sense to
> draw power for something that is unused.

True, but clock is enabled only on sun6i_csi_set_power so setting
clock frequency in probe will draw power?
(sorry same message sent accidentally)

>
> > > We discussed this in the previous iteration already.
> > >
> > > What we didn't discuss is the variant function that you introduce,
> > > while the previous approach was enough.
> >
> > We discussed about clk_rate_exclusive_put, and that even handle it in
> > .remove right? so I have variant to handle it in sun6i_csi_remove.
>
> We indeed discussed the clk_rate_exclusive_put. However, you chose to
> implement it using a variant structure which really isn't needed.

Because clk_rate_exclusive_put will also do it .remove so adding
driver variant with mod_rate can do this job easily. do you have any
suggestion?

From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4 3/6] media: sun6i: Update default CSI_SCLK for A64
Date: Tue, 18 Dec 2018 21:08:17 +0530
Message-ID: <CAMty3ZCS+QT_YqbJueR-qeityaDxNbQ7p_d3D6bNATSJLQpRnQ@mail.gmail.com>
References: <20181218113320.4856-1-jagan@amarulasolutions.com>
 <20181218113320.4856-4-jagan@amarulasolutions.com> <20181218152318.duynff7f5m2gxtv4@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218152318.duynff7f5m2gxtv4@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 18, 2018 at 8:53 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Tue, Dec 18, 2018 at 05:03:17PM +0530, Jagan Teki wrote:
> > Unfortunately A64 CSI cannot work with default CSI_SCLK rate.
> >
> > A64 BSP is using 300MHz clock rate as default csi clock,
> > so sun6i_csi require explicit change to update CSI_SCLK
> > rate to 300MHZ for A64 SoC's.
> >
> > So, set the clk_mod to 300MHz only for A64.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index 9ff61896e4bb..91470edf7581 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -822,6 +822,11 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
> >               return PTR_ERR(sdev->clk_mod);
> >       }
> >
> > +     /* A64 require 300MHz mod clock to operate properly */
> > +     if (of_device_is_compatible(pdev->dev.of_node,
> > +                                 "allwinner,sun50i-a64-csi"))
> > +             clk_set_rate_exclusive(sdev->clk_mod, 300000000);
> > +
>
> If you're using clk_set_rate_exclusive, you need to put back the
> "exclusive" reference once you're not using the clock.
>
> Doing it here is not really optimal either, since you'll put a
> constraint on the system (maintaining that clock at 300MHz), while
> it's not in use.

I think we can handle via clk_rate_exclusive_put for those errors
cases? If I'm not wrong

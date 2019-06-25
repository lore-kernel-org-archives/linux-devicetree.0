From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH v4 08/11] thermal: sun8i: support ahb clocks
Date: Tue, 25 Jun 2019 02:34:16 +0200
Message-ID: <20190625003416.pxve36mrxmotg2bq@core.my.home>
References: <20190623164206.7467-1-tiny.windzz@gmail.com>
 <20190623164206.7467-9-tiny.windzz@gmail.com>
 <20190624182333.di7avywtdvzwukms@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624182333.di7avywtdvzwukms@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, edubezval@gmail.com, wens@csie.org, robh+dt@kernel.org, mchehab+samsung@kernel.org, rui.zhang@intel.com, paulmck@linux.ibm.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 08:23:33PM +0200, Maxime Ripard wrote:
> On Sun, Jun 23, 2019 at 12:42:03PM -0400, Yangtao Li wrote:
> > H3 has extra clock, so introduce something in ths_thermal_chip/ths_device
> > and adds the process of the clock.
> >
> > This is pre-work for supprt it.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/thermal/sun8i_thermal.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> > index ed1c19bb27cf..04f53ffb6a14 100644
> > --- a/drivers/thermal/sun8i_thermal.c
> > +++ b/drivers/thermal/sun8i_thermal.c
> > @@ -54,6 +54,7 @@ struct tsensor {
> >  };
> >
> >  struct ths_thermal_chip {
> > +	bool            has_ahb_clk;
> >  	int		sensor_num;
> >  	int		offset;
> >  	int		scale;
> > @@ -69,6 +70,7 @@ struct ths_device {
> >  	struct regmap				*regmap;
> >  	struct reset_control			*reset;
> >  	struct clk				*bus_clk;
> > +	struct clk                              *ahb_clk;
> 
> Hmm, thinking a bit about this, the name of those two clocks doesn't
> make sense. AHB is the bus being used to access that device, so the
> bus clock is the AHB clock.
> 
> What is that clock being used for?

To control the A/D and sample averaging logic, I suppose. It's controlled by the
THS_CLK_REG (THS Clock Register) in H3 user manual.

bus_clk controls THS_GATING in BUS_CLK_GATING_REG2 (THS module is connected to
APB bus).

I'd call it ths_clk and bus_clk.

regards,
	o.

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

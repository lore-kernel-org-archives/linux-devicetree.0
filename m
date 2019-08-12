From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v5 08/18] thermal: sun8i: support mod clocks
Date: Tue, 13 Aug 2019 07:46:39 +0800
Message-ID: <CAEExFWubLqtPZ=ZKJTCb6x2-PeYebXb3sr-t-XvtrLJTRiUU1A@mail.gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com> <20190810052829.6032-9-tiny.windzz@gmail.com>
 <CA+E=qVfp-rProxOwX__J6jM-pZ9g_SmeuOCOgvC_5DJVQw4OGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVfp-rProxOwX__J6jM-pZ9g_SmeuOCOgvC_5DJVQw4OGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com, Nicolas Ferre <nicolas.ferre@microchip.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

HI Vasily,

On Sat, Aug 10, 2019 at 2:17 PM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Fri, Aug 9, 2019 at 10:31 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
> >
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
> > index b934bc81eba7..6f4294c2aba7 100644
> > --- a/drivers/thermal/sun8i_thermal.c
> > +++ b/drivers/thermal/sun8i_thermal.c
> > @@ -54,6 +54,7 @@ struct tsensor {
> >  };
> >
> >  struct ths_thermal_chip {
> > +       bool            has_mod_clk;
> >         int             sensor_num;
> >         int             offset;
> >         int             scale;
> > @@ -69,6 +70,7 @@ struct ths_device {
> >         struct regmap                           *regmap;
> >         struct reset_control                    *reset;
> >         struct clk                              *bus_clk;
> > +       struct clk                              *mod_clk;
> >         struct tsensor                          sensor[MAX_SENSOR_NUM];
> >  };
> >
> > @@ -274,6 +276,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
> >         if (IS_ERR(tmdev->bus_clk))
> >                 return PTR_ERR(tmdev->bus_clk);
> >
> > +       if (tmdev->chip->has_mod_clk) {
> > +               tmdev->mod_clk = devm_clk_get(&pdev->dev, "mod");
> > +               if (IS_ERR(tmdev->mod_clk))
> > +                       return PTR_ERR(tmdev->mod_clk);
> > +       }
> > +
> >         ret = reset_control_deassert(tmdev->reset);
> >         if (ret)
> >                 return ret;
> > @@ -282,12 +290,18 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
> >         if (ret)
> >                 goto assert_reset;
> >
> > -       ret = sun50i_ths_calibrate(tmdev);
> > +       ret = clk_prepare_enable(tmdev->mod_clk);
>
> You have to set rate of modclk before enabling it since you can't rely
> on whatever bootloader left for you.
>
> Also I found that parameters you're using for PC_TEMP_PERIOD, ACQ0 and
> ACQ1 are too aggressive and may result in high interrupt rate to the
> point when it may stall RCU. I changed driver a bit to use params from
> Philipp Rossak's work (modclk set to 4MHz, PC_TEMP_PERIOD is 7, ACQ0
> is 255, ACQ1 is 63) and it fixed RCU stalls for me, see [1] for
> details.

Why is the RCU stall happening, is it caused by a deadlock?
Can you provide log information and your configuration?
I am a bit curious.

Thx,
Yangtao

>
> [1] https://github.com/anarsoul/linux-2.6/commit/46b8bb0fe2ccd1cd88fa9181a2ecbf79e8d513b2
>
>
> >         if (ret)
> >                 goto bus_disable;
> >
> > +       ret = sun50i_ths_calibrate(tmdev);
> > +       if (ret)
> > +               goto mod_disable;
> > +
> >         return 0;
> >
> > +mod_disable:
> > +       clk_disable_unprepare(tmdev->mod_clk);
> >  bus_disable:
> >         clk_disable_unprepare(tmdev->bus_clk);
> >  assert_reset:
> > @@ -395,6 +409,7 @@ static int sun8i_ths_remove(struct platform_device *pdev)
> >  {
> >         struct ths_device *tmdev = platform_get_drvdata(pdev);
> >
> > +       clk_disable_unprepare(tmdev->mod_clk);
> >         clk_disable_unprepare(tmdev->bus_clk);
> >         reset_control_assert(tmdev->reset);
> >
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

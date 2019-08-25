From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v5 08/18] thermal: sun8i: support mod clocks
Date: Mon, 26 Aug 2019 00:14:04 +0800
Message-ID: <CAEExFWueWPOvXoE+zj67DuKWeamcLgawfOxanfPp6Jyo9Envzg@mail.gmail.com>
References: <20190810052829.6032-1-tiny.windzz@gmail.com> <20190810052829.6032-9-tiny.windzz@gmail.com>
 <CA+E=qVfp-rProxOwX__J6jM-pZ9g_SmeuOCOgvC_5DJVQw4OGw@mail.gmail.com>
 <CAEExFWubLqtPZ=ZKJTCb6x2-PeYebXb3sr-t-XvtrLJTRiUU1A@mail.gmail.com>
 <CA+E=qVf9V9iTvCfXXyjqKeviCJOvYpKUO8qw6cQsKqoaRmdKYQ@mail.gmail.com>
 <20190813200623.2dmxcwibuyolnuhh@core.my.home> <CA+E=qVd-hz68VhL0n+3-HDNua2QsT0dOVY9mRjhb5e5+tBW5Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVd-hz68VhL0n+3-HDNua2QsT0dOVY9mRjhb5e5+tBW5Fg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jonathan.Cameron@huawei.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, rui.zhang@intel.com, "David S. Miller" <davem@davemloft.net>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

HI Vasily,

On Wed, Aug 14, 2019 at 11:01 AM Vasily Khoruzhick <anarsoul@gmail.com> wro=
te:
>
> On Tue, Aug 13, 2019 at 1:06 PM Ond=C5=99ej Jirman <megous@megous.com> wr=
ote:
> >
> > On Mon, Aug 12, 2019 at 04:54:15PM -0700, Vasily Khoruzhick wrote:
> > > On Mon, Aug 12, 2019 at 4:46 PM Frank Lee <tiny.windzz@gmail.com> wro=
te:
> > > >
> > > > HI Vasily,
> > > >
> > > > On Sat, Aug 10, 2019 at 2:17 PM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
> > > > >
> > > > > On Fri, Aug 9, 2019 at 10:31 PM Yangtao Li <tiny.windzz@gmail.com=
> wrote:
> > > > > >
> > > > > > H3 has extra clock, so introduce something in ths_thermal_chip/=
ths_device
> > > > > > and adds the process of the clock.
> > > > > >
> > > > > > This is pre-work for supprt it.
> > > > > >
> > > > > > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > > > > > ---
> > > > > >  drivers/thermal/sun8i_thermal.c | 17 ++++++++++++++++-
> > > > > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/=
sun8i_thermal.c
> > > > > > index b934bc81eba7..6f4294c2aba7 100644
> > > > > > --- a/drivers/thermal/sun8i_thermal.c
> > > > > > +++ b/drivers/thermal/sun8i_thermal.c
> > > > > > @@ -54,6 +54,7 @@ struct tsensor {
> > > > > >  };
> > > > > >
> > > > > >  struct ths_thermal_chip {
> > > > > > +       bool            has_mod_clk;
> > > > > >         int             sensor_num;
> > > > > >         int             offset;
> > > > > >         int             scale;
> > > > > > @@ -69,6 +70,7 @@ struct ths_device {
> > > > > >         struct regmap                           *regmap;
> > > > > >         struct reset_control                    *reset;
> > > > > >         struct clk                              *bus_clk;
> > > > > > +       struct clk                              *mod_clk;
> > > > > >         struct tsensor                          sensor[MAX_SENS=
OR_NUM];
> > > > > >  };
> > > > > >
> > > > > > @@ -274,6 +276,12 @@ static int sun8i_ths_resource_init(struct =
ths_device *tmdev)
> > > > > >         if (IS_ERR(tmdev->bus_clk))
> > > > > >                 return PTR_ERR(tmdev->bus_clk);
> > > > > >
> > > > > > +       if (tmdev->chip->has_mod_clk) {
> > > > > > +               tmdev->mod_clk =3D devm_clk_get(&pdev->dev, "mo=
d");
> > > > > > +               if (IS_ERR(tmdev->mod_clk))
> > > > > > +                       return PTR_ERR(tmdev->mod_clk);
> > > > > > +       }
> > > > > > +
> > > > > >         ret =3D reset_control_deassert(tmdev->reset);
> > > > > >         if (ret)
> > > > > >                 return ret;
> > > > > > @@ -282,12 +290,18 @@ static int sun8i_ths_resource_init(struct=
 ths_device *tmdev)
> > > > > >         if (ret)
> > > > > >                 goto assert_reset;
> > > > > >
> > > > > > -       ret =3D sun50i_ths_calibrate(tmdev);
> > > > > > +       ret =3D clk_prepare_enable(tmdev->mod_clk);
> > > > >
> > > > > You have to set rate of modclk before enabling it since you can't=
 rely
> > > > > on whatever bootloader left for you.
> > > > >
> > > > > Also I found that parameters you're using for PC_TEMP_PERIOD, ACQ=
0 and
> > > > > ACQ1 are too aggressive and may result in high interrupt rate to =
the
> > > > > point when it may stall RCU. I changed driver a bit to use params=
 from
> > > > > Philipp Rossak's work (modclk set to 4MHz, PC_TEMP_PERIOD is 7, A=
CQ0
> > > > > is 255, ACQ1 is 63) and it fixed RCU stalls for me, see [1] for
> > > > > details.
> > > >
> > > > Why is the RCU stall happening, is it caused by a deadlock?
> > > > Can you provide log information and your configuration?
> > > > I am a bit curious.
> > >
> > > It's not deadlock, I believe it just can't handle that many interrupt=
s
> > > when running at lowest CPU frequency. Even with Philipp's settings
> > > there's ~20 interrupts a second from ths. I don't remember how many
> > > interrupts were there with your settings.
> > >
> > > Unfortunately there's nothing interesting in backtraces, I'm using
> > > Pine64-LTS board.
> >
> > Recently there was a similar issue, with buggy CCU driver that caused
> > CIR interrupts being fired constantly, and it also resulted in RCU
> > stalls. Looks like a comon cause of RCU stalls.
> >
> > THS timing settings probably need to be made specific to the SoC, becau=
se
> > I noticed that the same settings lead to wildly different timings on
> > different SoCs.
> >
> > It would be good to measure how often ths interrupt fires with this dri=
ver
> > on various SoCs.
> >
> > 20 times a second and more sounds like overkill. I'd expect a useful
> > range to be at most 5-10 times a second. That should be enough to stop
> > overheating the SoC due to suddenly increased load, even without a
> > heatsink.
>
> Note that A64 has 3 sensors and each sensor has individual interrupt,
> so technically it's 6-7 interrupts per sensor per second

You only need to increase the value of the period to reduce the number
of interrupts.
Can you test the relationship between the period and the number of interrup=
ts
when the mod clock does not change and stays 24M?

Thx.
Yangtao

>
> > regards,
> >         o.
> >
> > > > Thx,
> > > > Yangtao
> > > >
> > > > >
> > > > > [1] https://github.com/anarsoul/linux-2.6/commit/46b8bb0fe2ccd1cd=
88fa9181a2ecbf79e8d513b2
> > > > >
> > > > >
> > > > > >         if (ret)
> > > > > >                 goto bus_disable;
> > > > > >
> > > > > > +       ret =3D sun50i_ths_calibrate(tmdev);
> > > > > > +       if (ret)
> > > > > > +               goto mod_disable;
> > > > > > +
> > > > > >         return 0;
> > > > > >
> > > > > > +mod_disable:
> > > > > > +       clk_disable_unprepare(tmdev->mod_clk);
> > > > > >  bus_disable:
> > > > > >         clk_disable_unprepare(tmdev->bus_clk);
> > > > > >  assert_reset:
> > > > > > @@ -395,6 +409,7 @@ static int sun8i_ths_remove(struct platform=
_device *pdev)
> > > > > >  {
> > > > > >         struct ths_device *tmdev =3D platform_get_drvdata(pdev)=
;
> > > > > >
> > > > > > +       clk_disable_unprepare(tmdev->mod_clk);
> > > > > >         clk_disable_unprepare(tmdev->bus_clk);
> > > > > >         reset_control_assert(tmdev->reset);
> > > > > >
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-arm-kernel mailing list
> > > > > > linux-arm-kernel@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

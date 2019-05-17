From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 2/3] thermal: sun50i: add thermal driver for h6
Date: Sat, 18 May 2019 00:34:57 +0800
Message-ID: <CAEExFWvDO3wJd6wp1hFudf3EGF0NixgKAwAd5-b1=VLF+7-jCw@mail.gmail.com>
References: <20190512082614.9045-1-tiny.windzz@gmail.com> <20190512082614.9045-3-tiny.windzz@gmail.com>
 <20190512221612.ubmknvim4utnqpl4@core.my.home> <CAEExFWv5A5mhpV7afQT=AaYx2ko5QnfbM6HvfuTgT1Na=ssOcw@mail.gmail.com>
 <20190516182936.h6xdzp3gtg4ikave@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516182936.h6xdzp3gtg4ikave@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Lee <tiny.windzz@gmail.com>, rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, catalin.marinas@arm.com, will.deacon@arm.com, David Miller <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan.Cameron@huawei.com, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, Andy Gross <andy.gross@linaro.org>, olof@lixom.net, bjorn.andersson@linaro.org, Jagan Teki <jagan@amarulasolutions.com>, marc.w.gonzalez@free.fr, stefan.wahren@i2se.com, enric.balletbo@collabora.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

HI,

On Fri, May 17, 2019 at 2:29 AM Ond=C5=99ej Jirman <megous@megous.com> wrot=
e:
>
> Hi Yangtao,
>
> thank you for work on this driver.
>
> On Fri, May 17, 2019 at 02:06:53AM +0800, Frank Lee wrote:
> > HI Ond=C5=99ej,
> >
> > On Mon, May 13, 2019 at 6:16 AM Ond=C5=99ej Jirman <megous@megous.com> =
wrote:
> > > > +
> > > > +/* Temp Unit: millidegree Celsius */
> > > > +static int tsens_reg2temp(struct tsens_device *tmdev,
> > > > +                           int reg)
> > >
> > > Please name all functions so that they are more clearly identifiable
> > > in stack traces as belonging to this driver. For example:
> > >
> > >   sun8i_ths_reg2temp
> > >
> > > The same applies for all tsens_* functions below. tsens_* is too
> > > generic.
> >
> > Done but no sun8i_ths_reg2temp.
> >
> > ths_reg2tem() should be a generic func.
> > I think it should be suitable for all platforms=EF=BC=8C so no platform=
 prefix.
>
> You've missed my point. The driver name is sun8i_thermal and if you get
> and oops from the kernel you'll get a stack trace where there are just fu=
nction
> names. If you use too generic function names, it will not be clear which
> driver is oopsing.
>
>   - sun8i_ths_reg2temp will tell you much more clearly where to search th=
an
>   - ths_reg2temp
>
> Of course you can always grep, but most thermal drivers are thermal senso=
r (ths)
> drivers, and if multiple of them used this too-generic naming scheme you'=
d
> have hard time debugging.
>
> Look at other thermal drivers. They usually encode driver name in the fun=
ction
> names to help with identification (even if these are static driver-local
> functions).
>

Can we change to sunxi_ths_ prefix?

> > > > +static int tsens_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct tsens_device *tmdev;
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     int ret;
> > > > +
> > > > +     tmdev =3D devm_kzalloc(dev, sizeof(*tmdev), GFP_KERNEL);
> > > > +     if (!tmdev)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     tmdev->dev =3D dev;
> > > > +     tmdev->chip =3D of_device_get_match_data(&pdev->dev);
> > > > +     if (!tmdev->chip)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ret =3D tsens_init(tmdev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D tsens_register(tmdev);
> > > > +     if (ret)
> > > > +             return ret;
> > >
> > > Why split this out of probe into separate functions?
> > >
> > > > +     ret =3D tmdev->chip->enable(tmdev);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     platform_set_drvdata(pdev, tmdev);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int tsens_remove(struct platform_device *pdev)
> > > > +{
> > > > +     struct tsens_device *tmdev =3D platform_get_drvdata(pdev);
> > > > +
> > > > +     tmdev->chip->disable(tmdev);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int sun50i_thermal_enable(struct tsens_device *tmdev)
> > > > +{
> > > > +     int ret, val;
> > > > +
> > > > +     ret =3D reset_control_deassert(tmdev->reset);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     ret =3D clk_prepare_enable(tmdev->bus_clk);
> > > > +     if (ret)
> > > > +             goto assert_reset;
> > > > +
> > > > +     ret =3D tsens_calibrate(tmdev);
> > > > +     if (ret)
> > > > +             return ret;
> > >
> > > If this fails (it may likely fail with EPROBE_DEFER) you are leaving =
reset
> > > deasserted, and clock enabled.
> > >
> > > Overall, I think, reset/clock management and nvmem reading will be co=
mmon
> > > to all the HW variants, so it doesn't make much sense splitting it ou=
t
> > > of probe into separate functions, and makes it more error prone.
> >
> > Our long-term goal is to support all platforms.
> > Bacicallt there is a differencr between each generation.
> > So I feel it necessary to isolate these differences.
> >
> > Maybe:
> > At some point, we can draw a part of the public part and platform
> > difference into different
> > files. something like qcom thermal driver.
>
> I understand, but I wrote ths drivers for H3/H5/A83T and it so far it loo=
ks like
> all of them would share these 3 calls.
>
> You'll be enabling clock/reset and callibrating everywhere. So putting th=
is to
> per-SoC function seems premature.

In fact, enalbe and disable are the suspend and resume functions.(PM
callback will be added in the future)
When exiting from s2ram, the register will become the initial value.
We need to do all the work, enabling reset/clk ,calibrating and
initializing other reg.

So I think it is no need to put enabling reset/clk and calibrating to
probe func, and I'd like
to keep enable and disable func.

>
> thank you and regards,
>         o.
>
> > Regards,
> > Yangtao

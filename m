From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH v4 00/11] add thermal driver for h6
Date: Sun, 28 Jul 2019 20:11:25 +0800
Message-ID: <CAEExFWsCKWdwciC2x4jNpF4+Gk4ezCS+7RHvk1t3fU_xk90jMQ@mail.gmail.com>
References: <20190623164206.7467-1-tiny.windzz@gmail.com> <CA+E=qVfhDEQER2UTj65hR9erzej9Ey2FrUa9GV=iCFYsWZ2ztw@mail.gmail.com>
 <CA+E=qVdAUFJM27cNL6WRkk5moX=mEk7WUs6UBoX58Y7ove40oQ@mail.gmail.com> <CA+E=qVdw+DG7Bj4xg5-wjatyHMH76q2usanZ7Ty6pGHuaA_=5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+E=qVdw+DG7Bj4xg5-wjatyHMH76q2usanZ7Ty6pGHuaA_=5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, Linux PM <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

HI Vasily,

On Sat, Jul 27, 2019 at 1:46 AM Vasily Khoruzhick <anarsoul@gmail.com> wrot=
e:
>
> Hey Yangtao,
>
> Are you planning to send v5 anytime soon?

Yeah, Thank you for your contribution.

This month is a bit busy, I will probably start the V5 version soon.
The next version will add your A64 support, and possibly H5 support
from icenowy.

Yours=EF=BC=8C
Yangtao

>
> On Sat, Jul 13, 2019 at 11:01 AM Vasily Khoruzhick <anarsoul@gmail.com> w=
rote:
> >
> > On Wed, Jul 10, 2019 at 4:09 PM Vasily Khoruzhick <anarsoul@gmail.com> =
wrote:
> > >
> > > On Sun, Jun 23, 2019 at 9:42 AM Yangtao Li <tiny.windzz@gmail.com> wr=
ote:
> > > >
> > > > This patchset add support for H3 and H6 thermal sensor.
> > > >
> > > > BTY, do a cleanup in thermal makfile.
> > > >
> > > > Yangtao Li (11):
> > > >   thermal: sun8i: add thermal driver for h6
> > > >   dt-bindings: thermal: add binding document for h6 thermal control=
ler
> > > >   thermal: fix indentation in makefile
> > > >   thermal: sun8i: get ths sensor number from device compatible
> > > >   thermal: sun8i: rework for sun8i_ths_get_temp()
> > > >   thermal: sun8i: get ths init func from device compatible
> > > >   thermal: sun8i: rework for ths irq handler func
> > > >   thermal: sun8i: support ahb clocks
> > > >   thermal: sun8i: rework for ths calibrate func
> > > >   dt-bindings: thermal: add binding document for h3 thermal control=
ler
> > > >   thermal: sun8i: add thermal driver for h3
> > >
> > > It would be nice to add dts changes to this series. It's unlikely tha=
t
> > > you'll get any "Tested-by" otherwise.
> >
> > I added A64 support on top of this series, see
> > https://github.com/anarsoul/linux-2.6/tree/v5.2-thermal
> >
> > Branch also contains patches to enable DVFS on A64, feel free to
> > cherry pick only those related to thermal driver if you want to
> > include A64 support into v5 series.
> >
> > >
> > > >  .../bindings/thermal/sun8i-thermal.yaml       |  94 +++
> > > >  MAINTAINERS                                   |   7 +
> > > >  drivers/thermal/Kconfig                       |  14 +
> > > >  drivers/thermal/Makefile                      |   9 +-
> > > >  drivers/thermal/sun8i_thermal.c               | 534 ++++++++++++++=
++++
> > > >  5 files changed, 654 insertions(+), 4 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i=
-thermal.yaml
> > > >  create mode 100644 drivers/thermal/sun8i_thermal.c
> > > >
> > > > ---
> > > > v4:
> > > > -add h3 support
> > > > -fix yaml file
> > > > ---
> > > > 2.17.1
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

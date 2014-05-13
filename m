From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/6] clocksource: Add support for the Mediatek SoCs
Date: Tue, 13 May 2014 12:30:47 +0200
Message-ID: <20140513103047.GB16873@lukather>
References: <1399938570-11356-1-git-send-email-matthias.bgg@gmail.com>
 <1399938570-11356-2-git-send-email-matthias.bgg@gmail.com>
 <20140513055405.GA3348@lukather>
 <CABuKBeKboKT7WdJYGj73uNT-Nc+0UEn5kQE1-9G5uxQJvB+FGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4338083363238880228=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeKboKT7WdJYGj73uNT-Nc+0UEn5kQE1-9G5uxQJvB+FGg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko.stuebner@bq.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@i>
List-Id: devicetree@vger.kernel.org


--===============4338083363238880228==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2014 at 11:10:01AM +0200, Matthias Brugger wrote:
> 2014-05-13 7:54 GMT+02:00 Maxime Ripard <maxime.ripard@free-electrons.com=
>:
> > On Tue, May 13, 2014 at 01:49:25AM +0200, Matthias Brugger wrote:
> >> This patch adds a clock source and clock event for the timer found
> >> on the Mediatek SoCs.
> >>
> >> The Mediatek General Porpose Timer block provides five 32 bit timers a=
nd
> >> one 64 bit timer.
> >>
> >> Two 32 bit timers are used:
> >> TIMER1: clock events supporting periodic and oneshot events
> >> TIMER2: clock source configured as a free running counter
> >>
> >> The General Porpose Timer block can be run with two clocks. A 13 MHz s=
ystem
> >> clock and the RTC clock running at 32 KHz. This implementation uses th=
e system
> >> clock.
> >>
> >> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> ---
> >>  drivers/clocksource/Kconfig     |   4 +
> >>  drivers/clocksource/Makefile    |   1 +
> >>  drivers/clocksource/mtk_timer.c | 263 +++++++++++++++++++++++++++++++=
+++++++++
> >>  3 files changed, 268 insertions(+)
> >>  create mode 100644 drivers/clocksource/mtk_timer.c
> >>
> >> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> >> index 96918e1..1f73740 100644
> >> --- a/drivers/clocksource/Kconfig
> >> +++ b/drivers/clocksource/Kconfig
> >> @@ -144,6 +144,10 @@ config VF_PIT_TIMER
> >>  config SYS_SUPPORTS_SH_CMT
> >>          bool
> >>
> >> +config MTK_TIMER
> >> +     select CLKSRC_MMIO
> >> +     bool
> >> +
> >>  config SYS_SUPPORTS_SH_MTU2
> >>          bool
> >>
> >> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefi=
le
> >> index 98cb6c5..619d302 100644
> >> --- a/drivers/clocksource/Makefile
> >> +++ b/drivers/clocksource/Makefile
> >> @@ -33,6 +33,7 @@ obj-$(CONFIG_CLKSRC_EXYNOS_MCT)     +=3D exynos_mct.o
> >>  obj-$(CONFIG_CLKSRC_SAMSUNG_PWM)     +=3D samsung_pwm_timer.o
> >>  obj-$(CONFIG_VF_PIT_TIMER)   +=3D vf_pit_timer.o
> >>  obj-$(CONFIG_CLKSRC_QCOM)    +=3D qcom-timer.o
> >> +obj-$(CONFIG_MTK_TIMER)              +=3D mtk_timer.o
> >>
> >>  obj-$(CONFIG_ARM_ARCH_TIMER)         +=3D arm_arch_timer.o
> >>  obj-$(CONFIG_ARM_GLOBAL_TIMER)               +=3D arm_global_timer.o
> >> diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk=
_timer.c
> >> new file mode 100644
> >> index 0000000..4b88065
> >> --- /dev/null
> >> +++ b/drivers/clocksource/mtk_timer.c
> >> @@ -0,0 +1,263 @@
> >> +/*
> >> + * Mediatek SoCs General-Purpose Timer handling.
> >> + *
> >> + * Copyright (C) 2014 Matthias Brugger
> >> + *
> >> + * Matthias Brugger <matthias.bgg@gmail.com>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modi=
fy
> >> + * it under the terms of the GNU General Public License as published =
by
> >> + * the Free Software Foundation; either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clockchips.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/irq.h>
> >> +#include <linux/irqreturn.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_address.h>
> >> +#include <linux/of_irq.h>
> >> +#include <linux/slab.h>
> >> +
> >> +#define GPT_IRQ_EN_REG               0x00
> >> +#define GPT_IRQ_ENABLE(val)  BIT(val-1)
> >> +#define GPT_IRQ_ST_REG               0x04
> >> +#define GPT_IRQ_ACK_REG              0x08
> >> +#define GPT_IRQ_ACK(val)     BIT(val-1)
> >> +
> >> +#define TIMER_CTRL_REG(val)  (0x10 * val)
> >> +#define TIMER_CTRL_OP(val)   (((val) & 0x3) << 4)
> >> +#define TIMER_CTRL_OP_ONESHOT        (0)
> >> +#define TIMER_CTRL_OP_REPEAT (1)
> >> +#define TIMER_CTRL_OP_KEEPGO (2)
> >> +#define TIMER_CTRL_OP_FREERUN        (3)
> >> +#define TIMER_CTRL_CLEAR     (2)
> >> +#define TIMER_CTRL_ENABLE    (1)
> >> +#define TIMER_CTRL_DISABLE   (0)
> >> +
> >> +#define TIMER_CLK_REG(val)   (0x04 + (0x10 * val))
> >> +#define TIMER_CLK_SRC(val)   (((val) & 0x1) << 4)
> >> +#define TIMER_CLK_SRC_SYS13M (0)
> >> +#define TIMER_CLK_SRC_RTC32K (1)
> >> +#define TIMER_CLK_DIV1               (0x0)
> >> +#define TIMER_CLK_DIV2               (0x1)
> >> +#define TIMER_CLK_DIV3               (0x2)
> >> +#define TIMER_CLK_DIV4               (0x3)
> >> +#define TIMER_CLK_DIV5               (0x4)
> >> +#define TIMER_CLK_DIV6               (0x5)
> >> +#define TIMER_CLK_DIV7               (0x6)
> >> +#define TIMER_CLK_DIV8               (0x7)
> >> +#define TIMER_CLK_DIV9               (0x8)
> >> +#define TIMER_CLK_DIV10              (0x9)
> >> +#define TIMER_CLK_DIV11              (0xA)
> >> +#define TIMER_CLK_DIV12              (0xB)
> >> +#define TIMER_CLK_DIV13              (0xC)
> >> +#define TIMER_CLK_DIV16              (0xD)
> >> +#define TIMER_CLK_DIV32              (0xE)
> >> +#define TIMER_CLK_DIV64              (0xF)
> >> +
> >> +#define TIMER_CNT_REG(val)   (0x08 + (0x10 * val))
> >> +#define TIMER_CMP_REG(val)   (0x0C + (0x10 * val))
> >> +
> >> +#define GPT_CLK_EVT  1
> >> +#define GPT_CLK_SRC  2
> >> +
> >> +
> >> +
> >> +struct mtk_clock_event_device {
> >> +     void __iomem *gpt_base;
> >> +     u32 ticks_per_jiffy;
> >> +     struct clock_event_device dev;
> >> +};
> >> +
> >> +static inline struct mtk_clock_event_device *to_mtk_clk(
> >> +                             struct clock_event_device *c)
> >> +{
> >> +     return container_of(c, struct mtk_clock_event_device, dev);
> >> +}
> >> +
> >> +static void mtk_clkevt_time_stop(struct mtk_clock_event_device *evt, =
u8 timer)
> >> +{
> >> +     u32 val =3D readl(evt->gpt_base + TIMER_CTRL_REG(timer));
> >> +     writel(val & ~TIMER_CTRL_ENABLE, evt->gpt_base +
> >> +                     TIMER_CTRL_REG(timer));
> >> +}
> >> +
> >> +static void mtk_clkevt_time_setup(struct mtk_clock_event_device *evt,
> >> +                             unsigned long delay, u8 timer)
> >> +{
> >> +     writel(delay, evt->gpt_base + TIMER_CMP_REG(timer));
> >> +}
> >> +
> >> +static void mtk_clkevt_time_start(struct mtk_clock_event_device *evt,
> >> +             bool periodic, u8 timer)
> >> +{
> >> +     u32 val;
> >> +
> >> +     /* Acknowledge interrupt */
> >> +     writel(GPT_IRQ_ACK(timer), evt->gpt_base + GPT_IRQ_ACK_REG);
> >> +
> >> +     val =3D readl(evt->gpt_base + TIMER_CTRL_REG(timer));
> >> +
> >> +     /* Clear 2 bit timer operation mode field */
> >> +     val &=3D ~TIMER_CTRL_OP(0x3);
> >> +
> >> +     if (periodic)
> >> +             val |=3D TIMER_CTRL_OP(TIMER_CTRL_OP_REPEAT);
> >> +     else
> >> +             val |=3D TIMER_CTRL_OP(TIMER_CTRL_OP_ONESHOT);
> >> +
> >> +     writel(val | TIMER_CTRL_ENABLE | TIMER_CTRL_CLEAR,
> >> +            evt->gpt_base + TIMER_CTRL_REG(timer));
> >> +}
> >> +
> >> +static void mtk_clkevt_mode(enum clock_event_mode mode,
> >> +                             struct clock_event_device *clk)
> >> +{
> >> +     struct mtk_clock_event_device *evt =3D to_mtk_clk(clk);
> >> +
> >> +     mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
> >> +
> >> +     switch (mode) {
> >> +     case CLOCK_EVT_MODE_PERIODIC:
> >> +             mtk_clkevt_time_setup(evt, evt->ticks_per_jiffy, GPT_CLK=
_EVT);
> >> +             mtk_clkevt_time_start(evt, true, GPT_CLK_EVT);
> >> +             break;
> >> +     case CLOCK_EVT_MODE_ONESHOT:
> >> +             mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
> >> +             break;
> >> +     case CLOCK_EVT_MODE_UNUSED:
> >> +     case CLOCK_EVT_MODE_SHUTDOWN:
> >> +     default:
> >> +             /* No more interrupts will occur as source is disabled */
> >> +             break;
> >> +     }
> >> +}
> >> +
> >> +static int mtk_clkevt_next_event(unsigned long event,
> >> +                                struct clock_event_device *clk)
> >> +{
> >> +     struct mtk_clock_event_device *evt =3D to_mtk_clk(clk);
> >> +
> >> +     mtk_clkevt_time_stop(evt, GPT_CLK_EVT);
> >> +     mtk_clkevt_time_setup(evt, event, GPT_CLK_EVT);
> >> +     mtk_clkevt_time_start(evt, false, GPT_CLK_EVT);
> >> +
> >> +     return 0;
> >> +}
> >> +
> >> +static irqreturn_t mtk_timer_interrupt(int irq, void *dev_id)
> >> +{
> >> +     struct mtk_clock_event_device *evt =3D dev_id;
> >> +
> >> +     /* Acknowledge timer0 irq */
> >> +     writel(GPT_IRQ_ACK(GPT_CLK_EVT), evt->gpt_base + GPT_IRQ_ACK_REG=
);
> >> +     evt->dev.event_handler(&evt->dev);
> >> +
> >> +     return IRQ_HANDLED;
> >> +}
> >> +
> >> +static void mtk_timer_global_reset(struct mtk_clock_event_device *evt)
> >> +{
> >> +     /* Disable all interrupts */
> >> +     writel(0x0, evt->gpt_base + GPT_IRQ_EN_REG);
> >> +     /* Acknowledge all interrupts */
> >> +     writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
> >> +}
> >> +
> >> +static void mtk_timer_reset(struct mtk_clock_event_device *evt, u8 ti=
mer)
> >> +{
> >> +     writel(TIMER_CTRL_CLEAR | TIMER_CTRL_DISABLE,
> >> +             evt->gpt_base + TIMER_CTRL_REG(timer));
> >> +     writel(0x0, evt->gpt_base + TIMER_CMP_REG(timer));
> >> +}
> >> +
> >> +static void __init mtk_timer_init(struct device_node *node)
> >> +{
> >> +     struct mtk_clock_event_device *evt;
> >> +     struct resource res;
> >> +     unsigned long rate =3D 0;
> >> +     struct clk *clk;
> >> +     int ret;
> >> +     u32 val;
> >> +
> >> +     evt =3D kzalloc(sizeof(*evt), GFP_KERNEL);
> >> +     if (!evt)
> >> +             panic("Can't allocate mtk clock event driver struct");
> >> +
> >> +     evt->dev.name =3D "mtk_tick";
> >> +     evt->dev.rating =3D 300;
> >> +     evt->dev.features =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_O=
NESHOT;
> >> +     evt->dev.set_mode =3D mtk_clkevt_mode;
> >> +     evt->dev.set_next_event =3D mtk_clkevt_next_event;
> >> +     evt->dev.cpumask =3D cpu_all_mask;
> >
> > cpu_possible_mask would probably be a better fit. And you still forgot
> > to set the irq field of this struct.
>=20
> I set the irq field when parsing the irq from the dts. Or do you refer
> to a different field I'm not aware of?

Oh, right... Sorry for the noise then :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTcfRXAAoJEBx+YmzsjxAgWjQQAKLjpr5mhFwb8s6tze6Un+U6
Upg5DQ/j+dKBO3J9GyeEHK++De87T0p4Yte4oAt5rwoAVcX+WlFdRxQCiyQ3ELa0
SssmdDPNVA1R6t7eaqM4OtRCPTSswLVzvGmyrixHX/QH/fAqPbIqx94P2nEYqWoN
ICo43fWD+d4aM5RbONujNwsF9uZRf9JPlbnTnDbsAPzp9rJuXoA4iQElVT8akhC5
9Me15kRYWKuQuzq6sdavm1cjlirCn44gzlljal9eIjpvQJN3vx7Wx4mU9ggemnwQ
fqp4CGyVGUYztstJD9WN1wqsbb/dywBDdYtLQl31ps42YB0Ib6IOm9EoST2qiAVq
s8ESpdiDO/r/Izvsg347HWv9JdmrGnAWH3PWVHEbV1uUqiTxi03uC3zzMpD46bul
89GBmMZYwDV+9dqy7YCmE/HKI5U59Us/dV6vupV7DaidhDR7mSlsS+467sCOJJGs
pdcoSB3cYeOeHHpE6u+kKfMbVDj0JV9ssSNi/C4wuxisPwO3bcgpdeNx9IIFbjF6
B+XhhOWzfcjWcOQWekoB4dkl9MmzerTuIKs9kmnmr8IGI5FGmtXI9c1arFXNbDWx
Sn9ckd4dy+dZr1DRoCXcTu8Dz4GTUiEmPL9KOZI03OjvzAbNZZGLXgzNz+yEaqe3
si0SDOXphA+XQDGKQ5Yw
=bZ/q
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--


--===============4338083363238880228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4338083363238880228==--

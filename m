From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v6 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Wed, 27 Aug 2014 22:12:56 +0200
Message-ID: <1802767.SXJx6BfGCT@diego>
References: <1409062444-12019-1-git-send-email-zyw@rock-chips.com> <3801360.yPqDYLVpxz@diego> <CAD=FV=XasFYbZnFp5edJHsoyr6JRa7Wf0=GJZu3jr1doFULQBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XasFYbZnFp5edJHsoyr6JRa7Wf0=GJZu3jr1doFULQBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, zhangqing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, xxx <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmi
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 27. August 2014, 12:59:35 schrieb Doug Anderson:
> Heiko,
>=20
> On Wed, Aug 27, 2014 at 12:53 PM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> > Hi Chris,
> >=20
> > Am Dienstag, 26. August 2014, 22:14:04 schrieb Chris Zhong:
> >> The RK808 chip is a power management IC for multimedia and handhel=
d
> >> devices. It contains the following components:
> >>=20
> >> - Regulators
> >> - RTC
> >> - Clkout
> >>=20
> >> The RK808 core driver is registered as a platform driver and provi=
des
> >> communication through I2C with the host device for the different
> >> components.
> >>=20
> >> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>=20
> >> ---
> >=20
> > when testing this with Dougs dts integration I got irq errors like =
the
> > following:
> >=20
> > INT_STS_REG1: 0x0
> > INT_STS_MSK_REG1: 0x0
> > INT_STS_REG2: 0x1
> > INT_STS_MSK_REG2: 0x0
> > random: nonblocking pool is initialized
> > irq 192: nobody cared (try booting with the "irqpoll" option)
> > CPU: 0 PID: 40 Comm: irq/192-rk808 Not tainted 3.17.0-rc1+ #1015
> > [<c001461c>] (unwind_backtrace) from [<c0011190>] (show_stack+0x10/=
0x14)
> > [<c0011190>] (show_stack) from [<c03e3e04>] (dump_stack+0x6c/0x84)
> > [<c03e3e04>] (dump_stack) from [<c00508e4>] (__report_bad_irq+0x28/=
0xb8)
> > [<c00508e4>] (__report_bad_irq) from [<c0050de4>]
> > (note_interrupt+0x1e8/0x28c) [<c0050de4>] (note_interrupt) from
> > [<c004ebdc>] (handle_irq_event_percpu+0x104/0x120) [<c004ebdc>]
> > (handle_irq_event_percpu) from [<c004ec3c>] (handle_irq_event+0x44/=
0x64)
> > [<c004ec3c>] (handle_irq_event) from [<c0051910>]
> > (handle_level_irq+0xd4/0x11c) [<c0051910>] (handle_level_irq) from
> > [<c004e5a8>] (generic_handle_irq+0x20/0x30) [<c004e5a8>]
> > (generic_handle_irq) from [<c01ba490>] (rockchip_irq_demux+0x190/0x=
228)
> > [<c01ba490>] (rockchip_irq_demux) from [<c004e5a8>]
> > (generic_handle_irq+0x20/0x30) [<c004e5a8>] (generic_handle_irq) fr=
om
> > [<c000f060>] (handle_IRQ+0x68/0x90) [<c000f060>] (handle_IRQ) from
> > [<c000858c>] (gic_handle_irq+0x3c/0x60) [<c000858c>] (gic_handle_ir=
q)
> > from [<c0011bc0>] (__irq_svc+0x40/0x50) Exception stack(0xee31bed8 =
to
> > 0xee31bf20)
> > bec0:                                                       ee09351=
8
> > f005e000 bee0: 00000010 000093e9 ee1fe880 ee2f98c0 ee1fe880 ee2f98e=
0
> > c004f6f0 00000000 bf00: 00000000 00000000 c03eb6d0 ee31bf20 c00522d=
c
> > c004f628 60000113 ffffffff [<c0011bc0>] (__irq_svc) from [<c004f628=
>]
> > (irq_finalize_oneshot+0xd4/0xf0) [<c004f628>] (irq_finalize_oneshot=
) from
> > [<c004f71c>] (irq_thread_fn+0x2c/0x34) [<c004f71c>] (irq_thread_fn)=
 from
> > [<c004f844>] (irq_thread+0xc4/0x148) [<c004f844>] (irq_thread) from
> > [<c0035524>] (kthread+0xdc/0xf0)
> > [<c0035524>] (kthread) from [<c000e7f8>] (ret_from_fork+0x14/0x3c)
> > handlers:
> > [<c004ec5c>] irq_default_primary_handler threaded [<c021cc7c>]
> > regmap_irq_thread Disabling IRQ #192
> >=20
> >=20
> > As you can see there was already a PLUG_IN_INT pending, which stall=
ed the
> >=20
> > system till the irq got deactivated after 100000 iterations:
> >            CPU0
> >=20
> > [...]
> >=20
> >  92:     600231       GIC  92  ff650000.i2c
> >=20
> > 192:     100001  rockchip_gpio_irq   4  rk808
> >=20
> >=20
> > I fixed it up with the following:
> >=20
> > ------------ 8< ---------------
> > diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> > index f0d6518..1c25be7 100644
> > --- a/drivers/mfd/rk808.c
> > +++ b/drivers/mfd/rk808.c
> > @@ -61,8 +61,14 @@ static const struct rk808_reg_data pre_init_reg[=
] =3D {
> >=20
> >         { RK808_BUCK2_CONFIG_REG, BUCK2_RATE_MASK,  BUCK_ILMIN_200M=
A },
> >         { RK808_VB_MON_REG,       MASK_ALL,         VB_LO_ACT |
> >        =20
> >                                                     VB_LO_SEL_3500M=
V },
> >=20
> > -       { RK808_INT_STS_REG1,     MASK_NONE,        0 },
> > -       { RK808_INT_STS_REG2,     MASK_NONE,        0 },
> > +
> > +       /* ack any pending interrupts */
> > +       { RK808_INT_STS_REG1,     INT_STS_REG1_MASK, INT_STS_REG1_M=
ASK },
> > +       { RK808_INT_STS_REG2,     INT_STS_REG2_MASK, INT_STS_REG2_M=
ASK },
> > +
> > +       /* mask all interrupts */
> > +       { RK808_INT_STS_MSK_REG1, INT_STS_REG1_MASK, INT_STS_REG1_M=
ASK },
> > +       { RK808_INT_STS_MSK_REG2, INT_STS_REG2_MASK, INT_STS_REG2_M=
ASK },
> >=20
> >  };
> > =20
> >  static const struct regmap_irq rk808_irqs[] =3D {
> >=20
> > diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> > index 7af1952..8f8e48c 100644
> > --- a/include/linux/mfd/rk808.h
> > +++ b/include/linux/mfd/rk808.h
> > @@ -156,6 +156,8 @@ enum rk808_reg {
> >=20
> >  #define BUCK2_RATE_MASK                (3 << 3)
> >  #define MASK_ALL       0xff
> >  #define MASK_NONE      0
> >=20
> > +#define INT_STS_REG1_MASK      0x7f
> > +#define INT_STS_REG2_MASK      0x3
> >=20
> >  #define SWITCH2_EN     BIT(6)
> >  #define SWITCH1_EN     BIT(5)
> >=20
> > ------------ 8< ---------------
> >=20
> > On startup I guess all pending irqs should be acked and also masked=
, as we
> > normally don't want to handle interrupts that happened way in the p=
ast
> > and they will get unmasked on their own, when one of them gets requ=
ested
> > by the rtc for example.
> >=20
> >=20
> > Heiko
>=20
> Please see <https://chromium-review.googlesource.com/214241>  I asked
> Chris to squash this into his next revision.

Letting regmap handle this, is of course even better :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

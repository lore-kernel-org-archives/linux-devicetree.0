From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v12 05/13] clk: ingenic: Add driver for the TCU clocks
Date: Fri, 07 Jun 2019 15:50:37 -0700
Message-ID: <20190607225038.02A5D20868@mail.kernel.org>
References: <20190521145141.9813-1-paul@crapouillou.net> <20190521145141.9813-6-paul@crapouillou.net> <20190607212819.A5FAE208C3@mail.kernel.org> <1559944794.11351.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559944794.11351.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, James Hogan <jhogan@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Quoting Paul Cercueil (2019-06-07 14:59:54)
> Hi Stephen, thanks for the review.
> > Quoting Paul Cercueil (2019-05-21 07:51:33)
> >>  diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
> >>  new file mode 100644
> >>  index 000000000000..7249225a6994
> >>  --- /dev/null
> >>  +++ b/drivers/clk/ingenic/tcu.c
> >>  @@ -0,0 +1,458 @@
> >>  +// SPDX-License-Identifier: GPL-2.0
> >>  +/*
> >>  + * JZ47xx SoCs TCU clocks driver
> >>  + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> >>  + */
> >>  +
> >>  +#include <linux/clk.h>
> >>  +#include <linux/clk-provider.h>
> >>  +#include <linux/clkdev.h>
> >>  +#include <linux/clockchips.h>
> >>  +#include <linux/mfd/ingenic-tcu.h>
> >>  +#include <linux/regmap.h>
> >>  +
> >>  +#include <dt-bindings/clock/ingenic,tcu.h>
> >>  +
> >>  +/* 8 channels max + watchdog + OST */
> >>  +#define TCU_CLK_COUNT  10
> >>  +
> >>  +#define TCU_ERR(...) pr_crit("ingenic-tcu-clk: " __VA_ARGS__)
> >=20
> > Why is it pr_crit instead of pr_err()?
>=20
> If the TCU timer clocks are not provided for any reason, the system
> will have no timer, and the kernel will hang very early in the init
> process. That's why I chose pr_crit().

HMm. So maybe it should be TCU_CRIT() then? Or just drop the wrapper
macro and define a pr_fmt for this file that has ingenic-tcu-clk: for
it?

>=20
> Most of the code here works without a struct device, it wouldn't be=20
> easy to
> get it to work with runtime PM.
>=20
> I can enable the "tcu" clock in the probe and just gate/ungate it in the
> suspend/resume callbacks, that would work just fine. We don't need=20
> anything
> fancy here.

OK. That sounds like a better approach to gate and ungate in
suspend/resume.

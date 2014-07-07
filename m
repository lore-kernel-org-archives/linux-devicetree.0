From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 1/2] gpio: Add driver for Zynq GPIO controller
Date: Mon, 7 Jul 2014 10:33:38 -0700
Message-ID: <eded8c93-3961-4153-9c0d-8bb427fd8230@BL2FFO11FD050.protection.gbl>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
 <CACRpkdbc=NDmmjLi_FKvXaQ7H6gY+xHWso=Vi=tgubME4JUfyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbc=NDmmjLi_FKvXaQ7H6gY+xHWso=Vi=tgubME4JUfyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Harini Katakam <harinik@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Harini Katakam <harinikatakamlinux@gmail.com>, Harini Katakam <harini.katakam@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-07-07 at 04:45PM +0200, Linus Walleij wrote:
> On Wed, Jun 18, 2014 at 1:39 PM, Harini Katakam <harinik@xilinx.com> =
wrote:
>=20
> > From: Harini Katakam <harini.katakam@xilinx.com>
> >
> > Add support for GPIO controller used by Xilinx Zynq.
> >
> > Signed-off-by: Harini Katakam <harinik@xilinx.com>
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> >
> > v2 changes:
> >  - convert to pm_runtime_force_(suspend|resume)
> >  - add pm_runtime_set_active in probe()
> >  - also (un)prepare clocks when they are dis-/enabled
> >  - add some missing calls to pm_runtime_get()
> >  - use pm_runtime_put() instead of sync variant
> >  - remove gpio chip in driver remove()
> >  - remove redundant type casts
> >  - directly use IO helpers
> >  - use BIT macro to set/clear bits
> >  - migrate to GPIOLIB_IRQCHIP
>=20
> This is a great improvement! Only small stuff remains.
>=20
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/gpio.h>
>=20
> This should be:
> #include <linux/gpio/driver.h>
>=20
> If that doesn't work ... why?
Works just fine.

>=20
> > +/**
> > + * struct zynq_gpio - gpio device private data structure
> > + * @chip:      instance of the gpio_chip
> > + * @base_addr: base address of the GPIO device
> > + * @irq:       irq associated with the controller
> > + * @clk:       clock resource for this controller
> > + */
> > +struct zynq_gpio {
> > +       struct gpio_chip chip;
> > +       void __iomem *base_addr;
> > +       int irq;
>=20
> Why is irq kept around in this struct? It looks like it could just
> be a local variable in probe()?
You're right.

I think that were both part of the legacy in this driver.

	S=C3=B6ren

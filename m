From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/5] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Fri, 30 Oct 2015 19:06:23 +0000
Message-ID: <20151030190622.GN4058@x1>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
 <1446161922-8755-2-git-send-email-afd@ti.com>
 <20151030171006.GZ4058@x1>
 <5633B078.7080209@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5633B078.7080209@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 30 Oct 2015, Andrew F. Davis wrote:

> On 10/30/2015 12:10 PM, Lee Jones wrote:
> >On Thu, 29 Oct 2015, Andrew F. Davis wrote:
> >
> >>The TPS65912 PMIC contains several regulators and a GPIO controller=
=2E
> >>Add bindings for the TPS65912 PMIC.
> >>
> >>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>---
> >>  .../devicetree/bindings/gpio/gpio-tps65912.txt     | 16 +++++++
> >
> >Why have you dropped Linus' Review-by?
> >
>=20
> Strange, I thought I made a change to this. Well this brings up a que=
stion,
> how much change can we have before we are supposed to drop Reviewed/A=
cked-by?

Common sense call I'm afraid. ;)

[...]

> >>+     the second cell is used to specify flags.
> >>+     See include/dt-bindings/gpio/gpio.h for possible values.
> >
> >This is a Linuxisum and shouldn't really live in here.
> >
> >I think it would be better to document them in ../gpio/gpio.txt and
> >reference that instead.
> >
>=20
> Looks like that is already in ../gpio/gpio.txt:57

There is a mention of GPIO_ACTIVE_HIGH, as it's used in an example.
However GPIO_ACTIVE_LOW is missing.  I think both could do with
documenting properly, then you can refer to them from here.

[...]

> >>+Required properties:
> >>+ - compatible : Should be "ti,tps65912".
> >>+ - reg : Slave address or chip select number (I2C / SPI).
> >>+ - interrupt-parent : The parent interrupt controller.
> >>+ - interrupts : The interrupt line the device is connected to.
> >>+ - interrupt-controller : Marks the device node as an interrupt co=
ntroller.
> >>+ - #interrupt-cells: The number of cells to describe an IRQ, this =
should be 2.
> >>+     The first cell is the IRQ number.
> >>+     The second cell is the flags, encoded as the trigger masks fr=
om
> >>+     ../interrupt-controller/interrupts.txt
> >
> >Nit: We *normally* treat these as bullet-points and not place
> >full-stops on them:
> >
> >$ git grep "compatible" -- Documentation/devicetree/bindings/ | grep=
 -v "\.$" | wc -l
> >5227
> >$ git grep "compatible.*\.$" -- Documentation/devicetree/bindings/ |=
 wc -l
> >486
> >
>=20
> What about for multi-sentence descriptions, we need the middle full-s=
tops, then to not
> have one on the end seems kinda odd looking.

That's the way I usually do it -- doesn't look too bad. ;)

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog

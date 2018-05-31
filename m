From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 2/6] mfd: bd71837: Devicetree bindings for ROHM
 BD71837 PMIC
Date: Thu, 31 May 2018 10:17:17 +0300
Message-ID: <20180531071717.GG13528@localhost.localdomain>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <3b05ca98a671a762013c312f8b70543402ee7556.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <20180531030129.GA16122@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180531030129.GA16122@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thanks for the review!

On Wed, May 30, 2018 at 10:01:29PM -0500, Rob Herring wrote:
> On Wed, May 30, 2018 at 11:42:03AM +0300, Matti Vaittinen wrote:
> > Document devicetree bindings for ROHM BD71837 PMIC MFD.
> > + - interrupts		: The interrupt line the device is connected to.
> > + - interrupt-controller	: Marks the device node as an interrupt controller.
> 
> What sub blocks have interrupts?

The PMIC can generate interrupts from events which cause it to reset.
Eg, irq from watchdog line change, power button pushes, reset request
via register interface etc. I don't know any generic handling for these
interrupts. In "normal" use-case this PMIC is powering the processor
where driver is running and I do not see reasonable handling because
power-reset is going to follow the irq.

This IRQ might be relevant if use for PMIC is such that it is not
powering the processor where the driver is runninng. Then the controlling
processor can get the notification that chips powered by PMIC are
resetting. But handling for this must be use-case specific, right? So in
short - none of the current sub-devices use the IRQs - they are there
for specific use-cases which some boards may implement. Any suggestions
how to document the available interrupts? (power button line, sw reset
etc). My current assumption has been that one who is interested in using
these irqs should really also see the data-sheet for IRQs. But I admit
that documenting available interrupts here would be helpful. I will just
cook up some explanation and send it as a patch if no suggestions on how
to document those.

Patches 3/6 and 6/6 from the series were already applied to Mark's tree.
So how should I send further patches? Should I still send the whole series
(including already applied patches 3/6 and 6/6) or only the ones I change?

> > +Example:
> > +
> > +	pmic: bd71837@4b {
> 
> Node names should be generic ideally. So "pmic@4b"

I'll change that.

> > +		clk: bd71837-32k-out {
> 
> clock-controller {

And I'll change that too.

> 
> > +			compatible = "rohm,bd71837-clk";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32768>;
> 
> Can this be anything else?

Not so that I know. Frequency is fixed. Is there a problem with this?


Br,
	Matti Vaittinen

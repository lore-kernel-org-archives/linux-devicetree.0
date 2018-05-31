From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 2/6] mfd: bd71837: Devicetree bindings for ROHM
 BD71837 PMIC
Date: Thu, 31 May 2018 13:23:15 +0300
Message-ID: <20180531102315.GA5150@localhost.localdomain>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <3b05ca98a671a762013c312f8b70543402ee7556.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <20180531030129.GA16122@rob-hp-laptop>
 <20180531071717.GG13528@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180531071717.GG13528@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2018 at 10:17:17AM +0300, Matti Vaittinen wrote:
> Hello Rob,
> 
> Thanks for the review!
> 
> On Wed, May 30, 2018 at 10:01:29PM -0500, Rob Herring wrote:
> > On Wed, May 30, 2018 at 11:42:03AM +0300, Matti Vaittinen wrote:
> > > Document devicetree bindings for ROHM BD71837 PMIC MFD.
> > > + - interrupts		: The interrupt line the device is connected to.
> > > + - interrupt-controller	: Marks the device node as an interrupt controller.
> > 
> > What sub blocks have interrupts?
> 
> The PMIC can generate interrupts from events which cause it to reset.
> Eg, irq from watchdog line change, power button pushes, reset request
> via register interface etc. I don't know any generic handling for these
> interrupts. In "normal" use-case this PMIC is powering the processor
> where driver is running and I do not see reasonable handling because
> power-reset is going to follow the irq.
> 

Oh, but when reading this I understand that the interrupt-controller
property should at least be optional.

Br,
    Matti Vaittinen

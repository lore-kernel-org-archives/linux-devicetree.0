From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] mfd: bd71837: Devicetree bindings for ROHM BD71837 PMIC
Date: Thu, 31 May 2018 09:07:24 -0500
Message-ID: <CAL_Jsq+33G7zMEDOUXHQijxqqbvqykxZENLe1-52ECkXwo2o4g@mail.gmail.com>
References: <cover.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <3b05ca98a671a762013c312f8b70543402ee7556.1527669443.git.matti.vaittinen@fi.rohmeurope.com>
 <20180531030129.GA16122@rob-hp-laptop> <20180531071717.GG13528@localhost.localdomain>
 <20180531102315.GA5150@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531102315.GA5150@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2018 at 5:23 AM, Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On Thu, May 31, 2018 at 10:17:17AM +0300, Matti Vaittinen wrote:
>> Hello Rob,
>>
>> Thanks for the review!
>>
>> On Wed, May 30, 2018 at 10:01:29PM -0500, Rob Herring wrote:
>> > On Wed, May 30, 2018 at 11:42:03AM +0300, Matti Vaittinen wrote:
>> > > Document devicetree bindings for ROHM BD71837 PMIC MFD.
>> > > + - interrupts            : The interrupt line the device is connected to.
>> > > + - interrupt-controller  : Marks the device node as an interrupt controller.
>> >
>> > What sub blocks have interrupts?
>>
>> The PMIC can generate interrupts from events which cause it to reset.
>> Eg, irq from watchdog line change, power button pushes, reset request
>> via register interface etc. I don't know any generic handling for these
>> interrupts. In "normal" use-case this PMIC is powering the processor
>> where driver is running and I do not see reasonable handling because
>> power-reset is going to follow the irq.
>>
>
> Oh, but when reading this I understand that the interrupt-controller
> property should at least be optional.

I don't think it should. The h/w either has an interrupt controller or
it doesn't. My concern is you added it but nothing uses it which tells
me your binding is incomplete. I'd rather see complete bindings even
if you don't have drivers. For example, as-is, there's not really any
need for the clocks child node. You can just make the parent a clock
provider. But we need a complete picture of the h/w to make that
determination.

Rob

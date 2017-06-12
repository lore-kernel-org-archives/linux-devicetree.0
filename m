From: Rogier Wolff <R.E.Wolff@BitWizard.nl>
Subject: Re: [PATCH v2 3/4] irqchip: Add BCM2835 AUX interrupt controller
Date: Mon, 12 Jun 2017 18:33:37 +0200
Message-ID: <20170612163337.GG18236@BitWizard.nl>
References: <c5ceca4d-81d1-9faf-bc4a-3ea3113abf36@raspberrypi.org>
 <56e314db-49a9-48fa-d7d9-877bd68aadfc@arm.com>
 <fb54ef5b-3bbb-4c39-e993-48bf45982412@raspberrypi.org>
 <9cbf68ce-6041-3e04-8f82-8d948ab4a716@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9cbf68ce-6041-3e04-8f82-8d948ab4a716@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Phil Elwell <phil@raspberrypi.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 05:19:03PM +0100, Marc Zyngier wrote:

> > Does Linux not notice when one calls generic_handle_irq with the number of an
> > interrupt without a handler?
> 
> It is not so much that the interrupt doesn't have a handler, but that
> the device (or one of the devices) is in some sort of interrupt frenzy,
> and the driver is not able to handle this interrupt.
> 
> In such a case, Linux tries to mask this interrupt, which in your case
> does exactly nothing. At this point, the system is dead.

In the old days, you had edge-triggered interrupts. That always led to
race conditions: If you handled the interrupt, the hardware might fire
an interrupt again AFTER you've checked: "nothing more to do?" and
before you have told the hardware "I've seen that interrupt". So then
you end up with hardware thinking the interrupt has been handled while
it has in fact not been handled. You can be very careful in what order
you do things, and get it almost right.... 

So nowadays interrupts are level triggered. That means that a device
that wants attention, but for SOME reason, thinks that it was not
properly handled will keep the interrupt line asserted, and interrupts
will keep firing.

When this happens (it's common when you're writing the device driver,
but it sometimes happens in the field when something unexpected
occurs), an interrupt storm starts. As soon as the generic handler
returns from interrupt, the hardware reenters the interrupt handler.

Without any countermeasures, the system would lock up without much
debugging options. Nowadays (since two decades or so), the Linux
kernel can disable the interrupt, print an error message and try to
continue. It won't work if other important interrupts for the system
were on the same IRQ line, but often enough, you just get a message
that an interrupt was disabled and that one peripheral will stop
working. Good opportunities for debugging the situation.

	Roger. 


-- 
** R.E.Wolff@BitWizard.nl ** http://www.BitWizard.nl/ ** +31-15-2600998 **
**    Delftechpark 26 2628 XH  Delft, The Netherlands. KVK: 27239233    **
*-- BitWizard writes Linux device drivers for any device you may have! --*
The plan was simple, like my brother-in-law Phil. But unlike
Phil, this plan just might work.

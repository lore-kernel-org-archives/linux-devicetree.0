From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mfd: cottula: add cottula board
Date: Sat, 20 Dec 2014 21:11:59 +0100
Message-ID: <1591685.mRlCV6MZRs@wuerfel>
References: <1418598606-21352-1-git-send-email-robert.jarzmik@free.fr> <877fxsapds.fsf@free.fr> <8761d68xm3.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8761d68xm3.fsf@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Saturday 20 December 2014 10:43:48 Robert Jarzmik wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> > Arnd Bergmann <arnd@arndb.de> writes:
> >> This looks a bit ambiguous: You get a GPIO line for the purpose of the
> >> IRQ nesting but don't use the GPIO otherwise, and you pass the device's
> >> own irq domain start as an IORESOURCE_IRQ resource.
> >>
> >> For consistency between DT and ATAGS based uses, and with similar DT
> >> based drivers, I would instead recommend passing the parent irq (from
> >> the GPIO) as an IORESOURCE_IRQ resource instead of a gpio lookup,
> >> and passing the base_irq as platform_data for the ATAGS case.
> 
> Hi Arnd,
> 
> I thought again about the GPIO.
> 
> I put in the "gpiod_get()" call to ensure proper ordering between the gpio
> probing and this driver probing. It ensured that this driver's probe will be
> defered until the gpio driver is probed, which is the main purpose of this
> patch (commit message).
> 
> If I pass an irq from the machine code, I loose this guarantee, don't I ?

Not sure, my guess is that it could still work the same way because
the irq is not registered yet and request_irq or similar will fail.

	Arnd

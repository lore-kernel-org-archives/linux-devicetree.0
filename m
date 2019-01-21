From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: Add Broadcom STB SW_INIT reset controller
 driver
Date: Mon, 21 Jan 2019 17:36:23 +0100
Message-ID: <1548088583.3287.14.camel@pengutronix.de>
References: <20190115184406.3164-1-f.fainelli@gmail.com>
         <20190115184406.3164-3-f.fainelli@gmail.com>
         <7bc8d9ee-5be1-1765-55dd-b7407cff962f@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7bc8d9ee-5be1-1765-55dd-b7407cff962f@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Scott,

On Wed, 2019-01-16 at 10:15 -0800, Scott Branden wrote:
> On 2019-01-15 10:44 a.m., Florian Fainelli wrote:
> > Add support for resetting blocks through the Linux reset controller
> > subsystem when reset lines are provided through a SW_INIT-style reset
> > controller on Broadcom STB SoCs.
> > 
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > ---
> >   drivers/reset/Kconfig         |   7 ++
> >   drivers/reset/Makefile        |   1 +
> >   drivers/reset/reset-brcmstb.c | 130 ++++++++++++++++++++++++++++++++++
> >   3 files changed, 138 insertions(+)
> >   create mode 100644 drivers/reset/reset-brcmstb.c
> > 
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 2e01bd833ffd..1ca03c57e049 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -40,6 +40,13 @@ config RESET_BERLIN
> >   	help
> >   	  This enables the reset controller driver for Marvell Berlin SoCs.
> >   
> > +config RESET_BRCMSTB
> > +	bool "Broadcom STB reset controller" if COMPILE_TEST
> 
> Could this even be:
> 
> depends on ARCH_BRCMSTB || COMPILE_TEST

I don't think this is necessary. Since the symbol is non-interactive if
COMPILE_TEST is disabled, it just vanishes when both are disabled.

> > +	default ARCH_BRCMSTB

And if it is actually needed, it defaults to the correct value.

regards
Philipp

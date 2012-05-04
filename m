From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] MFD: twl6040: Allocate IRQ numbers dynamically
Date: Fri, 04 May 2012 13:37:54 +0300
Message-ID: <4FA3B182.5060001@ti.com>
References: <1336049665-27777-1-git-send-email-peter.ujfalusi@ti.com> <1336049665-27777-3-git-send-email-peter.ujfalusi@ti.com> <20120503132004.GB14296@sirena.org.uk> <4FA2881B.6010902@ti.com> <20120503145248.GJ3955@opensource.wolfsonmicro.com> <4FA2A08C.5000403@ti.com> <20120503152643.GM3955@opensource.wolfsonmicro.com> <4FA3958A.4080206@ti.com> <20120504090856.GA14230@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120504090856.GA14230@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, Misael Lopez Cruz <misael.lopez@ti.com>, Benoit Cousson <b-cousson@ti.com>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>
List-Id: devicetree@vger.kernel.org

On 05/04/2012 12:08 PM, Mark Brown wrote:
> You're not understanding the issue at all - the issue is that if
> some driver outside the twl6040 driver is using an interrupt in that
> range based off the irq_base that they supplied then you'll break the=
m.
> The most common case here is using GPIOs on the device as interrupts.

The OMAP platform related drives has been already converted to use
irq_alloc_descs(-1, 0, nr_irqs, 0); to map their range (including GPIO,
twl6030, etc).
Neither of these are using or have irq_base passed from board files for
some time now. We still have the defines for the legacy define based
mapping of the ranges, but it is no longer in use.
To be fair: in arch/arm/mach-omap2/ there's one driver which has not
been converted. It is the gpmc (Flash).

> If this is safe you should at least be making it clear why...

I'll add short explanation to the commit message.

--=20
P=E9ter

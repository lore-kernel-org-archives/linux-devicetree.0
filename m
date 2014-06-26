From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v3 3/7] irqchip: atmel-aic: add new atmel AIC driver
Date: Thu, 26 Jun 2014 16:30:07 -0400
Message-ID: <20140626203007.GU10202@titan.lakedaemon.net>
References: <1403276487-8792-1-git-send-email-boris.brezillon@free-electrons.com>
 <1403276487-8792-4-git-send-email-boris.brezillon@free-electrons.com>
 <53AC8088.6020905@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <53AC8088.6020905@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 26, 2014 at 10:20:24PM +0200, Boris BREZILLON wrote:
> 
> On 20/06/2014 17:01, Boris BREZILLON wrote:
> > Add new atmel AIC (Advanced Interrupt Controller) driver based on the
> > generic chip infrastructure.
> >
> > This driver is only compatible with dt enabled board and replaces the old
> > implementation found in arch/arm/mach-at91/irq.c.
> >
> > Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/irqchip/Kconfig         |   7 +
> >  drivers/irqchip/Makefile        |   1 +
> >  drivers/irqchip/irq-atmel-aic.c | 700 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 708 insertions(+)
> >  create mode 100644 drivers/irqchip/irq-atmel-aic.c
> >
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index bbb746e..6a7ad81 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -30,6 +30,13 @@ config ARM_VIC_NR
> >  	  The maximum number of VICs available in the system, for
> >  	  power management.
> >  
> > +config ATMEL_AIC_IRQ
> > +	bool
> > +	select GENERIC_IRQ_CHIP
> > +	select IRQ_DOMAIN
> > +	select MULTI_IRQ_HANDLER
> > +	select SPARSE_IRQ
> > +
> 
> I just though a bit about it and it might be better to split AIC and
> AIC5 support in 2 different drivers, because the AIC is only available
> on at91sam9/at91rm9200 SoCs and AIC5 only available on sama5 SoCs, and
> AFAICT there is no combination of both controller in a singler SoC.
> 
> Jason, Thomas, let me know if you think this worth the trouble, and if
> so, should I keep a common implementation (in irq-atmel-aic-common.c/.h)
> for the shared functions/structures.

It sounds sensible, and we have a similar situation brewing with the gic
family.  I'd like to hear from the at91 maintainers, though.

thx,

Jason.

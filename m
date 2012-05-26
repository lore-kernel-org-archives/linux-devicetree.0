From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Fri, 25 May 2012 18:48:05 -0600
Message-ID: <20120526004805.92B373E1E4E@localhost>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
 <1334229858-1665-2-git-send-email-thierry.reding@avionic-design.de>
 <20120511234728.0A4623E0791@localhost>
 <20120521102032.GA27686@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120521102032.GA27686-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 21 May 2012 12:20:32 +0200, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> * Grant Likely wrote:
> > On Thu, 12 Apr 2012 13:24:18 +0200, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > > This commit adds a driver for the Avionic Design N-bit GPIO expander.
> > > The expander provides a variable number of GPIO pins with interrupt
> > > support.
> > 
> > Hi Thierry,  comments below...
> > 
> > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > > index 7875c3f..d86c3b7 100644
> > > --- a/drivers/gpio/Kconfig
> > > +++ b/drivers/gpio/Kconfig
> > > @@ -373,6 +373,25 @@ config GPIO_ADP5588_IRQ
> > >  	  Say yes here to enable the adp5588 to be used as an interrupt
> > >  	  controller. It requires the driver to be built in the kernel.
> > >  
> > > +config GPIO_ADNP
> > > +	tristate "Avionic Design N-bit GPIO expander"
> > > +	depends on I2C
> > > +	help
> > > +	  This option enables support for N GPIOs found on Avionic Design
> > > +	  I2C GPIO expanders. The register space will be extended by powers
> > > +	  of two, so the controller will need to accomodate for that. For
> > > +	  example: if a controller provides 48 pins, 6 registers will be
> > > +	  enough to represent all pins, but the driver will assume a
> > > +	  register layout for 64 pins (8 registers).
> > > +
> > > +config GPIO_ADNP_IRQ
> > > +	bool "Interrupt controller support"
> > > +	depends on GPIO_ADNP
> > > +	help
> > > +	  Say yes here to enable the Avionic Design N-bit GPIO expander to
> > > +	  be used as an interrupt controller. It requires the driver to be
> > > +	  built in the kernel.
> > > +
> > 
> > Why does it require the driver to be built in?
> 
> That's primarily a relic from pre-IRQ domain days when it wasn't possible to
> register interrupt controllers after the boot phase. While this should now no
> longer be a problem, I still haven't been able to find out how to properly
> clean up the IRQ domain when the module is unloaded. I feel that the cleanup
> path should be properly implemented before allowing this to be built as a
> module.
> 
> Can you enlighten me?

That's a bug in irq_domain.  It should be fixed in mainline now.  See
commit 58ee99ada "irqdomain: Support removal of IRQ domains."

> > > +struct adnp_platform_data {
> > > +	unsigned gpio_base;
> > > +	unsigned nr_gpios;
> > > +	int irq_base;
> > > +	const char *const *names;
> > > +};
> > 
> > From the start this is a DT enabled driver.  There should be no reason
> > to also include platform_data support.
> 
> I thought it might be a good idea to support both for now. There have been
> some discussions that the device tree should be just an alternative source
> for platform data, the main argument being that platform data could be used
> to overwrite data provided via DT.

Unless you have an *actual* user of platform_data, don't borrow
trouble by adding it.

> Also I use this driver on some older kernels that can't boot from DT yet, but
> I guess that argument isn't very valid because those kernels don't have IRQ
> domain support either and the driver needs more changes anyway.
> 
> Is the official position to introduce new drivers as DT only?

More like the official position is not not add things that are unused.

g.

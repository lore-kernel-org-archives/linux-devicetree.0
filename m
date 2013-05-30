From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] [PATCH 3/3] IRQ: irq domain: defer of irq ressoure
 resolve at platform_drv_probe
Date: Thu, 30 May 2013 12:36:39 +0200
Message-ID: <20130530103639.GD19834@game.jcrosoft.org>
References: <20130528145219.GA30411@game.jcrosoft.org>
 <1369753729-12997-1-git-send-email-plagnioj@jcrosoft.com>
 <1369753729-12997-3-git-send-email-plagnioj@jcrosoft.com>
 <20130529224814.3F8F53E16F4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130529224814.3F8F53E16F4@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23:48 Wed 29 May     , Grant Likely wrote:
> On Tue, 28 May 2013 17:08:49 +0200, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > Today in the current of implementation we populate all the ressources
> > at of_platform_populate time. But this leed to a chicken-egg dilemat
> > some the irq present in DT are from platform_device too. And you can
> > not resolve them as of_platform_populate. So delay the populate of irq
> > at platform_drv_probe.
> > 
> > And if the irq_domain is not yet present just defer the probe (GPIO as example)
> 
> Hi Jean-Christophe,
> 
> Thanks for looking at this.
> 
> Hmmm, this is an interesting idea. I had been thinking about taping into
> the platform_get_irq() call to lookup irq numbers at probe time, but
> that assumes that all platform drivers use that call (which they clearly
> do not). This approach should work for all drivers as is.

Thanks, I try to do not introduce dt or c work around as done in other
drivers (mmc_spi & co) as I do not want to handle gpio as irq in ANY drivers
and just provide the irq number of the gpio via pdev resource or DT interrupts

while discussing with Arnd on IRC the idea come to do this and that we should
do the same for reset and clock by handling it at probe time
> 
> However care needs to be taken to not waste too much time processing
> irqs every time probe is called. Mapping irqs over and over will get
> expensive, especially with the current code. It would be better to
> rework the mapping function to iterate once over the interrupts property
> and map all the IRQs at once instead of calling of_irq_to_resource()
> over and over again. (I would however accept the argument that this is a
> bug fix and the refactoring should be a separate patch)

I'm very concern too by booting time I'll take a look on those issues

> 
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
> > Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/base/platform.c     |    5 +++++
> >  drivers/of/platform.c       |   29 +++++++++++++++++++++++++++--
> >  include/linux/of_platform.h |    7 +++++++
> >  3 files changed, 39 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 9eda842..c0f7906 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/string.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> >  #include <linux/dma-mapping.h>
> > @@ -484,6 +485,10 @@ static int platform_drv_probe(struct device *_dev)
> >  	struct platform_device *dev = to_platform_device(_dev);
> >  	int ret;
> >  
> > +	ret = of_device_init_irq(dev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	if (ACPI_HANDLE(_dev))
> >  		acpi_dev_pm_attach(_dev, true);
> >  
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 00a0971..c290943 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -131,6 +131,32 @@ void of_device_make_bus_id(struct device *dev)
> >  }
> >  
> >  /**
> > + * of_device_alloc_irq - initialize irq of an platfrom_device
> > + * @dev: plaform_device to work on
> > + */
> > +int of_device_init_irq(struct platform_device *dev)
> > +{
> > +	struct device_node *np = dev->dev.of_node;
> > +	int num_irq;
> > +	int ret;
> > +	struct resource *res = dev->resource;
> > +
> > +	if (!np)
> > +		return 0;
> > +
> > +	num_irq = of_irq_count(np);
> > +	if (!num_irq)
> > +		return 0;
> > +
> > +	res += dev->num_resources - num_irq;
> 
> This is a little fragile. Instead of statically calculating the offset,
> scan the table and make *absolutely* sure that there is a free block of
> irq resources.

yeah was thinking about it too, but did simple for RFC
> 
> Also, if the table has already been populated successfully, then that
> should be checked for. That would prevent the same table from being
> parsed over and over in the case of a device that keeps getting
> deferred.

can I add a new boolean for this in pdev of device_node?
> 
> Finally, if it fails, make sure any entries that have been filled in get
> cleared out again before exiting.
ok

Best Regards,
J.

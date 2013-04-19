From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH] drivers: bus: add ARM CCI support
Date: Fri, 19 Apr 2013 12:21:45 +0100
Message-ID: <20130419112145.GB8719@e102568-lin.cambridge.arm.com>
References: <1365691679-28674-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1365691679-28674-2-git-send-email-lorenzo.pieralisi@arm.com>
 <51702B70.9000908@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51702B70.9000908-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Disposition: inline
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
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for the review Stephen.

On Thu, Apr 18, 2013 at 06:20:48PM +0100, Stephen Boyd wrote:
> On 04/11/13 07:47, Lorenzo Pieralisi wrote:
> > diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> > new file mode 100644
> > index 0000000..81953de
> > --- /dev/null
> > +++ b/drivers/bus/arm-cci.c
> [...]
> > +static void notrace cci_port_control(unsigned int port, bool enable)
> > +{
> > +	void __iomem *base = ports[port].base;
> > +
> > +	if (!base)
> > +		return;
> > +
> > +	writel_relaxed(enable, base + CCI_PORT_CTRL);
> > +	while (readl_relaxed(cci_ctrl_base + CCI_CTRL_STATUS) & 0x1)
> > +			;
> 
> cpu_relax()?

Nico explained the reason why I did not add a cpu_relax() here, actually
having this function in C is already a moot point.

> > +}
> [...]
> > +int notrace __cci_control_port_by_device(struct device_node *np, bool enable)
> > +{
> > +	int port = cci_ace_lite_port(np);
> > +	if (WARN_ONCE(port < 0,
> > +		      "ACE lite port look-up failure, node %p\n", np))
> > +		return -ENODEV;
> > +	cci_port_control(port, enable);
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(__cci_control_port_by_device);
> > +
> > +static const struct of_device_id arm_cci_matches[];
> 
> Why not just put the definition here then?

Bah, absolutely.

> > +
> > +static int __init cci_driver_probe(struct platform_device *pdev)
> 
> You probably want to drop the __init considering device hotplug is not
> optional anymore.

I will rework the driver to make it non-hotpluggable compliant (ie use
platform_driver_probe()) honestly hotplug should be strictly prohibited
for CCI, it is a bus tied to CPU clusters I can hardly see any reason to
allow that.

> > +{
> > +	const struct of_device_id *match;
> > +	struct cci_nb_ports const *cci_config;
> > +	int ret, j, i, nb_ace = 0, nb_ace_lite = 0;
> > +	struct device_node *np, *cp;
> > +	const char *match_str;
> > +
> > +	match = of_match_device(arm_cci_matches, &pdev->dev);
> > +
> > +	if (!match)
> > +		return -ENODEV;
> 
> It would be nice if we could get the data field from the of_device_id
> without doing the search again. Can we update the of_platform code to
> assign some field that you can get from the platform device?

I guess there is a reason why it has not been implemented, I will have
a look to check that though.

> > +
> > +	cci_config = (struct cci_nb_ports const *)match->data;
> > +	nb_cci_ports = cci_config->nb_ace + cci_config->nb_ace_lite;
> > +	ports = kzalloc(sizeof(*ports) * nb_cci_ports, GFP_KERNEL);
> 
> kcalloc()?

Absolutely.

> > +	if (!ports)
> > +		return -ENOMEM;
> > +
> > +	np = pdev->dev.of_node;
> > +	cci_ctrl_base = of_iomap(np, 0);
> 
> This is a platform driver so we should use non-of functions to map,
> platform_get_resource()/ioremap(), etc.

Well, it has a strict dependency on DT though. Point taken anyway, I
will think about this.

> > +}
> > +
> > +static int __exit cci_driver_remove(struct platform_device *pdev)
> > +{
> 
> You probably want to drop the __exit here too.

See above.

> > diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
> > new file mode 100644
> > index 0000000..e9514a2
> > --- /dev/null
> > +++ b/include/linux/arm-cci.h
> > @@ -0,0 +1,44 @@
> > +
> > +#ifndef __LINUX_ARM_CCI_H
> > +#define __LINUX_ARM_CCI_H
> > +
> > +#include <linux/errno.h>
> > +#include <linux/of.h>
> > +#include <linux/types.h>
> 
> You can declare
> 
> struct device_node;
> 
> here to avoid including linux/of.h. Less includes means less circular
> dependencies.

Ok.

Thanks,
Lorenzo

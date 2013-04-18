From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC PATCH] drivers: bus: add ARM CCI support
Date: Thu, 18 Apr 2013 10:20:48 -0700
Message-ID: <51702B70.9000908@codeaurora.org>
References: <1365691679-28674-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1365691679-28674-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365691679-28674-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/11/13 07:47, Lorenzo Pieralisi wrote:
> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
> new file mode 100644
> index 0000000..81953de
> --- /dev/null
> +++ b/drivers/bus/arm-cci.c
[...]
> +static void notrace cci_port_control(unsigned int port, bool enable)
> +{
> +	void __iomem *base = ports[port].base;
> +
> +	if (!base)
> +		return;
> +
> +	writel_relaxed(enable, base + CCI_PORT_CTRL);
> +	while (readl_relaxed(cci_ctrl_base + CCI_CTRL_STATUS) & 0x1)
> +			;

cpu_relax()?

> +}
[...]
> +int notrace __cci_control_port_by_device(struct device_node *np, bool enable)
> +{
> +	int port = cci_ace_lite_port(np);
> +	if (WARN_ONCE(port < 0,
> +		      "ACE lite port look-up failure, node %p\n", np))
> +		return -ENODEV;
> +	cci_port_control(port, enable);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(__cci_control_port_by_device);
> +
> +static const struct of_device_id arm_cci_matches[];

Why not just put the definition here then?

> +
> +static int __init cci_driver_probe(struct platform_device *pdev)

You probably want to drop the __init considering device hotplug is not
optional anymore.

> +{
> +	const struct of_device_id *match;
> +	struct cci_nb_ports const *cci_config;
> +	int ret, j, i, nb_ace = 0, nb_ace_lite = 0;
> +	struct device_node *np, *cp;
> +	const char *match_str;
> +
> +	match = of_match_device(arm_cci_matches, &pdev->dev);
> +
> +	if (!match)
> +		return -ENODEV;

It would be nice if we could get the data field from the of_device_id
without doing the search again. Can we update the of_platform code to
assign some field that you can get from the platform device?

> +
> +	cci_config = (struct cci_nb_ports const *)match->data;
> +	nb_cci_ports = cci_config->nb_ace + cci_config->nb_ace_lite;
> +	ports = kzalloc(sizeof(*ports) * nb_cci_ports, GFP_KERNEL);

kcalloc()?

> +	if (!ports)
> +		return -ENOMEM;
> +
> +	np = pdev->dev.of_node;
> +	cci_ctrl_base = of_iomap(np, 0);

This is a platform driver so we should use non-of functions to map,
platform_get_resource()/ioremap(), etc.

> +}
> +
> +static int __exit cci_driver_remove(struct platform_device *pdev)
> +{

You probably want to drop the __exit here too.


> diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
> new file mode 100644
> index 0000000..e9514a2
> --- /dev/null
> +++ b/include/linux/arm-cci.h
> @@ -0,0 +1,44 @@
> +
> +#ifndef __LINUX_ARM_CCI_H
> +#define __LINUX_ARM_CCI_H
> +
> +#include <linux/errno.h>
> +#include <linux/of.h>
> +#include <linux/types.h>

You can declare

struct device_node;

here to avoid including linux/of.h. Less includes means less circular
dependencies.

> +
> +#ifdef CONFIG_ARM_CCI
> +extern int cci_disable_port_by_cpu(u64 mpidr);
> +extern int __cci_control_port_by_device(struct device_node *np, bool enable);
> +#else
> +static inline int cci_disable_port_by_cpu(u64 mpidr) { return -ENODEV; }
> +static inline int __cci_control_port_by_device(struct device_node *np,
> +						bool enable)
> +{
> +	return -ENODEV;
> +}
>
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

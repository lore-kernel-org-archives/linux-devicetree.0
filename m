From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v12 04/13] mfd: Add Ingenic TCU driver
Date: Thu, 27 Jun 2019 07:58:08 +0100
Message-ID: <20190627065808.GY21119@dell>
References: <20190521145141.9813-1-paul@crapouillou.net>
 <20190521145141.9813-5-paul@crapouillou.net>
 <20190626131850.GW21119@dell>
 <1561557350.1872.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561557350.1872.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

On Wed, 26 Jun 2019, Paul Cercueil wrote:
> Le mer. 26 juin 2019 à 15:18, Lee Jones <lee.jones@linaro.org> a écrit :
> > On Tue, 21 May 2019, Paul Cercueil wrote:
> > 
> > >  This driver will provide a regmap that can be retrieved very early
> > > in
> > >  the boot process through the API function ingenic_tcu_get_regmap().
> > > 
> > >  Additionally, it will call devm_of_platform_populate() so that all
> > > the
> > >  children devices will be probed.
> > > 
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  ---
> > > 
> > >  Notes:
> > >      v12: New patch
> > > 
> > >   drivers/mfd/Kconfig             |   8 +++
> > >   drivers/mfd/Makefile            |   1 +
> > >   drivers/mfd/ingenic-tcu.c       | 113
> > > ++++++++++++++++++++++++++++++++
> > >   include/linux/mfd/ingenic-tcu.h |   8 +++
> > >   4 files changed, 130 insertions(+)
> > >   create mode 100644 drivers/mfd/ingenic-tcu.c

[...]

> > >  +static struct regmap * __init ingenic_tcu_create_regmap(struct
> > > device_node *np)
> > >  +{
> > >  +	struct resource res;
> > >  +	void __iomem *base;
> > >  +	struct regmap *map;
> > >  +
> > >  +	if (!of_match_node(ingenic_tcu_of_match, np))
> > >  +		return ERR_PTR(-EINVAL);

Drop this check.

> > >  +	base = of_io_request_and_map(np, 0, "TCU");
> > >  +	if (IS_ERR(base))
> > >  +		return ERR_PTR(PTR_ERR(base));
> > >  +
> > >  +	map = regmap_init_mmio(NULL, base, &ingenic_tcu_regmap_config);
> > >  +	if (IS_ERR(map))
> > >  +		goto err_iounmap;

Place this inside probe().

> > >  +	return map;
> > >  +
> > >  +err_iounmap:
> > >  +	iounmap(base);
> > >  +	of_address_to_resource(np, 0, &res);
> > >  +	release_mem_region(res.start, resource_size(&res));
> > >  +
> > >  +	return map;
> > >  +}
> > 
> > Why does this need to be set-up earlier than probe()?
> 
> See the explanation below.

I think the answer is, it doesn't.

> > >  +static int __init ingenic_tcu_probe(struct platform_device *pdev)
> > >  +{
> > >  +	struct regmap *map = ingenic_tcu_get_regmap(pdev->dev.of_node);
> > >  +
> > >  +	platform_set_drvdata(pdev, map);
> > >  +
> > >  +	regmap_attach_dev(&pdev->dev, map, &ingenic_tcu_regmap_config);
> > >  +
> > >  +	return devm_of_platform_populate(&pdev->dev);
> > >  +}
> > >  +
> > >  +static struct platform_driver ingenic_tcu_driver = {
> > >  +	.driver = {
> > >  +		.name = "ingenic-tcu",
> > >  +		.of_match_table = ingenic_tcu_of_match,
> > >  +	},
> > >  +};
> > >  +
> > >  +static int __init ingenic_tcu_platform_init(void)
> > >  +{
> > >  +	return platform_driver_probe(&ingenic_tcu_driver,
> > >  +				     ingenic_tcu_probe);
> > 
> > What?  Why?
> 
> The device driver probed here will populate the children devices,
> which will be able to retrieve the pointer to the regmap through
> device_get_regmap(dev->parent).

I've never heard of this call.  Where is it?

> The children devices are normal platform drivers that can be probed
> the normal way. These are the PWM driver, the watchdog driver, and the
> OST (OS Timer) clocksource driver, all part of the same hardware block
> (the Timer/Counter Unit or TCU).

If they are normal devices, then there is no need to roll your own
regmap-getter implementation like this.

> > >  +}
> > >  +subsys_initcall(ingenic_tcu_platform_init);
> > >  +
> > >  +struct regmap * __init ingenic_tcu_get_regmap(struct device_node
> > > *np)
> > >  +{
> > >  +	if (!tcu_regmap)
> > >  +		tcu_regmap = ingenic_tcu_create_regmap(np);
> > >  +
> > >  +	return tcu_regmap;
> > >  +}
> > 
> > This makes me pretty uncomfortable.
> > 
> > What calls it?
> 
> The TCU IRQ driver (patch [06/13]), clocks driver (patch [05/13]), and the
> non-OST clocksource driver (patch [07/13]) all probe very early in the boot
> process, and share the same devicetree node. They call this function to get
> a pointer to the regmap.

Horrible!

Instead, you should send it through platform_set_drvdata() and collect
it in the child drivers with platform_get_drvdata(dev->parent).

> > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int
> > > channel)
> > >  +{
> > >  +	const struct ingenic_soc_info *soc =
> > > device_get_match_data(dev->parent);
> > >  +
> > >  +	/* Enable all TCU channels for PWM use by default except channels
> > > 0/1 */
> > >  +	u32 pwm_channels_mask = GENMASK(soc->num_channels - 1, 2);
> > >  +
> > >  +	device_property_read_u32(dev->parent, "ingenic,pwm-channels-mask",
> > >  +				 &pwm_channels_mask);

Doesn't this call overwrite the previous assignment above?

> > >  +	return !!(pwm_channels_mask & BIT(channel));
> > >  +}
> > >  +EXPORT_SYMBOL_GPL(ingenic_tcu_pwm_can_use_chn);

Where is this called from?

I think this needs a review by the DT guys.

> > >  diff --git a/include/linux/mfd/ingenic-tcu.h
> > > b/include/linux/mfd/ingenic-tcu.h
> > >  index 2083fa20821d..21df23916cd2 100644
> > >  --- a/include/linux/mfd/ingenic-tcu.h
> > >  +++ b/include/linux/mfd/ingenic-tcu.h
> > >  @@ -6,6 +6,11 @@
> > >   #define __LINUX_MFD_INGENIC_TCU_H_
> > > 
> > >   #include <linux/bitops.h>
> > >  +#include <linux/init.h>
> > >  +
> > >  +struct device;
> > >  +struct device_node;
> > >  +struct regmap;
> > > 
> > >   #define TCU_REG_WDT_TDR		0x00
> > >   #define TCU_REG_WDT_TCER	0x04
> > >  @@ -53,4 +58,7 @@
> > >   #define TCU_REG_TCNTc(c)	(TCU_REG_TCNT0 + ((c) *
> > > TCU_CHANNEL_STRIDE))
> > >   #define TCU_REG_TCSRc(c)	(TCU_REG_TCSR0 + ((c) *
> > > TCU_CHANNEL_STRIDE))
> > > 
> > >  +struct regmap * __init ingenic_tcu_get_regmap(struct device_node
> > > *np);
> > >  +bool ingenic_tcu_pwm_can_use_chn(struct device *dev, unsigned int
> > > channel);
> > >  +
> > >   #endif /* __LINUX_MFD_INGENIC_TCU_H_ */
> > 
> 
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

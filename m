From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V4 4/8] phy: st-miphy-40lp: Add skeleton driver
Date: Thu, 6 Feb 2014 11:53:20 +0530
Message-ID: <52F32A58.1000904@ti.com>
References: <cover.1391661589.git.pratyush.anand@st.com> <8596e7596e0dfa9a487c4c2deb325bbdf785e55e.1391661589.git.pratyush.anand@st.com> <52F32549.5010303@ti.com> <20140206061430.GA2394@pratyush-vbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140206061430.GA2394@pratyush-vbox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Cc: "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thursday 06 February 2014 11:44 AM, Pratyush Anand wrote:
> Hi Kishon,
> 
> On Thu, Feb 06, 2014 at 02:01:45PM +0800, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 06 February 2014 10:14 AM, Pratyush Anand wrote:
>>> ST miphy-40lp supports PCIe, SATA and Super Speed USB. This driver adds
>>> skeleton support for the same.
>>>
>>> Currently phy ops are returning -EINVAL. They can be elaborated
>>> depending on the SOC being supported in future.
>>>
>>> Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
>>> Tested-by: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
>>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>>> Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>>  .../devicetree/bindings/phy/st-miphy40lp.txt       |  12 ++
>>>  drivers/phy/Kconfig                                |   6 +
>>>  drivers/phy/Makefile                               |   1 +
>>>  drivers/phy/phy-miphy40lp.c                        | 174 +++++++++++++++++++++
>>>  4 files changed, 193 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/phy/st-miphy40lp.txt
>>>  create mode 100644 drivers/phy/phy-miphy40lp.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/st-miphy40lp.txt b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
>>> new file mode 100644
>>> index 0000000..d0c7096
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/st-miphy40lp.txt
>>> @@ -0,0 +1,12 @@
>>> +Required properties:
>>> +- compatible : should be "st,miphy40lp-phy"
>>> +	Other supported soc specific compatible:
>>> +		"st,spear1310-miphy"
>>> +		"st,spear1340-miphy"
>>> +- reg : offset and length of the PHY register set.
>>> +- misc: phandle for the syscon node to access misc registers
>>> +- phy-id: Instance id of the phy.
>>> +- #phy-cells : from the generic PHY bindings, must be 1.
>>> +	- 1st cell: phandle to the phy node.
>>> +	- 2nd cell: 0 if phy (in 1st cell) is to be used for SATA, 1 for PCIe
>>> +	  and 2 for Super Speed USB.
>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>>> index afa2354..2f58993 100644
>>> --- a/drivers/phy/Kconfig
>>> +++ b/drivers/phy/Kconfig
>>> @@ -64,4 +64,10 @@ config BCM_KONA_USB2_PHY
>>>  	help
>>>  	  Enable this to support the Broadcom Kona USB 2.0 PHY.
>>>  
>>> +config PHY_ST_MIPHY40LP
>>> +	tristate "ST MIPHY 40LP driver"
>>> +	help
>>> +	  Support for ST MIPHY 40LP which can be used for PCIe, SATA and Super Speed USB.
>>> +	select GENERIC_PHY
>>> +
>>>  endmenu
>>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>>> index b57c253..c061091 100644
>>> --- a/drivers/phy/Makefile
>>> +++ b/drivers/phy/Makefile
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_PHY_EXYNOS_MIPI_VIDEO)	+= phy-exynos-mipi-video.o
>>>  obj-$(CONFIG_PHY_MVEBU_SATA)		+= phy-mvebu-sata.o
>>>  obj-$(CONFIG_OMAP_USB2)			+= phy-omap-usb2.o
>>>  obj-$(CONFIG_TWL4030_USB)		+= phy-twl4030-usb.o
>>> +obj-$(CONFIG_PHY_ST_MIPHY40LP)		+= phy-miphy40lp.o
>>> diff --git a/drivers/phy/phy-miphy40lp.c b/drivers/phy/phy-miphy40lp.c
>>> new file mode 100644
>>> index 0000000..d478c14
>>> --- /dev/null
>>> +++ b/drivers/phy/phy-miphy40lp.c
>>> @@ -0,0 +1,174 @@
>>> +/*
>>> + * ST MiPHY-40LP PHY driver
>>> + *
>>> + * Copyright (C) 2014 ST Microelectronics
>>> + * Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + *
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/regmap.h>
>>> +
>>> +enum phy_mode {
>>> +	SATA,
>>> +	PCIE,
>>> +	SS_USB,
>>> +};
>>> +
>>> +struct st_miphy40lp_priv {
>>> +	/* regmap for any soc specific misc registers */
>>> +	struct regmap		*misc;
>>> +	/* phy struct pointer */
>>> +	struct phy		*phy;
>>> +	/* device node pointer */
>>> +	struct device_node	*np;
>>> +	/* phy mode: 0 for SATA 1 for PCIe and 2 for SS-USB */
>>> +	enum phy_mode		mode;
>>> +	/* instance id of this phy */
>>> +	u32			id;
>>> +};
>>> +
>>> +static int miphy40lp_init(struct phy *phy)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int miphy40lp_exit(struct phy *phy)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int miphy40lp_power_off(struct phy *phy)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int miphy40lp_power_on(struct phy *phy)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static const struct of_device_id st_miphy40lp_of_match[] = {
>>> +	{ .compatible = "st,miphy40lp-phy" },
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, st_miphy40lp_of_match);
>>> +
>>> +static struct phy_ops st_miphy40lp_ops = {
>>> +	.init = miphy40lp_init,
>>> +	.exit = miphy40lp_exit,
>>> +	.power_off = miphy40lp_power_off,
>>> +	.power_on = miphy40lp_power_on,
>>> +	.owner		= THIS_MODULE,
>>
>> Would prefer to either align all the fields or align none. Here only owner is
>> aligned.
> 
> ok.
> 
>>> +};
>>> +
>>> +#ifdef CONFIG_PM_SLEEP
>>> +static int miphy40lp_suspend(struct device *dev)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +
>>> +static int miphy40lp_resume(struct device *dev)
>>> +{
>>> +	return -EINVAL;
>>> +}
>>> +#endif
>>> +
>>> +static SIMPLE_DEV_PM_OPS(miphy40lp_pm_ops, miphy40lp_suspend,
>>> +		miphy40lp_resume);
>>> +
>>> +static struct phy *st_miphy40lp_xlate(struct device *dev,
>>> +					struct of_phandle_args *args)
>>> +{
>>> +	struct st_miphy40lp_priv *phypriv = dev_get_drvdata(dev);
>>> +
>>> +	if (args->args_count < 1) {
>>> +		dev_err(dev, "DT did not pass correct no of args\n");
>>> +		return NULL;
>>> +	}
>>> +
>>> +	phypriv->mode = args->args[0];
>>> +
>>> +	return phypriv->phy;
>>> +}
>>> +
>>> +static int __init st_miphy40lp_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct st_miphy40lp_priv *phypriv;
>>> +	struct phy_provider *phy_provider;
>>> +
>>> +	phypriv = devm_kzalloc(dev, sizeof(*phypriv), GFP_KERNEL);
>>> +	if (!phypriv) {
>>> +		dev_err(dev, "can't alloc miphy40lp private date memory\n");
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	phypriv->np = dev->of_node;
>>> +
>>> +	phypriv->misc =
>>> +		syscon_regmap_lookup_by_phandle(dev->of_node, "misc");
>>> +	if (IS_ERR(phypriv->misc)) {
>>> +		dev_err(dev, "failed to find misc regmap\n");
>>> +		return PTR_ERR(phypriv->misc);
>>> +	}
>>> +
>>> +	if (of_property_read_u32(dev->of_node, "phy-id", &phypriv->id)) {
>>> +		dev_err(dev, "failed to find phy id\n");
>>> +		return -EINVAL;
>>> +	}
>> Do we really need this phy id? How is it being used?
> 
> Yes , it is being used by patch 6/8.

Alright.
> 
>>
>>> +
>>> +	phy_provider = devm_of_phy_provider_register(dev, st_miphy40lp_xlate);
>>> +	if (IS_ERR(phy_provider)) {
>>> +		dev_err(dev, "failed to register phy provider\n");
>>> +		return PTR_ERR(phy_provider);
>>> +	}
>>
>> phy_provider_register should be the last step in registering the PHY. Or your
>> PHY call backs can be called before you create the PHY. Btw in your case you
> 
> But every one else like  phy-exynos-mipi-video or phy-omap-usb2 or any
> other did it same way. First phy_provider_register and then
> phy_create.

That's a bug which we figured out very late. Will get it fixed in this -rc cycle.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

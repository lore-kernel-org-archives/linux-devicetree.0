Return-Path: <SRS0=myZp=VB=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH V6 26/27] PCI: tegra: Add support for GPIO based PERST#
References: <20190618180206.4908-1-mmaddireddy@nvidia.com>
 <20190618180206.4908-27-mmaddireddy@nvidia.com>
 <a4ddd0a3-f0b4-23de-fb0e-91a417d20362@nvidia.com>
 <84d26bcc-f5d5-6694-98c9-1363d706d76c@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <2411c2b7-9676-46d6-d4ab-af1ad0b41ce1@nvidia.com>
Date: Thu, 4 Jul 2019 18:23:51 +0100
MIME-Version: 1.0
In-Reply-To: <84d26bcc-f5d5-6694-98c9-1363d706d76c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 04/07/2019 16:29, Manikanta Maddireddy wrote:
> 
> 
> On 04-Jul-19 8:18 PM, Jon Hunter wrote:
>> On 18/06/2019 19:02, Manikanta Maddireddy wrote:
>>> Tegra PCIe has fixed per port SFIO line to signal PERST#, which can be
>>> controlled by AFI port register. However, if a platform routes a different
>>> GPIO to the PCIe slot, then port register cannot control it. Add support
>>> for GPIO based PERST# signal for such platforms. GPIO number comes from per
>>> port PCIe device tree node. PCIe driver probe doesn't fail if per port
>>> "reset-gpios" property is not populated, make sure that DT property is not
>>> missed for such platforms.
>> Really? So how come on Jetson TK1 I see ...
>>
>> [    1.073165] tegra-pcie 1003000.pcie: failed to get reset GPIO: -2
>>
>>
>> [    1.073210] tegra-pcie: probe of 1003000.pcie failed with error -2
>>
>> And now ethernet is broken? Why has this not been tested on all Tegra
>> platforms? There is no reason why code submitted to upstream by us
>> (people at NVIDIA) have not tested this on our internal test farm. This
>> is disappointing.
> 
> I did verified this patch on our internal TK1 test farm. I also tested
> on TX1 and TX2.
> This issue popped up because below fix in gpiolib driver went in
> at the same time.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=025bf37725f1929542361eef2245df30badf242e

Ah! OK now that was unlucky. I guess a bisect would have told me that
but it was clear to see PCI was broken and so quicker to debug this
directly. OK, then sorry for the rant!
 
>>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>> V6: No change
>>>
>>> V5:
>>> * Updated reset gpio toggle logic to reflect active low usage
>>> * Replaced kasprintf() with devm_kasprintf()
>>> * Updated commit message with more information.
>>>
>>> V4: Using devm_gpiod_get_from_of_node() to get reset-gpios
>>>
>>> V3: Using helper function to get reset-gpios
>>>
>>> V2: Using standard "reset-gpio" property
>>>
>>>  drivers/pci/controller/pci-tegra.c | 45 ++++++++++++++++++++++++++----
>>>  1 file changed, 39 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>>> index d2841532ff0e..a819bc087a05 100644
>>> --- a/drivers/pci/controller/pci-tegra.c
>>> +++ b/drivers/pci/controller/pci-tegra.c
>>> @@ -17,6 +17,7 @@
>>>  #include <linux/debugfs.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/export.h>
>>> +#include <linux/gpio.h>
>>>  #include <linux/interrupt.h>
>>>  #include <linux/iopoll.h>
>>>  #include <linux/irq.h>
>>> @@ -399,6 +400,8 @@ struct tegra_pcie_port {
>>>  	unsigned int lanes;
>>>  
>>>  	struct phy **phys;
>>> +
>>> +	struct gpio_desc *reset_gpio;
>>>  };
>>>  
>>>  struct tegra_pcie_bus {
>>> @@ -544,15 +547,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
>>>  	unsigned long value;
>>>  
>>>  	/* pulse reset signal */
>>> -	value = afi_readl(port->pcie, ctrl);
>>> -	value &= ~AFI_PEX_CTRL_RST;
>>> -	afi_writel(port->pcie, value, ctrl);
>>> +	if (port->reset_gpio) {
>>> +		gpiod_set_value(port->reset_gpio, 1);
>>> +	} else {
>>> +		value = afi_readl(port->pcie, ctrl);
>>> +		value &= ~AFI_PEX_CTRL_RST;
>>> +		afi_writel(port->pcie, value, ctrl);
>>> +	}
>>>  
>>>  	usleep_range(1000, 2000);
>>>  
>>> -	value = afi_readl(port->pcie, ctrl);
>>> -	value |= AFI_PEX_CTRL_RST;
>>> -	afi_writel(port->pcie, value, ctrl);
>>> +	if (port->reset_gpio) {
>>> +		gpiod_set_value(port->reset_gpio, 0);
>>> +	} else {
>>> +		value = afi_readl(port->pcie, ctrl);
>>> +		value |= AFI_PEX_CTRL_RST;
>>> +		afi_writel(port->pcie, value, ctrl);
>>> +	}
>>>  }
>>>  
>>>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>>> @@ -2199,6 +2210,7 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>>  		struct tegra_pcie_port *rp;
>>>  		unsigned int index;
>>>  		u32 value;
>>> +		char *label;
>>>  
>>>  		err = of_pci_get_devfn(port);
>>>  		if (err < 0) {
>>> @@ -2257,6 +2269,27 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>>  		if (IS_ERR(rp->base))
>>>  			return PTR_ERR(rp->base);
>>>  
>>> +		label = devm_kasprintf(dev, GFP_KERNEL, "pex-reset-%u", index);
>>> +		if (!label) {
>>> +			dev_err(dev, "failed to create reset GPIO label\n");
>>> +			return -ENOMEM;
>>> +		}
>>> +
>>> +		/*
>>> +		 * Returns null if reset-gpios property is not populated and
>>> +		 * fall back to using AFI per port register to toggle PERST#
>>> +		 * SFIO line.
>>> +		 */
>>> +		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
>>> +							     "reset-gpios", 0,
>>> +							     GPIOD_OUT_LOW,
>>> +							     label);
>>> +		if (IS_ERR(rp->reset_gpio)) {
>>> +			err = PTR_ERR(rp->reset_gpio);
>>> +			dev_err(dev, "failed to get reset GPIO: %d\n", err);
>>> +			return err;
>>> +		}
>>> +
>> So I believe that we can just remove the above. I will give it a test
>> and see.
>>
>> Cheers
>> Jon
>>
> Error check should be modified as follows,
> 
> 	if (PTR_ERR(rp->reset_gpio) == -ENOENT)
> 		rp->reset_gpio = NULL;
> 	else if (IS_ERR(rp->reset_gpio))
>  		return PTR_ERR(rp->reset_gpio);

OK, but I think that this should be ...

+               if (IS_ERR(rp->reset_gpio)) {
+                       if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
+                               rp->reset_gpio = NULL;
+                       } else {
+                               dev_err(dev, "failed to get reset GPIO: %d\n", err);
+                               return PTR_ERR(rp->reset_gpio);
+                       }
+               }
 
Cheers
Jon

-- 
nvpublic

Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 29/30] PCI: tegra: Add support for GPIO based PCIe reset
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-30-mmaddireddy@nvidia.com> <20190415142058.GC29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <e8645ef4-eb84-b692-def7-ecaf0f7df4a2@nvidia.com>
Date: Mon, 15 Apr 2019 23:33:55 +0530
MIME-Version: 1.0
In-Reply-To: <20190415142058.GC29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:50 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:54PM +0530, Manikanta Maddireddy wrote:
>> Add support for GPIO based PERST# instead of SFIO mode controller by AFI.
>> GPIO number comes from per port PCIe device tree node.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 37 +++++++++++++++++++++++++-----
>>  1 file changed, 31 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 4a91c9fb3a9d..75873e6627f9 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/delay.h>
>>  #include <linux/export.h>
>> +#include <linux/gpio.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/irq.h>
>> @@ -26,6 +27,7 @@
>>  #include <linux/module.h>
>>  #include <linux/msi.h>
>>  #include <linux/of_address.h>
>> +#include <linux/of_gpio.h>
>>  #include <linux/of_pci.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/pci.h>
>> @@ -406,6 +408,7 @@ struct tegra_pcie_port {
>>  
>>  	int n_gpios;
>>  	int *gpios;
>> +	int rst_gpio;
> This should be using GPIO descriptor APIs.
>
> Thierry
I will take care of it in V2.

Manikanta
>
>>  };
>>  
>>  struct tegra_pcie_bus {
>> @@ -589,15 +592,23 @@ static void tegra_pcie_port_reset(struct tegra_pcie_port *port)
>>  	unsigned long value;
>>  
>>  	/* pulse reset signal */
>> -	value = afi_readl(port->pcie, ctrl);
>> -	value &= ~AFI_PEX_CTRL_RST;
>> -	afi_writel(port->pcie, value, ctrl);
>> +	if (gpio_is_valid(port->rst_gpio)) {
>> +		gpio_set_value(port->rst_gpio, 0);
>> +	} else {
>> +		value = afi_readl(port->pcie, ctrl);
>> +		value &= ~AFI_PEX_CTRL_RST;
>> +		afi_writel(port->pcie, value, ctrl);
>> +	}
>>  
>>  	usleep_range(1000, 2000);
>>  
>> -	value = afi_readl(port->pcie, ctrl);
>> -	value |= AFI_PEX_CTRL_RST;
>> -	afi_writel(port->pcie, value, ctrl);
>> +	if (gpio_is_valid(port->rst_gpio)) {
>> +		gpio_set_value(port->rst_gpio, 1);
>> +	} else {
>> +		value = afi_readl(port->pcie, ctrl);
>> +		value |= AFI_PEX_CTRL_RST;
>> +		afi_writel(port->pcie, value, ctrl);
>> +	}
>>  }
>>  
>>  static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>> @@ -2241,6 +2252,20 @@ static int tegra_pcie_parse_plat_dt(struct tegra_pcie_port *port,
>>  		}
>>  	}
>>  
>> +	port->rst_gpio = of_get_named_gpio(np, "nvidia,rst-gpio", 0);
>> +	if (gpio_is_valid(port->rst_gpio)) {
>> +		err = devm_gpio_request(dev, port->rst_gpio, "pex_rst_gpio");
>> +		if (err < 0) {
>> +			dev_err(dev, "rst_gpio request failed: %d\n", err);
>> +			return err;
>> +		}
>> +		err = gpio_direction_output(port->rst_gpio, 0);
>> +		if (err < 0) {
>> +			dev_err(dev, "rst_gpio set o/p failed: %d\n", err);
>> +			return err;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.17.1
>>

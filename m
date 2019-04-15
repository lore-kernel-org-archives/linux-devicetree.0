Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 15/30] PCI: tegra: Fix PLLE powerdown issue due to CLKREQ#
 signal
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-16-mmaddireddy@nvidia.com> <20190415131716.GQ29254@ulmo>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <eea30332-9683-9b89-c82d-e5041e36d1f1@nvidia.com>
Date: Mon, 15 Apr 2019 20:44:19 +0530
MIME-Version: 1.0
In-Reply-To: <20190415131716.GQ29254@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 6:47 PM, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:40PM +0530, Manikanta Maddireddy wrote:
>> Disable controllers which failed to link up and configure CLKREQ# signals
>> of these controllers as GPIO. This is required to avoid CLKREQ# signal of
>> inactive controllers interfering with PLLE powerdown sequence.
>>
>> PCIE_CLKREQ_GPIO bits are defined only in Tegra186, however programming
>> these bits in other SoCs doesn't cause any side effects. Program these
>> bits for all Tegra SoCs to avoid conditional check.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 7e24eac12668..8e5fdc8ce3d6 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -160,6 +160,8 @@
>>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_211	(0x1 << 20)
>>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_411	(0x2 << 20)
>>  #define  AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_111	(0x2 << 20)
>> +#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(x)		(1 << ((x) + 29))
>> +#define  AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL		(0x7 << 29)
>>  
>>  #define AFI_FUSE			0x104
>>  #define  AFI_FUSE_PCIE_T0_GEN2_DIS	(1 << 2)
>> @@ -733,6 +735,15 @@ static void tegra_pcie_port_disable(struct tegra_pcie_port *port)
>>  
>>  	value &= ~AFI_PEX_CTRL_REFCLK_EN;
>>  	afi_writel(port->pcie, value, ctrl);
>> +
>> +	/*
>> +	 * disable PCIe device and set CLKREQ# as gpio
> Did you mean to say "PCIe port"? Also, s/gpio/GPIO/, and you can make
> use of 78 characters. With those changes, the above may just fit on one
> line.
>
> Thierry
I will take care of it in V2.

Manikanta
>
>> +	 * to allow PLLE power down
>> +	 */
>> +	value = afi_readl(port->pcie, AFI_PCIE_CONFIG);
>> +	value |= AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
>> +	value |= AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
>> +	afi_writel(port->pcie, value, AFI_PCIE_CONFIG);
>>  }
>>  
>>  static void tegra_pcie_port_free(struct tegra_pcie_port *port)
>> @@ -1147,9 +1158,12 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>>  	value = afi_readl(pcie, AFI_PCIE_CONFIG);
>>  	value &= ~AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_MASK;
>>  	value |= AFI_PCIE_CONFIG_PCIE_DISABLE_ALL | pcie->xbar_config;
>> +	value |= AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO_ALL;
>>  
>> -	list_for_each_entry(port, &pcie->ports, list)
>> +	list_for_each_entry(port, &pcie->ports, list) {
>>  		value &= ~AFI_PCIE_CONFIG_PCIE_DISABLE(port->index);
>> +		value &= ~AFI_PCIE_CONFIG_PCIE_CLKREQ_GPIO(port->index);
>> +	}
>>  
>>  	afi_writel(pcie, value, AFI_PCIE_CONFIG);
>>  
>> -- 
>> 2.17.1
>>

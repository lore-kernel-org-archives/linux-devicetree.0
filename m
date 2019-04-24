Return-Path: <SRS0=n3dh=S2=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V2 22/28] PCI: tegra: Access endpoint config only if PCIe
 link is up
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-23-mmaddireddy@nvidia.com>
 <20190423202430.GC14616@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <5043c67a-1d21-efcd-63ca-7feb270f9fb0@nvidia.com>
Date: Wed, 24 Apr 2019 09:21:07 +0530
MIME-Version: 1.0
In-Reply-To: <20190423202430.GC14616@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 24-Apr-19 1:54 AM, Bjorn Helgaas wrote:
> On Tue, Apr 23, 2019 at 02:58:19PM +0530, Manikanta Maddireddy wrote:
>> Add PCIe link up check in config read and write callback functions
>> before accessing endpoint config registers.
> I mentioned before:
>
>   We need to either eradicate this pattern of checking for link up, or
>   include a comment about why it is absolutely necessary.
>
> I still think this check should be unnecessary, but if you really
> think you need it, at least add the comment.
Sorry, I missed to add comment in V2. I will take care of it in V3.


Manikanta

>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>> V2: Change tegra_pcie_link_status() to tegra_pcie_link_up()
>>
>>  drivers/pci/controller/pci-tegra.c | 38 ++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 8ba71e314b1b..05586672a221 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -428,6 +428,14 @@ static inline u32 pads_readl(struct tegra_pcie *pcie, unsigned long offset)
>>  	return readl(pcie->pads + offset);
>>  }
>>  
>> +static bool tegra_pcie_link_up(struct tegra_pcie_port *port)
>> +{
>> +	u32 value;
>> +
>> +	value = readl(port->base + RP_LINK_CONTROL_STATUS);
>> +	return !!(value & RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE);
>> +}
>> +
>>  /*
>>   * The configuration space mapping on Tegra is somewhat similar to the ECAM
>>   * defined by PCIe. However it deviates a bit in how the 4 bits for extended
>> @@ -493,20 +501,50 @@ static void __iomem *tegra_pcie_map_bus(struct pci_bus *bus,
>>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
>>  				  int where, int size, u32 *value)
>>  {
>> +	struct tegra_pcie *pcie = bus->sysdata;
>> +	struct pci_dev *bridge;
>> +	struct tegra_pcie_port *port;
>> +
>>  	if (bus->number == 0)
>>  		return pci_generic_config_read32(bus, devfn, where, size,
>>  						 value);
>>  
>> +	bridge = pcie_find_root_port(bus->self);
>> +
>> +	list_for_each_entry(port, &pcie->ports, list)
>> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
>> +			break;
>> +
>> +	/* If there is no link, then there is no device */
>> +	if (!tegra_pcie_link_up(port)) {
>> +		*value = 0xffffffff;
>> +		return PCIBIOS_DEVICE_NOT_FOUND;
>> +	}
>> +
>>  	return pci_generic_config_read(bus, devfn, where, size, value);
>>  }
>>  
>>  static int tegra_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
>>  				   int where, int size, u32 value)
>>  {
>> +	struct tegra_pcie *pcie = bus->sysdata;
>> +	struct tegra_pcie_port *port;
>> +	struct pci_dev *bridge;
>> +
>>  	if (bus->number == 0)
>>  		return pci_generic_config_write32(bus, devfn, where, size,
>>  						  value);
>>  
>> +	bridge = pcie_find_root_port(bus->self);
>> +
>> +	list_for_each_entry(port, &pcie->ports, list)
>> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
>> +			break;
>> +
>> +	/* If there is no link, then there is no device */
>> +	if (!tegra_pcie_link_up(port))
>> +		return PCIBIOS_DEVICE_NOT_FOUND;
>> +
>>  	return pci_generic_config_write(bus, devfn, where, size, value);
>>  }
>>  
>> -- 
>> 2.17.1
>>

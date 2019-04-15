Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 22/30] PCI: tegra: Access endpoint config only if PCIe
 link is up
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-23-mmaddireddy@nvidia.com>
 <20190411201535.GS256045@google.com>
 <e721e7f4-85c9-bee1-7131-12e0b7dfc0d1@nvidia.com>
 <20190412145003.GE141472@google.com>
 <1039fbf2-24ad-c31c-93d9-663aab74a26a@nvidia.com>
 <20190415140430.GK126710@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <ecbf2331-fdb5-fe6c-f1de-6da0d7f88afb@nvidia.com>
Date: Mon, 15 Apr 2019 21:13:29 +0530
MIME-Version: 1.0
In-Reply-To: <20190415140430.GK126710@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Ley Foon Tan <lftan@altera.com>, Michal Simek <michal.simek@xilinx.com>
List-ID: <devicetree@vger.kernel.org>



On 15-Apr-19 7:34 PM, Bjorn Helgaas wrote:
> On Mon, Apr 15, 2019 at 05:06:10PM +0530, Manikanta Maddireddy wrote:
>> On 12-Apr-19 8:20 PM, Bjorn Helgaas wrote:
>>> On Fri, Apr 12, 2019 at 12:30:22PM +0530, Manikanta Maddireddy wrote:
>>>> On 12-Apr-19 1:45 AM, Bjorn Helgaas wrote:
>>>>> On Thu, Apr 11, 2019 at 10:33:47PM +0530, Manikanta Maddireddy wrote:
>>>>>> Add PCIe link up check in config read and write callback functions
>>>>>> before accessing endpoint config registers.
>>>>>>  static int tegra_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
>>>>>>  				  int where, int size, u32 *value)
>>>>>>  {
>>>>>> +	struct tegra_pcie *pcie = bus->sysdata;
>>>>>> +	struct pci_dev *bridge;
>>>>>> +	struct tegra_pcie_port *port;
>>>>>> +
>>>>>>  	if (bus->number == 0)
>>>>>>  		return pci_generic_config_read32(bus, devfn, where, size,
>>>>>>  						 value);
>>>>>>  
>>>>>> +	bridge = pcie_find_root_port(bus->self);
>>>>>> +
>>>>>> +	list_for_each_entry(port, &pcie->ports, list)
>>>>>> +		if (port->index + 1 == PCI_SLOT(bridge->devfn))
>>>>>> +			break;
>>>>>> +
>>>>>> +	/* If there is no link, then there is no device */
>>>>>> +	if (!tegra_pcie_link_status(port)) {
>>>>> This is racy and you should avoid it if possible.  The link could go down
>>>>> between calling tegra_pcie_link_status() and issuing the config read/write.
>>>>>
>>>>> If your driver is to be reliable, it must be able to handle any bad
>>>>> consequence of issuing that config read/write anyway, so I think it's
>>>>> better if it doesn't even bother checking whether the link is up.
>>>> This change is made based on similar check present in dwc driver
>>>> dw_pcie_valid_device(), reasons for making this change in Tegra might
>>>> differ dwc.
>>> Yes, you won't be surprised to learn that I don't like the similar
>>> checks in dwc, altera, xilinx, and xilinx-nwl either :)  I raise this
>>> issue every time I see it, but I can't remember if I've mentioned dwc
>>> specifically.
>>>
>>> We need to either eradicate this pattern of checking for link up, or
>>> include a comment about why it is absolutely necessary.
>> This patch is created to address below scenario in our downstream kernel,
>> 1) Our platform has WiFi on one slot and GPU in another.
>> 2) During WiFi OFF, link is put in L2 and it goes through hot reset
>> when turning ON WiFi (since Tegra doesn't support hot-plug).
>> 3) Whenever x11 server is started it scans the PCIe bus for video devices.
>> Here PCIe configuration registers of all devices are read to find out
>> all available video devices.
>> 4) If "x11 server" started with WiFi OFF, then we are seeing "response
>> decoding error"(Tegra AFI module specific error).
> Probably happens with lspci too.  I guess this is when you try to read
> the WiFi device config space?
Yes, happens with lspci when trying to read WiFi device config space.
>> Best solution we came up with is to have link up check in config access
>> callback functions.
> Can you check for "response decoding error" in the config accessor and
> return 0xffffffff if you see it?
"Response decoding error" is informed by an interrupt(tegra_pcie_isr()), we have
to add polling logic in config accessor to check if config access caused "response
decoding error" or not. This will increase config access time.
Also sometimes BAR access can also cause "Response decoding error", so
matching "Response decoding error" to a particular config access is
going to be difficult.

Manikanta
>
>>>> Intention here is to reduce the number of AER errors when device is
>>>> falling off the bus or going through hot reset. So racy condition here is
>>>> OK
>>> I'm not convinced about this.  The issues you mention need to be
>>> solved in a generic way, not a tegra-specific way.
>>>
>>> We don't want to end up with code that silently avoids the config
>>> access 99.99% of the time, but once in a blue moon, we lose the race
>>> (the device stops responding after we've determined the link is up)
>>> and the access causes a mysterious AER error that we have no way to
>>> debug.
>>>
>>>>>> +		*value = 0xffffffff;
>>>>>> +		return PCIBIOS_DEVICE_NOT_FOUND;
>>>>>> +	}
>>>>>> +
>>>>>>  	return pci_generic_config_read(bus, devfn, where, size, value);
>>>>>>  }

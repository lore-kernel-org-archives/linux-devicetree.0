From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v7 02/50] powerpc/pci: Override pcibios_setup_bridge()
Date: Fri, 6 Nov 2015 10:44:14 +1100
Message-ID: <20151105234414.GA30465@gwshan>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1446642770-4681-3-git-send-email-gwshan@linux.vnet.ibm.com>
 <87wptwhyjl.fsf@gamma.ozlabs.ibm.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87wptwhyjl.fsf@gamma.ozlabs.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Daniel Axtens <dja@axtens.net>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 06, 2015 at 09:27:42AM +1100, Daniel Axtens wrote:
>Gavin Shan <gwshan@linux.vnet.ibm.com> writes:
>
>>  
>> +void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
>> +{
>> +	struct pci_controller *hose = pci_bus_to_host(bus);
>Very much a nit-pick, but I thought we were trying to move towards using
>phb instead of hose in new code?
>

Take PowerNV platform as an example, "hose" means "struct pci_controller",
but "phb" means "struct pnv_phb". We don't have the movement to use "phb"
to represent "struct pci_controller".

>Apart from that this looks good. I would probably have merged it with
>the previous patch, but I know Alexey has been suggesting a lot of
>splitting and merging previously, so whatever he prefers here is OK.
>

I'd like to keep them separate as they're for different subsystem:
PCI generic subsystem and PowerPC subsystem. Separate maintainers
for them can pick them as they will.

>> +
>> +	if (hose->controller_ops.setup_bridge)
>> +		hose->controller_ops.setup_bridge(bus, type);
>> +}
>> +
>>  void pcibios_reset_secondary_bus(struct pci_dev *dev)
>>  {
>>  	struct pci_controller *phb = pci_bus_to_host(dev->bus);
>> -- 
>> 2.1.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

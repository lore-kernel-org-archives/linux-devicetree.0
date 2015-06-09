From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 42/42] pci/hotplug: PowerPC PowerNV PCI hotplug driver
Date: Tue, 9 Jun 2015 16:10:30 +1000
Message-ID: <20150609061030.GB30787@gwshan>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1433400131-18429-43-git-send-email-gwshan@linux.vnet.ibm.com>
 <20150605201110.GP3631@google.com>
 <1433535495.4526.107.camel@kernel.crashing.org>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433535495.4526.107.camel@kernel.crashing.org>
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, aik@ozlabs.ru, panto@antoniou-consulting.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 06, 2015 at 06:18:15AM +1000, Benjamin Herrenschmidt wrote:
>On Fri, 2015-06-05 at 15:11 -0500, Bjorn Helgaas wrote:
>
>> You didn't add this, but "pcibios_add_pci_devices" doesn't seem like the
>> right name.  "pcibios" generally refers to an arch-specific hook that's
>> called by the generic PCI core.  In this case, pcibios_add_pci_devices()
>> contains powerpc-specific code, and it's only called from powerpc code, so
>> I think using "pcibios_" in the name is a bit misleading.
>
>Maybe but just calling it pci_add_* makes it easy to confuse with a core
>function and ppc_add_* is gross :-)
>
>> > +	/* Remove all devices behind the slot */
>> > +	pci_lock_rescan_remove();
>> > +	pcibios_remove_pci_devices(slot->bus);
>> 
>> Same comment for pcibios_remove_pci_devices().  It would be better if the
>> name didn't suggest that this was part of the pcibios_ interface between
>> the PCI core and the arch code, because it's not.
>> 
>> > +	/* Slot indentifier */
>> 
>> s/indentifier/identifier/
>> 
>> > +	if (!php_slot_get_id(dn, &id))
>> > +		return NULL;
>> > +
>> 
>> > +	/* PCI bus */
>> > +	bus = pcibios_find_pci_bus(dn);
>> 
>> And pcibios_find_pci_bus() (it's also powerpc-specific).
>
>This one could actually move to of_pci.c and be generic, something like
>of_pci_node_to_bus()
>

Thanks, Ben. I'll rename those functions as below if Bjorn won't object:

pcibios_add_pci_devices()           pci_add_pci_devices()
pcibios_remove_pci_devices()        pci_remove_pci_devices()
pcibios_find_pci_bus()              of_node_to_pci_bus()

Thanks,
Gavin

>Ben.
>
>

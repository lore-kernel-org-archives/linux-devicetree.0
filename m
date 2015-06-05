From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v5 42/42] pci/hotplug: PowerPC PowerNV PCI hotplug driver
Date: Sat, 06 Jun 2015 06:18:15 +1000
Message-ID: <1433535495.4526.107.camel@kernel.crashing.org>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
	 <1433400131-18429-43-git-send-email-gwshan@linux.vnet.ibm.com>
	 <20150605201110.GP3631@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150605201110.GP3631-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-06-05 at 15:11 -0500, Bjorn Helgaas wrote:

> You didn't add this, but "pcibios_add_pci_devices" doesn't seem like the
> right name.  "pcibios" generally refers to an arch-specific hook that's
> called by the generic PCI core.  In this case, pcibios_add_pci_devices()
> contains powerpc-specific code, and it's only called from powerpc code, so
> I think using "pcibios_" in the name is a bit misleading.

Maybe but just calling it pci_add_* makes it easy to confuse with a core
function and ppc_add_* is gross :-)

> > +	/* Remove all devices behind the slot */
> > +	pci_lock_rescan_remove();
> > +	pcibios_remove_pci_devices(slot->bus);
> 
> Same comment for pcibios_remove_pci_devices().  It would be better if the
> name didn't suggest that this was part of the pcibios_ interface between
> the PCI core and the arch code, because it's not.
> 
> > +	/* Slot indentifier */
> 
> s/indentifier/identifier/
> 
> > +	if (!php_slot_get_id(dn, &id))
> > +		return NULL;
> > +
> 
> > +	/* PCI bus */
> > +	bus = pcibios_find_pci_bus(dn);
> 
> And pcibios_find_pci_bus() (it's also powerpc-specific).

This one could actually move to of_pci.c and be generic, something like
of_pci_node_to_bus()

Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

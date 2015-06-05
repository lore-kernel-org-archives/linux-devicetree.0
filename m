From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 42/42] pci/hotplug: PowerPC PowerNV PCI hotplug driver
Date: Fri, 5 Jun 2015 15:11:10 -0500
Message-ID: <20150605201110.GP3631@google.com>
References: <1433400131-18429-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1433400131-18429-43-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1433400131-18429-43-git-send-email-gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, aik-sLpHqDYs0B2HXe+LvDLADg@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 04, 2015 at 04:42:11PM +1000, Gavin Shan wrote:
> The patch intends to add standalone driver to support PCI hotplug
> for PowerPC PowerNV platform, which runs on top of skiboot firmware.
> The firmware identified hotpluggable slots and marked their device
> tree node with proper "ibm,slot-pluggable" and "ibm,reset-by-firmware".
> The driver simply scans device-tree to create/register PCI hotplug slot
> accordingly.
> 
> If the skiboot firmware doesn't support slot status retrieval, the PCI
> slot device node shouldn't have property "ibm,reset-by-firmware". In
> that case, none of valid PCI slots will be detected from device tree.
> The skiboot firmware doesn't export the capability to access attention
> LEDs yet and it's something for TBD.
> 
> Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

But I do have a few comments (my ack is valid whether you do anything with
them or not):

> +static void slot_power_off_handler(struct powernv_php_slot *slot)
> +{
> +	int ret;
> +
> +	/* Release the firmware data for the child device nodes */
> +	remove_child_pdn(slot->dn);
> +
> +	/*
> +	 * Release the child device nodes. If the sub-tree was
> +	 * built with the help of overlay, we just need revert
> +	 * the changes introduced by the overlay
> +	 */
> +	if (slot->overlay_id >= 0) {
> +		ret = of_overlay_destroy(slot->overlay_id);
> +		if (ret)
> +			pr_warn("%s: Error %d destroying overlay %d\n",
> +				__func__, ret, slot->overlay_id);

For this and similar messages: isn't there a device you can use with
dev_warn() here?  I think a device name would be much better than a
function name.

> +scan:
> +	switch (presence) {
> +	case POWERNV_PHP_SLOT_PRESENT:
> +		if (rescan) {
> +			pci_lock_rescan_remove();
> +			pcibios_add_pci_devices(slot->bus);

You didn't add this, but "pcibios_add_pci_devices" doesn't seem like the
right name.  "pcibios" generally refers to an arch-specific hook that's
called by the generic PCI core.  In this case, pcibios_add_pci_devices()
contains powerpc-specific code, and it's only called from powerpc code, so
I think using "pcibios_" in the name is a bit misleading.

> +	/* Remove all devices behind the slot */
> +	pci_lock_rescan_remove();
> +	pcibios_remove_pci_devices(slot->bus);

Same comment for pcibios_remove_pci_devices().  It would be better if the
name didn't suggest that this was part of the pcibios_ interface between
the PCI core and the arch code, because it's not.

> +	/* Slot indentifier */

s/indentifier/identifier/

> +	if (!php_slot_get_id(dn, &id))
> +		return NULL;
> +

> +	/* PCI bus */
> +	bus = pcibios_find_pci_bus(dn);

And pcibios_find_pci_bus() (it's also powerpc-specific).

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

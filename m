From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 21/45] powerpc/powernv: Create PEs at PCI hot plugging
 time
Date: Tue, 19 Apr 2016 14:16:42 +1000
Message-ID: <5715B12A.6020203@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-22-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-22-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> Currently, the PEs and their associated resources are assigned
> in ppc_md.pcibios_fixup() except those used by SRIOV VFs.

But this new code does not affect IOV and VF's PEs will still be created 
somewhere else rather than pnv_pci_setup_bridge()?


> The
> function is called for once after PCI probing and resources
> assignment is completed. So it isn't hotplug friendly.
>
> This creates PEs dynamically by ppc_md.pcibios_setup_bridge(), which
> is called on the event during system bootup and PCI hotplug: updating
> PCI bridge's windows after resource assignment/reassignment are done.
> For partial hotplug case, where not all PCI devices belonging to the
> PE are unplugged and plugged again, we just need unbinding/binding
> the affected PCI devices with the corresponding PE without creating
> new one.
>
> As there is no upstream bridge for root bus that needs to be covered
> by PE, we have to create PE for root bus in ppc_md.pcibios_setup_bridge()
> before any other PEs can be created, as PE for root bus is the ancestor
> to anyone else.

We did not need a root bus PE before? What is the other PE reserved for? 
Comments only say "reserved"...

>
> Also, the windows of root port or the upstream port of PCIe switch behind
> root port are extended to be PHB's apertures to accommodate the additional
> resources needed by newly plugged devices based on the fact: hotpluggable
> slot is behind root port or downstream port of the PCIe switch behind
> root port. The extension for those PCI brdiges' windows is done in
> ppc_md.pcibios_setup_bridge() as well.


This patch seems to be doing way too many things, hard to follow.

Could you please split the patch into smaller chunks? For example (you can 
do it totally different):
- move pnv_pci_ioda_setup_opal_tce_kill()
- move PE creation from pnv_pci_ioda_fixup() to pnv_pci_setup_bridge();
- add pnv_pci_fixup_bridge_resources()
- add an extra reserved PE for the root bus (and all this magic with 
root_pe_idx/root_pe_populated)
- ...




-- 
Alexey

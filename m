From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH v8 30/45] powerpc/pci: Delay populating pdn
Date: Tue, 19 Apr 2016 18:19:20 +1000
Message-ID: <5715EA08.3040901@ozlabs.ru>
References: <1455680668-23298-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1455680668-23298-31-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1455680668-23298-31-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, dja@axtens.net, bhelgaas@google.com, robherring2@gmail.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On 02/17/2016 02:44 PM, Gavin Shan wrote:
> The pdn (struct pci_dn) instances are allocated from memblock or
> bootmem when creating PCI controller (hoses) in setup_arch(). PCI
> hotplug, which will be supported by proceeding patches, releases
> PCI device nodes and their corresponding pdn on unplugging event.
> The memory chunks for pdn instances allocated from memblock or
> bootmem are hard to reused after being released.
>
> This delays creating pdn by pci_devs_phb_init() from setup_arch()
> to core_initcall() so that they are allocated from slab. The memory
> consumed by pdn can be released to system without problem during
> PCI unplugging time. It indicates that pci_dn is unavailable in
> setup_arch() and the the fixup on pdn (like AGP's) can't be carried
> out that time. We have to do that in ppc_md.pcibios_root_bridge_prepare()
> on maple/pasemi/powermac platforms where/when the pdn is available.
>
> At the mean while, the EEH device is created when pdn is populated,
> meaning pdn and EEH device have same life cycle. In turn, we needn't
> call eeh_dev_init() to create EEH device explicitly.
>
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>


Uff. It would not hurt to mention that  pcibios_root_bridge_prepare is 
called from subsys_initcall() which is executed after core_initcall() so 
the code flow does not change.

Have you checked if there is anything in between 
core_initcall(pci_devs_phb_init) and subsys_initcall(pcibios_init) which 
might need device tree nodes? For example, subsys_initcall(pcibios_init) 
calls (eventually) pnv_pci_ioda_fixup(), if we are unlucky and 
pcibios_init() (and therefore pnv_pci_ioda_fixup() or what pseries/others 
do) is called before pcibios_init() - won't we crash or something?




-- 
Alexey

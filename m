From: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] PCI: Add support to the Cadence PCIe controller
Date: Thu, 30 Nov 2017 21:05:12 +0100
Message-ID: <058b2025-f55d-9210-a979-d00972259987@free-electrons.com>
References: <cover.1511439189.git.cyrille.pitchen@free-electrons.com>
 <20171128155039.GA17154@red-moon>
 <8c6c50fc-47a9-7b93-d826-1dba9c4d09c2@ti.com>
 <20171130181819.GD12096@red-moon>
 <a02af401-2eb8-dc34-6f3c-092f04ec2636@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a02af401-2eb8-dc34-6f3c-092f04ec2636-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 30/11/2017 à 19:45, Cyrille Pitchen a écrit :
> Hi all,
> 
> Le 30/11/2017 à 19:18, Lorenzo Pieralisi a écrit :
>> On Thu, Nov 30, 2017 at 12:43:20PM +0530, Kishon Vijay Abraham I wrote:
>>
>> [...]
>>
>>>>> For linux-next, I applied this series on top of Kishon's patch
>>>>> ("PCI: endpoint: Use EPC's device in dma_alloc_coherent/dma_free_coherent")
>>>>> otherwise dma_alloc_coherent() fails when called by pci_epf_alloc_space().
>>>>>
>>>>> Also, I patched drivers/Makefile rather than drivers/pci/Makefile to make
>>>>> the drivers/pci/cadence/pcie-cadence-ep.o linked after
>>>
>>> The reason to patch drivers/Makefile should be because pcie-cadence-ep has to
>>> be compiled even when CONFIG_PCI is not enabled. CONFIG_PCI enables host
>>> specific features and ENDPOINT shouldn't depend on CONFIG_PCI.
>>>>> drivers/pci/endpoint/*.o objects, otherwise the built-in pci-cadence-ep
>>>>> driver would be probed before the PCI endpoint framework would have been
>>>>> initialized, which results in a kernel crash.
>>>>
>>>> Nice :( - isn't there a way to improve this (ie probe deferral or
>>>> registering the EPF bus earlier) ?
>>>>
>>>>> I guess this is the reason why the "pci/dwc" line was also put in
>>>>> drivers/Makefile, right after the "pci/endpoint" line.
>>>>
>>>> Or probably the other way around - see commit 5e8cb4033807
>>>>
>>>> @Kishon, thoughts ?
>>>
>>> Lorenzo, ordering Makefile is one way to initialize EP core before
>>
>> Makefile ordering is fragile, I do not like relying on it.
>>
>>> other drivers. the other way is to have PCI EP core have a different
>>> initcall level..  subsys_initcall??
>>
>> Yes, registering the bus at eg postcore_initcall() as PCI does should do
>> (if that's the problem this is solving) but still, the code must not
>> crash if the ordering is not correct, we have to fix this regardless.
>>
>> I would appreciate if Cyrille can debug the cause of the kernel crash
>> so that we can fix it in the longer term.
>>
> 
> I had the crash kernel few weeks ago hence I have to test again to confirm
> but if I remember correctly it was a NULL pointer dereferencing crash:
> 
> cdns_pcie_ep_probe()
> |
> +--> devm_pci_epc_create()
>      |
>      +--> __devm_pci_ep_create()
>           |
>           +--> __pci_epc_create()
> 	       |
> 	       +--> pci_ep_cfs_add_epc_group()
> 	            |
> 		    | /*
> 		    |  * Here controllers_group is still NULL because
> 		    |  * pci_ep_cfs_init() has not been called yet.
> 		    |  */
> 		    +--> configfs_register_group(controllers_group, ...)
> 		         |
> 			 +--> link_group()
> 			      /* Dereferencing NULL pointer */
> 
> Best regards,
> 
> Cyrille
>

I know it's far from perfect but what do you think or something like that:

---8<---------------------------------------------------------------------------
diff --git a/drivers/Makefile b/drivers/Makefile
index 27bdd98784d9..9757199b9a65 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -16,11 +16,7 @@ obj-$(CONFIG_PINCTRL)		+= pinctrl/
 obj-$(CONFIG_GPIOLIB)		+= gpio/
 obj-y				+= pwm/
 
-obj-$(CONFIG_PCI)		+= pci/
-obj-$(CONFIG_PCI_ENDPOINT)	+= pci/endpoint/
-obj-$(CONFIG_PCI_CADENCE)	+= pci/cadence/
-# PCI dwc controller drivers
-obj-y				+= pci/dwc/
+obj-y				+= pci/
 
 obj-$(CONFIG_PARISC)		+= parisc/
 obj-$(CONFIG_RAPIDIO)		+= rapidio/
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 3d5e047f0a32..4e57fe4499ce 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the PCI bus specific drivers.
 #
 
+ifdef CONFIG_PCI
 obj-y		+= access.o bus.o probe.o host-bridge.o remove.o pci.o \
 			pci-driver.o search.o pci-sysfs.o rom.o setup-res.o \
 			irq.o vpd.o setup-bus.o vc.o mmap.o setup-irq.o
@@ -54,3 +55,9 @@ ccflags-$(CONFIG_PCI_DEBUG) := -DDEBUG
 # PCI host controller drivers
 obj-y += host/
 obj-y += switch/
+endif
+
+obj-$(CONFIG_PCI_ENDPOINT)	+= endpoint/
+obj-$(CONFIG_PCI_CADENCE)	+= cadence/
+# PCI dwc controller drivers
+obj-y				+= dwc/
---8<---------------------------------------------------------------------------

I admit it doesn't solve the ordering issue but at least it cleans some mess
in drivers/Makefile. 

I agree with Lorenzo, we should avoid as much as we could to rely on the
link order.

However I faced another issue: code from pcie-cadence.c is used by both
pcie-cadence-host.c and pcie-cadence-ep.c so I had to find a way to compile
this shared file if at least one of the host and EPC driver was selected.

That's why I put source files in the cadence sub-directory and used the
single cadence/Makefile to regroup all the compilation rules, instead of
splitting them between pci/Makefile and pci/endpoint/Makefile and having to
add pcie-cadence.o in both Makefiles.

>> Thanks,
>> Lorenzo
>>
> 
> 


-- 
Cyrille Pitchen, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

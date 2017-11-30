From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/5] PCI: Add support to the Cadence PCIe controller
Date: Thu, 30 Nov 2017 12:43:20 +0530
Message-ID: <8c6c50fc-47a9-7b93-d826-1dba9c4d09c2@ti.com>
References: <cover.1511439189.git.cyrille.pitchen@free-electrons.com>
 <20171128155039.GA17154@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128155039.GA17154@red-moon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tuesday 28 November 2017 09:20 PM, Lorenzo Pieralisi wrote:
> On Thu, Nov 23, 2017 at 04:01:45PM +0100, Cyrille Pitchen wrote:
>> Hi all,
>>
>> this series of patches adds support to the Cadence PCIe controller.
>> It was tested on a ARM64 platform emulated by a Palladium running both
>> linux-next (next-20171123) and pci-next kernels.
>>
>> The host mode was tested with some PCIe devices connected to the Palladium
>> through a speed-bridge. Some of those devices were a USB host controller
>> and a SATA controller. The PCIe host controller was also tested with a
>> second controller configured in endpoint mode and connected back to back
>> to the first controller.
>>
>> The EndPoint Controller (EPC) driver of this series was tested with the
>> pci-epf-test.c EndPoint Function (EPF) driver and the pcitest userspace
>> program.
>>
>> For linux-next, I applied this series on top of Kishon's patch
>> ("PCI: endpoint: Use EPC's device in dma_alloc_coherent/dma_free_coherent")
>> otherwise dma_alloc_coherent() fails when called by pci_epf_alloc_space().
>>
>> Also, I patched drivers/Makefile rather than drivers/pci/Makefile to make
>> the drivers/pci/cadence/pcie-cadence-ep.o linked after

The reason to patch drivers/Makefile should be because pcie-cadence-ep has to
be compiled even when CONFIG_PCI is not enabled. CONFIG_PCI enables host
specific features and ENDPOINT shouldn't depend on CONFIG_PCI.
>> drivers/pci/endpoint/*.o objects, otherwise the built-in pci-cadence-ep
>> driver would be probed before the PCI endpoint framework would have been
>> initialized, which results in a kernel crash.
> 
> Nice :( - isn't there a way to improve this (ie probe deferral or
> registering the EPF bus earlier) ?
> 
>> I guess this is the reason why the "pci/dwc" line was also put in
>> drivers/Makefile, right after the "pci/endpoint" line.
> 
> Or probably the other way around - see commit 5e8cb4033807
> 
> @Kishon, thoughts ?

Lorenzo, ordering Makefile is one way to initialize EP core before other
drivers. the other way is to have PCI EP core have a different initcall level..
subsys_initcall??

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

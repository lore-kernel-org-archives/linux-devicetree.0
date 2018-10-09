From: Honghui Zhang <honghui.zhang@mediatek.com>
Subject: Re: [PATCH v6 0/9] PCI: mediatek: fixup find_port, enable_msi and
 add pm, module support
Date: Tue, 9 Oct 2018 09:44:13 +0800
Message-ID: <1539049453.6246.6.camel@mhfsdcap03>
References: <1538969088-7136-1-git-send-email-honghui.zhang@mediatek.com>
         <20181008173131.GN120535@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008173131.GN120535@bhelgaas-glaptop.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, ulf.hansson@linaro.org, marc.zyngier@arm.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, youlin.pei@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 2018-10-08 at 12:31 -0500, Bjorn Helgaas wrote:
> On Mon, Oct 08, 2018 at 11:24:39AM +0800, honghui.zhang@mediatek.com wrote:
> 
> > Honghui Zhang (9):
> >   PCI: mediatek: Using slot's devfn for compare to fix
> >     mtk_pcie_find_port logic
> >   PCI: mediatek: Fixup class ID for MT7622 as PCI_CLASS_BRIDGE_PCI
> >   PCI: mediatek: Remove the redundant dev->pm_domain check
> >   PCI: mediatek: Convert to use pci_host_probe()
> >   PCI: mediatek: Move the mtk_pcie_startup_port_v2 function's define
> >     after mtk_pcie_setup_irq
> >   PCI: mediatek: Fixup enable msi logic by enable msi after clock
> >     enabled
> 
> s/msi/MSI/ (twice)
> 
> >   PCI: mediatek: Add system pm support for MT2712 and MT7622
> 
> s/pm/PM/
> 
> "msi" and "pm" are not English words, and capitalizing them tells the
> reader that they are acronyms or initialisms (like GIC and IRQ below).
> 

Thanks for the comments. Will fix those in the next version.

thanks.

> >   PCI: mediatek: Save the GIC IRQ in mtk_pcie_port
> >   PCI: mediatek: Add loadable kernel module support

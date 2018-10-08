From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 0/9] PCI: mediatek: fixup find_port, enable_msi and
 add pm, module support
Date: Mon, 8 Oct 2018 12:31:31 -0500
Message-ID: <20181008173131.GN120535@bhelgaas-glaptop.roam.corp.google.com>
References: <1538969088-7136-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538969088-7136-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, ulf.hansson@linaro.org, marc.zyngier@arm.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, youlin.pei@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 08, 2018 at 11:24:39AM +0800, honghui.zhang@mediatek.com wrote:

> Honghui Zhang (9):
>   PCI: mediatek: Using slot's devfn for compare to fix
>     mtk_pcie_find_port logic
>   PCI: mediatek: Fixup class ID for MT7622 as PCI_CLASS_BRIDGE_PCI
>   PCI: mediatek: Remove the redundant dev->pm_domain check
>   PCI: mediatek: Convert to use pci_host_probe()
>   PCI: mediatek: Move the mtk_pcie_startup_port_v2 function's define
>     after mtk_pcie_setup_irq
>   PCI: mediatek: Fixup enable msi logic by enable msi after clock
>     enabled

s/msi/MSI/ (twice)

>   PCI: mediatek: Add system pm support for MT2712 and MT7622

s/pm/PM/

"msi" and "pm" are not English words, and capitalizing them tells the
reader that they are acronyms or initialisms (like GIC and IRQ below).

>   PCI: mediatek: Save the GIC IRQ in mtk_pcie_port
>   PCI: mediatek: Add loadable kernel module support

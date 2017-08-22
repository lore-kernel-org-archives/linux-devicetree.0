From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 0/3] PCI: mediatek: Add MSI support for MT2712 and
 MT7622
Date: Tue, 22 Aug 2017 16:36:03 -0500
Message-ID: <20170822213602.GK6948@bhelgaas-glaptop.roam.corp.google.com>
References: <1502715868-17651-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502715868-17651-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 09:04:25PM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> MT2712 and MT7622's PCIe host controller support MSI, but only 32bit MSI
> address are supportted. It connect to GIC with the same IRQ number of INTx
> IRQ, so it shares the same IRQ with INTx IRQ.
> 
> This patchset add MSI support for MT2712 and MT7622.
> Also do some code fixup and cleanups.
> 
> Change Since V1:
>  - Add the first two patches into this patchset.
>  - Using -ENODEV instead of PTR_ERR if msi_domain == NULL
>  - Change the error logs with consistency of lower-case
>  - Using has_msi instead of support_msi to make the parameter name a bit shorter
> 
> Honghui Zhang (3):
>   PCI: mediatek: Fix return value in case of error
>   PCI: mediatek: take use of bus->sysdata to get host private data
>   PCI: mediatek: add msi support for MT2712 and MT7622
> 
>  drivers/pci/host/pcie-mediatek.c | 157 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 151 insertions(+), 6 deletions(-)

Just waiting for an ack from Ryder...

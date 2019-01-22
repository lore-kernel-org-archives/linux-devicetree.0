From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [v1,0/2] PCI: mediatek: Add support for MT7629
Date: Tue, 22 Jan 2019 11:23:52 +0800
Message-ID: <1548127432.11442.1.camel@mtkswgap22>
References: <1548069062-12430-1-git-send-email-jianjun.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548069062-12430-1-git-send-email-jianjun.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, lorenzo.pieralisi@arm.com, mark.rutland@arm.com, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, honghui.zhang@mediatek.com, youlin.pei@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 2019-01-21 at 19:11 +0800, Jianjun Wang wrote:
> These series patches modify pcie-mediatek.c and dt-bindings compatible
> string to support MT7629 PCIe host.
> 
> Jianjun Wang (2):
>   dt-bindings: PCI: Add support for MT7629
>   PCI: mediatek: Add controller support for MT7629
> 
>  .../devicetree/bindings/pci/mediatek-pcie.txt |  1 +
>  drivers/pci/controller/pcie-mediatek.c        | 28 +++++++++++++++++++
>  include/linux/pci_ids.h                       |  1 +
>  3 files changed, 30 insertions(+)
> 

Acked-by: Ryder Lee <ryder.lee@mediatek.com>

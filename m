From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 0/4] Cleanup un-used variant and un-used property for
 MediaTek PCIe
Date: Tue, 18 Dec 2018 13:52:51 +0000
Message-ID: <20181218135251.GA3560@e107981-ln.cambridge.arm.com>
References: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544750742-31419-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com, matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, youlin.pei@mediatek.com, jianjun.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 09:25:38AM +0800, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> The "num-lanes" property in MediaTek's PCIe device node is not used by
> its driver or anyone else, cleanup those related code.
> 
> Honghui Zhang (4):
>   PCI: mediatek: Remove un-used variant in struct mtk_pcie_port
>   dt-bindings: PCI: MediaTek: Remove un-used property
>   arm: dts: mt7623: Remove un-used property for PCIe
>   arm64: dts: mt7622: Remove un-used property for PCIe
> 
>  Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 8 --------
>  arch/arm/boot/dts/mt7623.dtsi                           | 3 ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi                | 2 --
>  drivers/pci/controller/pcie-mediatek.c                  | 8 --------
>  4 files changed, 21 deletions(-)

Applied to pci/mediatek for v4.21, thanks.

Lorenzo

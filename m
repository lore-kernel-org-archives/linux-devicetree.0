From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: PCI: rename and cleanup MediaTek
 binding text
Date: Thu, 3 Aug 2017 17:17:28 -0500
Message-ID: <20170803221728.GM20308@bhelgaas-glaptop.roam.corp.google.com>
References: <cover.1501122135.git.honghui.zhang@mediatek.com>
 <309532ded49d3452a609116d1c421d820bea74e4.1501122135.git.honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <309532ded49d3452a609116d1c421d820bea74e4.1501122135.git.honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com
Cc: bhelgaas@google.com, robh@kerenl.org, robh+dt@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com, youlin.pei@mediatek.com, hongkun.cao@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com, yt.shen@mediatek.com, yong.wu@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 10:58:37AM +0800, honghui.zhang@mediatek.com wrote:
> From: Ryder Lee <ryder.lee@mediatek.com>
> 
> In order to accommodate other SoC generations, this patch updates filename
> to make it more generic, regroups specific properties by SoCs, and removes
> redundant descriptions.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  ...{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} | 29 +++++++++++-----------
>  1 file changed, 14 insertions(+), 15 deletions(-)
>  rename Documentation/devicetree/bindings/pci/{mediatek,mt7623-pcie.txt => mediatek-pcie.txt} (91%)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> similarity index 91%
> rename from Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
> rename to Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> index fe80dda..a968f25 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7623-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
> @@ -1,18 +1,13 @@
> -MediaTek Gen2 PCIe controller which is available on MT7623 series SoCs
> -
> -PCIe subsys supports single root complex (RC) with 3 Root Ports. Each root
> -ports supports a Gen2 1-lane Link and has PIPE interface to PHY.
> +MediaTek Gen2 PCIe controller
>  
>  Required properties:
> -- compatible: Should contain "mediatek,mt7623-pcie".
> +- compatible: Should contain one of the following string:

s/string/strings/

> +	"mediatek,mt2701-pcie"
> +	"mediatek,mt7623-pcie"

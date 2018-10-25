From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: pci: layerscape-pci: removed
 compatible  string "snps,dw-pcie"
Date: Thu, 25 Oct 2018 16:51:37 -0500
Message-ID: <20181025215137.GA14643@bogus>
References: <20181025094929.29481-1-Zhiqiang.Hou@nxp.com>
 <20181025094929.29481-3-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025094929.29481-3-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, 25 Oct 2018 09:49:39 +0000, "Z.q. Hou" wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Removed the compatible string "snps,dw-pcie", it is for the reference
> platform driver for PCI RC IP Protoyping Kits based on the ARC SDP,
> so it is not suitable for all platform with designware PCIe controller,
> and platform vendors have themselves' drivers.
> 
> The compatible string "snsp,dw-pcie" was added by mistake and it's not
> matched that time, but it is matched because PCIe drivers has been
> collected recently.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - Improved the subject.
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCHv3 0/4] dts/layerscape-pci: removed unsuitable compatible
 string
Date: Mon, 19 Nov 2018 20:01:25 +0800
Message-ID: <20181119120123.GQ5829@dragon>
References: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2018 at 05:35:12AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Removed the compatible string "snps,dw-pcie" from FSL layerscape-pci compatible
> string list.
> 
> Hou Zhiqiang (4):
>   dt-bindings: pci: layerscape-pci: add compatible strings
>     "fsl,ls1043a-pcie"
>   dt-bindings: pci: layerscape-pci: removed compatible string
>     "snps,dw-pcie"
>   ARM: dts: ls1021a: removed compatible string "snps,dw-pcie"
>   arm64: dts: layerscape: removed compatible string "snps,dw-pcie"

Applied all, thanks.

From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 1/4] dt-bingings: PCI: Remove the num-lanes from Required
 properties
Date: Mon, 19 Aug 2019 14:20:29 -0500
Message-ID: <20190819192029.GS253360@google.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
 <20190812042435.25102-2-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812042435.25102-2-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

In subject:

  s/dt-bingings/dt-bindings/

Also, possibly

  s/PCI:/PCI: designware:/

since this only applies to designware-pcie.txt.

On Mon, Aug 12, 2019 at 04:22:16AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> The num-lanes is not a mandatory property, e.g. on FSL
> Layerscape SoCs, the PCIe link training is completed
> automatically base on the selected SerDes protocol, it
> doesn't need the num-lanes to set-up the link width.
> 
> It has been added in the Optional properties. This
> patch is to remove it from the Required properties.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index 5561a1c060d0..bd880df39a79 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -11,7 +11,6 @@ Required properties:
>  	     the ATU address space.
>      (The old way of getting the configuration address space from "ranges"
>      is deprecated and should be avoided.)
> -- num-lanes: number of lanes to use
>  RC mode:
>  - #address-cells: set to <3>
>  - #size-cells: set to <2>
> -- 
> 2.17.1
> 

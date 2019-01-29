From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 1/4] dt-bindings: add DT binding for the layerscape
 PCIe controller with EP mode
Date: Tue, 29 Jan 2019 12:06:21 +0000
Message-ID: <20190129120621.GB7467@e107981-ln.cambridge.arm.com>
References: <20190121094500.10657-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121094500.10657-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>, robh+dt@kernel.org
Cc: bhelgaas@google.com, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, cyrille.pitchen@free-electrons.com, pombredanne@nexb.com, shawn.lin@rock-chips.com, niklas.cassel@axis.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Rob,

Is it OK for you if I pull this series into the pci tree ?

Please let me know, thanks.

Lorenzo

On Mon, Jan 21, 2019 at 05:44:57PM +0800, Xiaowei Bao wrote:
> Add the documentation for the Device Tree binding for the layerscape PCIe
> controller with EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Reviewed-by: Minghuan Lian <minghuan.lian@nxp.com>
> Reviewed-by: Zhiqiang Hou <zhiqiang.hou@nxp.com>
> ---
> v2:
>  - Add the SoC specific compatibles.
> v3:
>  - modify the commit message.
> v4:
>  - no change.
> v5:
>  - no change.
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt     |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index 9b2b8d6..e20ceaa 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -13,6 +13,7 @@ information.
>  
>  Required properties:
>  - compatible: should contain the platform identifier such as:
> +  RC mode:
>          "fsl,ls1021a-pcie"
>          "fsl,ls2080a-pcie", "fsl,ls2085a-pcie"
>          "fsl,ls2088a-pcie"
> @@ -20,6 +21,8 @@ Required properties:
>          "fsl,ls1046a-pcie"
>          "fsl,ls1043a-pcie"
>          "fsl,ls1012a-pcie"
> +  EP mode:
> +	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
>  - reg: base addresses and lengths of the PCIe controller register blocks.
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> -- 
> 1.7.1
> 

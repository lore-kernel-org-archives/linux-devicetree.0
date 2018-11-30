From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv2 3/6] PCI: layerscape: Add the EP mode support
Date: Fri, 30 Nov 2018 10:55:12 +0000
Message-ID: <20181130105512.GB17598@e107981-ln.cambridge.arm.com>
References: <20181105084653.26597-1-xiaowei.bao@nxp.com>
 <20181105084653.26597-3-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181105084653.26597-3-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, cyrille.pitchen@free-electrons.com, pombredanne@nexb.com, shawn.lin@rock-chips.com, niklas.cassel@axis.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 05, 2018 at 04:46:50PM +0800, Xiaowei Bao wrote:
> Add the EP mode support.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Add the SoC specific compatibles.
> 
>  .../devicetree/bindings/pci/layerscape-pci.txt     |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Wrong commit $SUBJECT, this is not PCI code, it is a DT binding
update, I will have a look at the rest of the series to see if I
can update this patch or you will do it with the next respin.

Lorenzo

> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index 66df1e8..9c090c7 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -13,12 +13,15 @@ information.
>  
>  Required properties:
>  - compatible: should contain the platform identifier such as:
> +  RC mode:
>          "fsl,ls1021a-pcie", "snps,dw-pcie"
>          "fsl,ls2080a-pcie", "fsl,ls2085a-pcie", "snps,dw-pcie"
>          "fsl,ls2088a-pcie"
>          "fsl,ls1088a-pcie"
>          "fsl,ls1046a-pcie"
>          "fsl,ls1012a-pcie"
> +  EP mode:
> +        "fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
>  - reg: base addresses and lengths of the PCIe controller register blocks.
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> -- 
> 1.7.1
> 

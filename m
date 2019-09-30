From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: Add DT binding for PCIE GEN4 EP of the
 layerscape
Date: Mon, 30 Sep 2019 17:22:21 -0500
Message-ID: <20190930222221.GA13251@bogus>
References: <20190916021742.22844-1-xiaowei.bao@nxp.com>
 <20190916021742.22844-3-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190916021742.22844-3-xiaowei.bao@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, linux-kernel@vger.kernel.org, kishon@ti.com, Minghuan.Lian@nxp.com, linux-arm-kernel@lists.infradead.org, bhelgaas@google.com, andrew.murray@arm.com, leoyang.li@nxp.com, shawnguo@kernel.org, mingkai.hu@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 10:17:38AM +0800, Xiaowei Bao wrote:
> Add the documentation for the Device Tree binding of the layerscape
> PCIe GEN4 controller with EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  .../bindings/pci/layerscape-pcie-gen4.txt          | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt b/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> index b40fb5d..414a86c 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> @@ -3,6 +3,8 @@ NXP Layerscape PCIe Gen4 controller
>  This PCIe controller is based on the Mobiveil PCIe IP and thus inherits all
>  the common properties defined in mobiveil-pcie.txt.
>  
> +HOST MODE
> +=========
>  Required properties:
>  - compatible: should contain the platform identifier such as:
>    "fsl,lx2160a-pcie"
> @@ -23,7 +25,20 @@ Required properties:
>  - msi-parent : See the generic MSI binding described in
>    Documentation/devicetree/bindings/interrupt-controller/msi.txt.
>  
> -Example:
> +DEVICE MODE
> +=========
> +Required properties:
> +- compatible: should contain the platform identifier such as:
> +  "fsl,lx2160a-pcie-ep"
> +- reg: base addresses and lengths of the PCIe controller register blocks.
> +  "regs": PCIe controller registers.
> +  "addr_space" EP device CPU address.
> +- apio-wins: number of requested apio outbound windows.
> +
> +Optional Property:
> +- max-functions: Maximum number of functions that can be configured (default 1).
> +
> +RC Example:
>  
>  	pcie@3400000 {
>  		compatible = "fsl,lx2160a-pcie";
> @@ -50,3 +65,14 @@ Example:
>  				<0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>  				<0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> +
> +EP Example:
> +
> +	pcie_ep@3400000 {

pcie-endpoint@...

> +		compatible = "fsl,lx2160a-pcie-ep";
> +		reg = <0x00 0x03400000 0x0 0x00100000
> +		       0x80 0x00000000 0x8 0x00000000>;
> +		reg-names = "regs", "addr_space";
> +		apio-wins = <8>;
> +		status = "disabled";

Don't show status in examples.

> +	};
> -- 
> 2.9.5
> 

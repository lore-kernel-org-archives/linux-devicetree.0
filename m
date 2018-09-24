From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 13/40] dt-bindings: PCI: keystone: Add "reg-names"
 binding information
Date: Mon, 24 Sep 2018 16:00:33 -0700
Message-ID: <5baa1b0e.1c69fb81.4f57b.32f7@mx.google.com>
References: <20180921102155.22839-1-kishon@ti.com>
 <20180921102155.22839-14-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180921102155.22839-14-kishon@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Joao Pinto <Joao.Pinto@synopsys.com>, devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Gustavo.Pimentel@synopsys.com, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21, 2018 at 03:51:28PM +0530, Kishon Vijay Abraham I wrote:
> Add "reg-names" binding information in order for device tree node
> to be populated with the correct register strings.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/devicetree/bindings/pci/pci-keystone.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-keystone.txt b/Documentation/devicetree/bindings/pci/pci-keystone.txt
> index 2030ee0dc4f9..3a551687cfa2 100644
> --- a/Documentation/devicetree/bindings/pci/pci-keystone.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-keystone.txt
> @@ -12,8 +12,10 @@ described here as well as properties that are not applicable.
>  Required Properties:-
>  
>  compatibility: "ti,keystone-pcie"
> -reg:	index 1 is the base address and length of DW application registers.
> -	index 2 is the base address and length of PCI device ID register.
> +reg: Three register ranges as listed in the reg-names property
> +reg-names: "dbics" for the DesignWare PCIe registers, "app" for the
> +	   TI specific application registers, "config" for the
> +	   configuration space address

This doesn't doesn't look like a compatible change.

>  
>  pcie_msi_intc : Interrupt controller device node for MSI IRQ chip
>  	interrupt-cells: should be set to 1
> -- 
> 2.17.1
> 

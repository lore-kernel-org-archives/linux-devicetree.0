From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Tue, 18 Dec 2018 09:15:33 -0600
Message-ID: <20181218151533.GA2922@bogus>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181218040702.29231-4-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 08:07:02PM -0800, Andrey Smirnov wrote:
> Add code needed to support i.MX8MQ variant.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> ---
>  .../bindings/pci/fsl,imx6q-pcie.txt           |  6 +-
>  drivers/pci/controller/dwc/Kconfig            |  4 +-
>  drivers/pci/controller/dwc/pci-imx6.c         | 82 ++++++++++++++++++-
>  3 files changed, 87 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index d514c1f2365f..1a10c313e8d7 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	- "fsl,imx6sx-pcie",
>  	- "fsl,imx6qp-pcie"
>  	- "fsl,imx7d-pcie"
> +	- "fsl,imx8mq-pcie"
>  - reg: base address and length of the PCIe controller
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> @@ -45,7 +46,7 @@ Additional required properties for imx6sx-pcie:
>    PCIE_PHY power domains
>  - power-domain-names: Must be "pcie", "pcie_phy"
>  
> -Additional required properties for imx7d-pcie:
> +Additional required properties for imx7d-pcie and imx8mq-pcie:
>  - power-domains: Must be set to a phandle pointing to PCIE_PHY power domain
>  - resets: Must contain phandles to PCIe-related reset lines exposed by SRC
>    IP block
> @@ -54,6 +55,9 @@ Additional required properties for imx7d-pcie:
>  	       - "apps"
>  	       - "turnoff"
>  
> +Additional required properties for imx8mq-pcie:
> +- fsl,controller-id: Logical ID of a given PCIE controller. PCIE1 is 0, PCIE2 is 1;
> +

Remove this.

If GPR register offset is what you need, then put that into DT. 
Typically, we'd have a property with iomuxc phandle and offset.

Rob

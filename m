From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/4] PCI: imx6: Add support for i.MX8MQ
Date: Fri, 11 Jan 2019 13:53:02 -0600
Message-ID: <20190111195302.GA18985@bogus>
References: <20190104165335.13205-1-andrew.smirnov@gmail.com>
 <20190104165335.13205-5-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190104165335.13205-5-andrew.smirnov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com, Bjorn Helgaas <bhelgaas@google.com>, Leonard Crestez <leonard.crestez@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 04, 2019 at 08:53:35AM -0800, Andrey Smirnov wrote:
> Add code needed to support i.MX8MQ variant.
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh@kernel.org>,
> Cc: devicetree@vger.kernel.org,
> Cc: linux-imx@nxp.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  .../bindings/pci/fsl,imx6q-pcie.txt           |  3 +-
>  drivers/pci/controller/dwc/Kconfig            |  4 +-
>  drivers/pci/controller/dwc/pci-imx6.c         | 77 ++++++++++++++++++-
>  3 files changed, 79 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> index d514c1f2365f..920ca93870a8 100644
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
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 6aafec3fad00..83ea318ad989 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -89,8 +89,8 @@ config PCI_EXYNOS
>  	select PCIE_DW_HOST
>  
>  config PCI_IMX6
> -	bool "Freescale i.MX6/7 PCIe controller"
> -	depends on SOC_IMX6Q || SOC_IMX7D || (ARM && COMPILE_TEST)
> +	bool "Freescale i.MX6/7/8 PCIe controller"
> +	depends on SOC_IMX6Q || SOC_IMX7D || (ARM64 && ARCH_MXC) || ((ARM || ARM64) && COMPILE_TEST)

Since you added the ifdef around the abort handler, I think you can drop 
"(ARM || ARM64)" and enable building other arches.

Rob

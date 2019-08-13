From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: PCI: Add Amazon's Annapurna Labs
 PCIe host bridge binding
Date: Tue, 13 Aug 2019 09:30:46 -0600
Message-ID: <20190813153046.GA31480@bogus>
References: <20190723092529.11310-1-jonnyc@amazon.com>
 <20190723092711.11786-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723092711.11786-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mark.rutland@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 12:27:08PM +0300, Jonathan Chocron wrote:
> Document Amazon's Annapurna Labs PCIe host bridge.
> 
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  .../devicetree/bindings/pci/pcie-al.txt       | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  3 +-
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt b/Documentation/devicetree/bindings/pci/pcie-al.txt
> new file mode 100644
> index 000000000000..89876190eb5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
> @@ -0,0 +1,45 @@
> +* Amazon Annapurna Labs PCIe host bridge
> +
> +Amazon's Annapurna Labs PCIe Host Controller is based on the Synopsys DesignWare
> +PCI core.
> +It shares common functions with the PCIe DesignWare core driver and inherits

Driver details are irrelevant to the binding.

> +common properties defined in Documentation/devicetree/bindings/pci/designware-pcie.txt.
> +Properties of the host controller node that differ from it are:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: Value should contain
> +			- "amazon,al-pcie"

Needs to be SoC specific.

> +
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: Register ranges as listed in the reg-names property
> +
> +- reg-names:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: Must include the following entries
> +			- "config"	PCIe ECAM space
> +			- "controller"	AL proprietary registers
> +			- "dbi"		Designware PCIe registers
> +
> +Example:
> +
> +	pcie-external0: pcie@fb600000 {
> +		compatible = "amazon,al-pcie";
> +		reg = <0x0 0xfb600000 0x0 0x00100000
> +		       0x0 0xfd800000 0x0 0x00010000
> +		       0x0 0xfd810000 0x0 0x00001000>;
> +		reg-names = "config", "controller", "dbi";
> +		bus-range = <0 255>;
> +		device_type = "pci";
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		#interrupt-cells = <1>;
> +		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-map-mask = <0x00 0 0 7>;
> +		interrupt-map = <0x0000 0 0 1 &gic GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>; /* INTa */
> +		ranges = <0x02000000 0x0 0xc0010000 0x0 0xc0010000 0x0 0x07ff0000>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5a6137df3f0e..29cca14a05a6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12201,10 +12201,11 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/
>  S:	Supported
>  F:	drivers/pci/controller/
>  
> -PCIE DRIVER FOR ANNAPURNA LABS
> +PCIE DRIVER FOR AMAZON ANNAPURNA LABS
>  M:	Jonathan Chocron <jonnyc@amazon.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/pcie-al.txt
>  F:	drivers/pci/controller/dwc/pcie-al.c
>  
>  PCIE DRIVER FOR AMLOGIC MESON
> -- 
> 2.17.1
> 
